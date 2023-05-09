// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse(
          {@JsonKey(name: "results") List<SearchResult>? results}) =
      _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "original_title") String? title,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}
