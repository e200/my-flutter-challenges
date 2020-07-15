class User {
  String name;
  String fullname;
  String image;

  bool isVerified;

  User({
    this.fullname,
    this.image,
    this.name,
    this.isVerified = false,
  });
}
