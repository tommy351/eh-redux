import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

const _reqPortName = 'download.interrupt.req';
const _ackPortName = 'download.interrupt.ack';

String _getAckPortName(int galleryId) {
  return '$_ackPortName.$galleryId';
}

class DownloadInterruptListener {
  DownloadInterruptListener({
    @required FutureOr<dynamic> Function(int) onInterrupt,
    @required FutureOr<dynamic> Function() onInterruptAll,
  }) : _port = ReceivePort() {
    _port.listen((message) async {
      _log.fine('Received: $message');

      final galleryId = message as int;
      final ackPortName = _getAckPortName(galleryId);
      final ackPort = IsolateNameServer.lookupPortByName(ackPortName);

      if (galleryId > 0) {
        await Future.sync(() => onInterrupt(galleryId));
      } else {
        await Future.sync(onInterruptAll);
      }

      _log.finer('Send ack to: $ackPortName');
      ackPort?.send(null);
    });

    IsolateNameServer.registerPortWithName(_port.sendPort, _reqPortName);
  }

  static final _log = Logger('DownloadInterruptListener');

  final ReceivePort _port;

  void close() {
    _port.close();
    IsolateNameServer.removePortNameMapping(_reqPortName);
  }
}

class DownloadInterrupter {
  static final _log = Logger('DownloadInterrupter');

  SendPort get _reqPort => IsolateNameServer.lookupPortByName(_reqPortName);

  bool get isListening => _reqPort != null;

  Future<void> _interrupt(int galleryId) async {
    if (_reqPort == null) {
      _log.finer('Cannot find req port');
      return;
    }

    final ackPort = ReceivePort();
    final ackPortName = _getAckPortName(galleryId);

    try {
      _log.finer('Register ack port: $ackPortName');
      IsolateNameServer.removePortNameMapping(ackPortName);
      IsolateNameServer.registerPortWithName(ackPort.sendPort, ackPortName);

      _log.finer('Send req: $galleryId');
      _reqPort.send(galleryId);

      await ackPort.first;
      _log.finer('Received ack: $galleryId');
    } finally {
      IsolateNameServer.removePortNameMapping(ackPortName);
      ackPort.close();
    }
  }

  Future<void> interrupt(int galleryId) {
    assert(galleryId > 0);
    _log.fine('interrupt: $galleryId');
    return _interrupt(galleryId);
  }

  Future<void> interruptAll() {
    _log.fine('interruptAll');
    return _interrupt(-1);
  }
}
