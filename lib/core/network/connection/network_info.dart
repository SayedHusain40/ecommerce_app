import 'package:data_connection_checker_tv/data_connection_checker.dart';

// Here i made it abstract because if in future i want to change the way i check connection
// (like using connectivity_plus) i can just implement this interface without changing the code in repository

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;
  const NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}