import 'utils/typedefs/base_response.dart';

abstract class UseCase<T, P> {
  const UseCase();
  BaseResponse<T> call(P params);
}
