import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shelf_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_SHELF_VO, adapterName: "ShelfVOAdapter")
class ShelfVO {
  @HiveField(0)
  String? shelfName;

  @HiveField(1)
  List<BookVO?>? shelfBooks;

  @HiveField(2)
  bool isChecked;

  ShelfVO(this.shelfBooks, this.shelfName,this.isChecked);
}
