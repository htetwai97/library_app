// "imageLinks": {
// "smallThumbnail": "http://books.google.com/books/content?id=-E4atcXDG98C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
// "thumbnail": "http://books.google.com/books/content?id=-E4atcXDG98C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
// },

import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'image_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_IMAGE_LINK_VO, adapterName: "ImageLinkVOAdapter")
class ImageLinkVO {
  @JsonKey(name: "smallThumbnail")
  @HiveField(0)
  String? smallThumbnail;

  @JsonKey(name: "thumbnail")
  @HiveField(1)
  String? thumbNail;

  ImageLinkVO(this.smallThumbnail, this.thumbNail);

  @override
  String toString() {
    return 'ImageLinkVO{smallThumbnail: $smallThumbnail, thumbNail: $thumbNail}';
  }

  factory ImageLinkVO.fromJson(Map<String, dynamic> json) =>
      _$ImageLinkVOFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinkVOToJson(this);
}
