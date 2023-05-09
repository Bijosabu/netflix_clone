import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import '../../domain/core/failures/main_failures.dart';
import '../../domain/downloads/downloads_repo.dart';
import '../../domain/downloads/models/downloads.dart';
import 'package:injectable/injectable.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final DownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadsFailedOrSucceededOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();
      // print(downloadsOption.toString());
      emit(downloadsOption.fold(
        (failure) => state.copyWith(
            isLoading: false,
            downloadsFailedOrSucceededOption: Some(
              Left(failure),
            )),
        (success) => state.copyWith(
            isLoading: false,
            downloads: success,
            downloadsFailedOrSucceededOption: Some(
              Right(success),
            )),
      ));
    });
  }
}
