import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sale_info_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_SALE_INFO_VO,adapterName: "SaleInfoVOAdapter")
class SaleInfoVO{
  @JsonKey(name: "country")
  @HiveField(0)
  String? country;

  @JsonKey(name: "saleability")
  @HiveField(1)
  String? saleAbility;

  @JsonKey(name: "isEbook")
  @HiveField(2)
  bool? isEbook;

  @JsonKey(name: "buyLink")
  @HiveField(3)
  String? buyLink;

  SaleInfoVO(this.country, this.saleAbility, this.isEbook, this.buyLink);

  factory SaleInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoVOFromJson(json);
  Map<String, dynamic> toJson() => _$SaleInfoVOToJson(this);

  @override
  String toString() {
    return 'SaleInfoVO{country: $country, saleAbility: $saleAbility, isEbook: $isEbook, buyLink: $buyLink}';
  }
}

