import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:google_ebook_app/network/api_constants.dart';
import 'package:google_ebook_app/network/data_agents/book_data_agent.dart';
import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';
import 'package:google_ebook_app/network/the_book_api.dart';
import 'package:google_ebook_app/network/the_google_book_api.dart';

class RetrofitDataAgentImpl extends BookDataAgent {
  late TheBookApi bApi;
  late TheGoogleBookApi googleBookApi;

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }
  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    bApi = TheBookApi(dio);
    googleBookApi = TheGoogleBookApi(dio);
  }

  @override
  Future<List<BookSectionVO?>?> getOverViewList(String publishedDate) {
    return bApi
        .getOverviewList(API_KEY, publishedDate)
        .asStream()
        .map((response) => response.result?.lists)
        .first;
  }

  @override
  Future<List<BookSectionVO?>?> getBooksByListName(String listName) {
    return bApi
        .getBooksByListName(API_KEY, listName)
        .asStream()
        .map((response) => response.result)
        .first;
  }

  @override
  Future<List<SearchBookVO?>?> getSearchBooks(String q) {
    return googleBookApi
        .getSearchBookList(q)
        .asStream()
        .map((response) => response.searchBooks)
        .first;
  }
}
