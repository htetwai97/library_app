import 'package:google_ebook_app/data/vos/result_vo.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_overview_list_response.g.dart';

@JsonSerializable()
class GetOverViewListResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "copyright")
  String? copyRight;

  @JsonKey(name: "num_results")
  int? numResult;

  @JsonKey(name: "results")
  ResultVO? result;

  GetOverViewListResponse(
      this.status, this.copyRight, this.numResult, this.result);

  factory GetOverViewListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOverViewListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetOverViewListResponseToJson(this);

  @override
  String toString() {
    return 'GetOverViewListResponse{status: $status, copyRight: $copyRight, numResult: $numResult, result: $result}';
  }
}
