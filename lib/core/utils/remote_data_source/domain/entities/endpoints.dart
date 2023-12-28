enum Endpoints {
  login('/api/login'),
  register('/api/register'),
  listUsers('/api/users'),
  ;

  static const baseUrl = 'https://reqres.in';

  String get path => baseUrl + _path; 

  final String _path;
  const Endpoints(this._path);
}
