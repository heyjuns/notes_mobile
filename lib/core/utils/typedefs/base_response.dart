import 'package:fpdart/fpdart.dart';

import '../../error/failures/failure.dart';

typedef BaseResponse<T> = Future<Either<Failure, T>>;
