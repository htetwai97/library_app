import 'package:flutter/material.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/access_info_vo.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/buy_links_vo.dart';
import 'package:google_ebook_app/data/vos/epub_vo.dart';
import 'package:google_ebook_app/data/vos/image_link_vo.dart';
import 'package:google_ebook_app/data/vos/industry_identifier_vo.dart';
import 'package:google_ebook_app/data/vos/isbn_vo.dart';
import 'package:google_ebook_app/data/vos/panelization_vo.dart';
import 'package:google_ebook_app/data/vos/pdf_vo.dart';
import 'package:google_ebook_app/data/vos/reading_mode_vo.dart';
import 'package:google_ebook_app/data/vos/result_vo.dart';
import 'package:google_ebook_app/data/vos/review_vo.dart';
import 'package:google_ebook_app/data/vos/sale_info_vo.dart';
import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:google_ebook_app/data/vos/search_info_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/data/vos/volume_vo.dart';
import 'package:google_ebook_app/network/data_agents/http_data_agent.dart';
import 'package:google_ebook_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:google_ebook_app/pages/adding_into_shelf_page.dart';
import 'package:google_ebook_app/pages/book_item_detail_page.dart';
import 'package:google_ebook_app/pages/book_shelves_detail_page.dart';
import 'package:google_ebook_app/pages/create_new_shelf_page.dart';
import 'package:google_ebook_app/pages/library_page.dart';
import 'package:google_ebook_app/pages/section_detail_page.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:google_ebook_app/reusable_widgets/bottom_icon_bar_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookSectionVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ResultVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());
  Hive.registerAdapter(ReviewVOAdapter());
  Hive.registerAdapter(IsbnVOAdapter());
  Hive.registerAdapter(VolumeVOAdapter());
  Hive.registerAdapter(SearchInfoVOAdapter());
  Hive.registerAdapter(SearchBookVOAdapter());
  Hive.registerAdapter(AccessInfoVOAdapter());
  Hive.registerAdapter(EpubVOAdapter());
  Hive.registerAdapter(ImageLinkVOAdapter());
  Hive.registerAdapter(IndustryIdentifierVOAdapter());
  Hive.registerAdapter(PaneLiZationVOAdapter());
  Hive.registerAdapter(PdfVOAdapter());
  Hive.registerAdapter(ReadingModeVOAdapter());
  Hive.registerAdapter(SaleInfoVOAdapter());

  await Hive.openBox<BookSectionVO>(BOX_NAME_BOOK_SECTION_VO);
  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);

  BookModelImpl().getSearchBooks("flutter");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomIconsBarView(),
    );
  }
}
