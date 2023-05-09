import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';
import 'models/downloads.dart';

abstract class DownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
