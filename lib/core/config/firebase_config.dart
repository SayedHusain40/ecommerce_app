abstract class FirebaseConfig {
  String get serverClientId;
}

class DevelopmentFirebaseConfig implements FirebaseConfig {
  @override
  String get serverClientId =>
      '613394897708-qib5j3c8h1279vfp4sk8ip6s9gd2qg7e.apps.googleusercontent.com';
}

class ProductionFirebaseConfig implements FirebaseConfig {
  @override
  String get serverClientId =>
      '605455232993-gsla6p0nps9tj0frr7eso9ejrcnr33kn.apps.googleusercontent.com';
}