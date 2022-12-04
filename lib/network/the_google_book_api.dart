import 'package:dio/dio.dart';
import 'package:google_ebook_app/network/api_constants.dart';
import 'package:google_ebook_app/network/responses/get_search_book_list_response.dart';
import 'package:retrofit/retrofit.dart';
part 'the_google_book_api.g.dart';
@RestApi(baseUrl: BASE_URL_DIO_GOOGLE_BOOKS)
abstract class TheGoogleBookApi {
  factory TheGoogleBookApi(Dio dio) = _TheGoogleBookApi;

  @GET(ENDPOOINT_GET_SEARCH_BOOKS)
  Future<GetSearchBookListResponse> getSearchBookList(
    @Query(PARAM_Q) String q,
  );
}
