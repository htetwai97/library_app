import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
import 'package:google_ebook_app/main.dart' as app;
import 'package:google_ebook_app/main.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:google_ebook_app/reusable_widgets/bottom_icon_bar_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  //IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  as IntegrationTestWidgetsFlutterBinding;

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

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

  testWidgets("Tap Books of First Section", (widgetTester) async {
    /// to finds
    // final mainVerticalList = find.byKey(const ValueKey("MainList"));
    // final firstListSection =
    //     find.byKey(const ValueKey("VerticalListSection 0"));
    // final fifthListSection =
    //     find.byKey(const ValueKey("VerticalListSection 4"));
    // final bookListViewOfFirstSection =
    //     find.byKey(const ValueKey("BookListView"));

    /// App pump
    await widgetTester.pumpWidget( MyApp());
    //app.main();
    //await Future.delayed(const Duration(seconds: 2));
    sleep(const Duration(seconds: 10));
    await widgetTester.pumpAndSettle(const Duration(seconds: 5));

    // /// find bottomNavigation bar
    // expect(find.byType(BottomNavigationBar),findsOneWidget );
    //
    // /// find bottomNavigator home
    // expect(find.text("Home"), findsOneWidget);
    //
    // /// find bottomNavigator library
    // expect(find.text("Library"), findsOneWidget);
    //
    // await widgetTester.tap(find.text("Library"));
    // await widgetTester.pumpAndSettle(const Duration(seconds: 5));

    /// find homepage
    expect(find.byType(HomePage), findsOneWidget);
    //
    // /// find mainVerticalList
    // expect(mainVerticalList, findsOneWidget);
    //
    // /// find firstSection
    // expect(find.descendant(of: mainVerticalList, matching: firstListSection),
    //     findsOneWidget);
    //
    // /// find BookListView of first section
    // expect(
    //     find.descendant(
    //         of: firstListSection, matching: bookListViewOfFirstSection),
    //     findsOneWidget);
    //
    // /// tap Book 1 of FirstSection
  });
}
