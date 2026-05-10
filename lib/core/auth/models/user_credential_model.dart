class UserCredentialModel {
  final String uid;
  final String? fullName;
  final String? email;

  const UserCredentialModel({
    required this.uid,
    this.fullName,
    required this.email,
  });
}
