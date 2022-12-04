// import 'package:flutter/material.dart';
// import 'package:google_ebook_app/data/vos/book_section_vo.dart';
// import 'package:google_ebook_app/network/api_constants.dart';
// import 'package:google_ebook_app/network/data_agents/book_data_agent.dart';
// import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';
// import 'package:http/http.dart'as http;
//
// class HttpBookDataAgentImpl extends BookDataAgent {
//   @override
//   Future<void> getOverViewList(String publishedDate) {
//     Map<String, String> queryParameters = {
//       PARAM_API_KEY: API_KEY,
//       PARAM_PUBLISHED_DATE:publishedDate,
//     };
//     var url = Uri.https(BASE_URL_HTTP, ENDPOINT_GET_OVERVIEW_LIST, queryParameters);
//
//   return http.get(url)
//   .then((value) {
//       debugPrint("http response =======> ${value.body.toString()}");
//     }).catchError((error) {
//       debugPrint("Error ======>${error.toString()}");
//     });
//   }
// }