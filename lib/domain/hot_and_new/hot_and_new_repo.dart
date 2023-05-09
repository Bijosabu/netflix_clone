import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/hot_and_new/models/discover.dart';

import '../core/failures/main_failures.dart';

abstract class HotAndNewRepo {
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewMovie();
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewTvData();
}
