// "panelizationSummary": {
// "containsEpubBubbles": false,
// "containsImageBubbles": false
// },
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'panelization_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_PANELIZATION_VO, adapterName: "PaneLiZationVOAdapter")
class PaneLiZationVO {
  @JsonKey(name: "containsEpubBubbles")
  @HiveField(0)
  bool? containsEpubBubbles;

  @JsonKey(name: "containsImageBubbles")
  @HiveField(1)
  bool? containsImageBubbles;

  PaneLiZationVO(this.containsEpubBubbles, this.containsImageBubbles);

  @override
  String toString() {
    return 'PanelizationVO{containsEpubBubbles: $containsEpubBubbles, containsImageBubbles: $containsImageBubbles}';
  }

  factory PaneLiZationVO.fromJson(Map<String, dynamic> json) =>
      _$PaneLiZationVOFromJson(json);
  Map<String, dynamic> toJson() => _$PaneLiZationVOToJson(this);
}
