class UserProfileModel {
  final String name;
  final String email;
  final String? photoUrl;

  const UserProfileModel({
    this.name = 'Undefined User Name',
    this.email = 'Undefined User Email',
    this.photoUrl,
  });
}