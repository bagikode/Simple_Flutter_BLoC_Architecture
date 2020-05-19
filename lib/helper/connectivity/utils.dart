import 'dart:async';

import 'package:connectivity/connectivity.dart';

StreamTransformer<ConnectivityResult, ConnectivityResult> debounce(
    Duration debounceDuration,
    ) {
  bool _seenFirstData = false;
  Timer _debounceTimer;

  return StreamTransformer<ConnectivityResult, ConnectivityResult>.fromHandlers(
    handleData: (data, sink) {
      if (_seenFirstData) {
        _debounceTimer?.cancel();
        _debounceTimer = Timer(debounceDuration, () => sink.add(data));
      } else {
        sink.add(data);
        _seenFirstData = true;
      }
    },
    handleDone: (sink) {
      _debounceTimer?.cancel();
      sink.close();
    },
  );
}

StreamTransformer<ConnectivityResult, ConnectivityResult> startsWith(
    ConnectivityResult data,
    ) {
  return StreamTransformer<ConnectivityResult, ConnectivityResult>(
        (
        input,
        cancelOnError,
        ) {
      StreamController<ConnectivityResult> controller;
      StreamSubscription<ConnectivityResult> subscription;

      controller = StreamController<ConnectivityResult>(
        sync: true,
        onListen: () => controller?.add(data),
        onPause: ([resumeSignal]) =>
            subscription.pause(resumeSignal),
        onResume: () => subscription.resume(),
        onCancel: () => subscription.cancel(),
      );

      subscription = input.listen(
        controller.add,
        onError: controller.addError,
        onDone: controller.close,
        cancelOnError: cancelOnError,
      );

      return controller.stream.listen(null);
    },
  );
}