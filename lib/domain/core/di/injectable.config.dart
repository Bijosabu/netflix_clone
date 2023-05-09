// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i11;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i5;
import '../../../application/hot_and_new/hot_and_new_bloc.dart' as _i6;
import '../../../application/search/search_bloc.dart' as _i12;
import '../../../infrastructure/downloads/downloads_repository.dart' as _i4;
import '../../../infrastructure/hot_and_new/hot_and_new_repository.dart' as _i8;
import '../../../infrastructure/search/search_repository.dart' as _i10;
import '../../downloads/downloads_repo.dart' as _i3;
import '../../hot_and_new/hot_and_new_repo.dart' as _i7;
import '../../search/search_repoOrService.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.DownloadsRepo>(() => _i4.DownloadsRepository());
  gh.factory<_i5.FastLaughBloc>(
      () => _i5.FastLaughBloc(get<_i3.DownloadsRepo>()));
  gh.factory<_i6.HotAndNewBloc>(() => _i6.HotAndNewBloc());
  gh.lazySingleton<_i7.HotAndNewRepo>(() => _i8.HotAndNewRepository());
  gh.lazySingleton<_i9.SearchRepo>(() => _i10.SearchRepository());
  gh.factory<_i11.DownloadsBloc>(
      () => _i11.DownloadsBloc(get<_i3.DownloadsRepo>()));
  gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
        get<_i3.DownloadsRepo>(),
        get<_i9.SearchRepo>(),
      ));
  return get;
}
