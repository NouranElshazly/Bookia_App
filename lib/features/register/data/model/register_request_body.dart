class RegisterRequestBody {
  String name;
  String email;
  String password;
  String confirmPassword;
  String? address;
  String? city;
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.city,
  });
}
