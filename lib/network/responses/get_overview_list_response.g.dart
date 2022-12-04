// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_overview_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOverViewListResponse _$GetOverViewListResponseFromJson(
        Map<String, dynamic> json) =>
    GetOverViewListResponse(
      json['status'] as String?,
      json['copyright'] as String?,
      json['num_results'] as int?,
      json['results'] == null
          ? null
          : ResultVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOverViewListResponseToJson(
        GetOverViewListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyRight,
      'num_results': instance.numResult,
      'results': instance.result,
    };
