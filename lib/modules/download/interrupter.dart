import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:logging/logging.dart';

const _reqPortName = 'download.interrupt.req';
const _ackPortName = 'download.interrupt.ack';

String _getAckPortName(int galleryId) {
  return '$_ackPortName.$galleryId';
}

class DownloadInterruptListener {
  DownloadInterruptListener(
    FutureOr<dynamic> Function(int) handler,
  ) : _port = ReceivePort() {
    _port.listen((message) async {
      final galleryId = message as int;
      final ackPortName = _getAckPortName(galleryId);
      final ackPort = IsolateNameServer.lookupPortByName(ackPortName);

      await Future.sync(() => handler(galleryId));
      ackPort?.send(null);
    });

    IsolateNameServer.registerPortWithName(_port.sendPort, _reqPortName);
  }

  final ReceivePort _port;

  void close() {
    _port.close();
    IsolateNameServer.removePortNameMapping(_reqPortName);
  }
}

class DownloadInterrupter {
  static final _log = Logger('DownloadInterrupter');

  Future<void> interrupt(int galleryId) async {
    _log.fine('interrupt: $galleryId');

    final reqPort = IsolateNameServer.lookupPortByName(_reqPortName);

    if (reqPort == null) {
      _log.finer('Cannot find req port');
      return;
    }

    final ackPort = ReceivePort();
    final ackPortName = _getAckPortName(galleryId);

    try {
      _log.finer('Register ack port');
      IsolateNameServer.removePortNameMapping(ackPortName);
      IsolateNameServer.registerPortWithName(ackPort.sendPort, ackPortName);

      _log.finer('Send req: $galleryId');
      reqPort.send(galleryId);

      await ackPort.first;
      _log.finer('Received ack: $galleryId');
    } finally {
      IsolateNameServer.removePortNameMapping(ackPortName);
      ackPort.close();
    }
  }

  Future<void> interruptAll() async {
    // TODO: Interrupt all tasks
  }
}
