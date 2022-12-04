import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_search_book_list_response.g.dart';
@JsonSerializable()
class GetSearchBookListResponse {
  @JsonKey(name: "kind")
  String? kind;

  @JsonKey(name: "totalItems")
  int? totalItems;

  @JsonKey(name: "items")
  List<SearchBookVO?>? searchBooks;

  GetSearchBookListResponse(this.kind, this.totalItems, this.searchBooks);

  factory GetSearchBookListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSearchBookListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetSearchBookListResponseToJson(this);
  @override
  String toString() {
    return 'GetSearchBookListResponse{kind: $kind, totalItems: $totalItems, searchBooks: $searchBooks}';
  }
}
