import 'dart:async';

import 'package:connectivity/connectivity.dart';

/// Updates the app's connectivity status continuosly. 
/// After creating an instance you can get the current status by calling [currentStatus].
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult? _result;

  final StreamController<bool> _connectivityStreamController = StreamController<bool>.broadcast();
  Stream<bool> get connectivityStream => _connectivityStreamController.stream;

  ConnectivityService() {
    _init();
  }

  void cancel() => _connectivitySubscription.cancel();

  /// Initiailizes [_result] with the current connectivity status and 
  /// sets up the [onConnectivityChanged] listener to update [_result].
  Future<void> _init() async {
    try {
      _result = await _connectivity.checkConnectivity();
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(updateStatus);
    } catch (e) {
      print('ConnectivityService _init ERROR: $e');
    }
  }

  void updateStatus(ConnectivityResult result) {
    print('Connectivity status changed from $_result to $result');
    _result = result;
    _connectivityStreamController.add(result != ConnectivityResult.none);
  }

  Future<ConnectivityResult?> get currentStatus async { 
    if (_result == null) {
      await _init();
    }

    return _result;
  }

  Future<bool> get hasConnection async => await currentStatus != ConnectivityResult.none; 
}