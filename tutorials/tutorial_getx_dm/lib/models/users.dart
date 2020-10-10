class User {
  final int id;
  final String email, firstName, lastName;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  static User fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      email: data['email'],
      firstName: data['first_name'],
      lastName: data['last_name'],
    );
  }
}
