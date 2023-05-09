import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/downloads/downloads_repo.dart';
import 'package:netflixapp/domain/downloads/models/downloads.dart';
import 'package:netflixapp/domain/search/models/search_model.dart';
import 'package:netflixapp/domain/search/search_repoOrService.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final DownloadsRepo _downloadsRepo;
  final SearchRepo _searchRepo;
  SearchBloc(this._downloadsRepo, this._searchRepo)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          state.copyWith(
            searchResult: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          isLoading: true,
          searchResult: [],
          idleList: [],
        ),
      );
      final _result = await _downloadsRepo.getDownloadsImages();
      emit(_result.fold(
          (failure) => state.copyWith(
                searchResult: [],
                idleList: [],
                isLoading: false,
                isError: false,
              ),
          (success) => state.copyWith(
                searchResult: [],
                idleList: success,
                isLoading: false,
                isError: false,
              )));
    });
    on<SearchMovie>((event, emit) async {
      emit(state.copyWith(
        idleList: [],
        isError: false,
        isLoading: true,
        searchResult: [],
      ));
      final _data =
          await _searchRepo.searchMovies(movieQuery: event.movieQuery);

      emit(_data.fold(
          (failure) => state.copyWith(
                searchResult: [],
                idleList: [],
                isLoading: false,
                isError: false,
              ),
          (success) => state.copyWith(
                searchResult: success.results!,
                idleList: [],
                isLoading: false,
                isError: false,
              )));
    });
  }
}
