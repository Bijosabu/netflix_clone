import 'package:dio/dio.dart';
import 'package:netflixapp/domain/core/api_end_points.dart';
import 'package:netflixapp/domain/core/failures/main_failures.dart';

import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/hot_and_new/hot_and_new_repo.dart';
import 'package:netflixapp/domain/hot_and_new/models/discover.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: HotAndNewRepo)
class HotAndNewRepository implements HotAndNewRepo {
  @override
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewMovie() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewDataResp.fromJson(response.data);
        // print(result);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewDataResp>> getHotAndNewTvData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewDataResp.fromJson(response.data);
        // print(result);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
