import 'package:dio/dio.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

import 'package:netflixapp/domain/core/failures/main_failures.dart';

import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/search/models/search_model.dart';
import 'package:netflixapp/domain/search/search_repoOrService.dart';
import 'dart:developer';
import '../../domain/core/api_end_points.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepo)
class SearchRepository implements SearchRepo {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        print(result);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
