enum AuthRoutes {
  login('/login'),
  register('/register');

  final String path;
  const AuthRoutes(this.path);
}
