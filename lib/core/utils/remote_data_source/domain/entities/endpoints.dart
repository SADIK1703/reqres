enum Endpoints {
  login('/api/login'),
  listUsers('/api/users'),
  ;

  final String path;
  const Endpoints(this.path);
}
