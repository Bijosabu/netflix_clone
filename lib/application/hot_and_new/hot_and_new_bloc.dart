import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflixapp/domain/hot_and_new/models/discover.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  HotAndNewBloc() : super(HotAndNewState.initial()) {
    on<GetComingSoonData>((event, emit) {
      // TODO: implement event handler
    });
    on<GetEveryonesWatchingData>((event, emit) {
      // TODO: implement event handler
    });
  }
}
