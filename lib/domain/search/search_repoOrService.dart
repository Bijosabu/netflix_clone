import 'package:dartz/dartz.dart';
import 'package:netflixapp/domain/search/models/search_model.dart';

import '../core/failures/main_failures.dart';

abstract class SearchRepo {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
