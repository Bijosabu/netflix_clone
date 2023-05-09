import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/downloads/downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://pagalstatus.com/wp-content/uploads/2021/10/Game-Of-Thrones-Dragon-Scene-Status-Video.mp4",
  "https://gostatusguru.com/siteuploads/files/sfd25/12133/Stranger%20Things%20Whatsapp%20Status(GoStatusGuru.Com).mp4",
  "https://statusour.com/wp-content/uploads/2021/09/Money-Heist-Whatsapp-Status-Video-Download-Full-Screen-4k-Status-9.mp4",
  "https://statusguide.com/anykreeg/2021/04/Naruto-vs-pain-amv-whatsapp-status.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final DownloadsRepo _downloadsRepo;
  FastLaughBloc(this._downloadsRepo) : super(FastLaughState.initial()) {
    on<Initialize>(
      (event, emit) async {
        emit(
          state.copyWith(
            isError: false,
            isLoading: true,
            videosList: [],
          ),
        );
        final _data = await _downloadsRepo.getDownloadsImages();
        print(_data);
        emit(_data.fold(
          (failure) {
            return state.copyWith(
              isError: true,
              isLoading: false,
              videosList: [],
            );
          },
          (success) {
            return state.copyWith(
              isError: false,
              isLoading: false,
              videosList: success,
            );
          },
        ));
      },
    );
  }
}
