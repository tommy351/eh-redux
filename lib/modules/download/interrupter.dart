import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:async/async.dart';
import 'package:logging/logging.dart';

const _reqPortName = 'download.interrupt.req';
const _ackPortName = 'download.interrupt.ack';

String _getAckPortName(int galleryId) {
  return '$_ackPortName.$galleryId';
}

class DownloadInterruptListener {
  DownloadInterruptListener({
    required this.onInterrupt,
    required this.onInterruptAll,
  }) : _port = ReceivePort() {
    _port.listen((message) {
      _log.fine('Received: $message');
      _futureGroup.add(_handleRequest(message as int));
    });

    _log.finer('Remove req port mapping: $_reqPortName');
    IsolateNameServer.removePortNameMapping(_reqPortName);

    _log.finer('Register req port: $_reqPortName');
    IsolateNameServer.registerPortWithName(_port.sendPort, _reqPortName);
  }

  static final _log = Logger('DownloadInterruptListener');

  final FutureOr<dynamic> Function(int) onInterrupt;
  final FutureOr<dynamic> Function() onInterruptAll;

  final ReceivePort _port;
  final _futureGroup = FutureGroup<void>();

  Future<void> close() async {
    _log.fine('close');

    _log.finer('Remove req port mapping: $_reqPortName');
    IsolateNameServer.removePortNameMapping(_reqPortName);

    _log.finer('Close req port');
    _port.close();

    _log.finer('Close future group');
    _futureGroup.close();

    _log.finer('Wait for future group to be done');
    await _futureGroup.future;
  }

  Future<void> _handleRequest(int galleryId) async {
    final ackPortName = _getAckPortName(galleryId);
    final ackPort = IsolateNameServer.lookupPortByName(ackPortName);

    if (galleryId > 0) {
      await Future.sync(() => onInterrupt(galleryId));
    } else {
      await Future.sync(onInterruptAll);
    }

    _log.finer('Send ack to: $ackPortName');
    ackPort?.send(null);
  }
}

class DownloadInterrupter {
  static final _log = Logger('DownloadInterrupter');

  SendPort? get _reqPort => IsolateNameServer.lookupPortByName(_reqPortName);

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
      _reqPort?.send(galleryId);

      await ackPort.first;
      _log.finer('Received ack: $galleryId');
    } finally {
      _log.finer('Remove ack port name mapping: $ackPortName');
      IsolateNameServer.removePortNameMapping(ackPortName);

      _log.finer('Close ack port');
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
