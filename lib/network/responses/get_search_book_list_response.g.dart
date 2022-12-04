// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_book_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchBookListResponse _$GetSearchBookListResponseFromJson(
        Map<String, dynamic> json) =>
    GetSearchBookListResponse(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SearchBookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSearchBookListResponseToJson(
        GetSearchBookListResponse instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.searchBooks,
    };
