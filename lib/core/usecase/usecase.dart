import 'package:reqres/product/states/_states_exports.dart';

abstract class Usecase<Type, Params> {
  Future<DataState<Type>> call(final Params params);
}