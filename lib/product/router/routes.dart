enum Routes{
  baseRoute('/', 'baseRoute'),
  ;
  final String path;
  final String name;

  const Routes(this.path, this.name);
}