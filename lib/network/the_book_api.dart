import 'package:dio/dio.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/network/api_constants.dart';
import 'package:google_ebook_app/network/responses/get_books_by_list_response.dart';
import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';
import 'package:google_ebook_app/network/responses/get_search_book_list_response.dart';
import 'package:retrofit/retrofit.dart';
part 'the_book_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO_NYT)
abstract class TheBookApi {
  factory TheBookApi(Dio dio) = _TheBookApi;

  @GET(ENDPOINT_GET_OVERVIEW_LIST)
  Future<GetOverViewListResponse> getOverviewList(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_PUBLISHED_DATE) String publishedDate,
  );

  @GET(ENDPOINT_GET_BOOKS_BY_LISTNAME)
  Future<GetBooksByListNameResponse> getBooksByListName(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LIST_NAME) String list,
  );
}
