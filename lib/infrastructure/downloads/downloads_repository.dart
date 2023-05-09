import 'package:dio/dio.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

import 'package:netflixapp/domain/core/failures/main_failures.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';

import '../../domain/core/api_end_points.dart';
import '../../domain/downloads/downloads_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DownloadsRepo)
class DownloadsRepository implements DownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        // print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
