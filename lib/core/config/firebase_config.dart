abstract class FirebaseConfig {
  String get serverClientId;
  String get webClientId;
}

class DevelopmentFirebaseConfig implements FirebaseConfig {
  @override
  String get serverClientId =>
      '296067030491-0ncotgdgqlf1ll95qnpfu8qau8i7uu0m.apps.googleusercontent.com';
  @override
  String get webClientId => serverClientId;
}

class ProductionFirebaseConfig implements FirebaseConfig {
  @override
  String get serverClientId =>
      '473958023495-iif9c856isvrlitbapia9oaj7u838us6.apps.googleusercontent.com';
  @override
  String get webClientId => serverClientId;
}
