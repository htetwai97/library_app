// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchBookVOAdapter extends TypeAdapter<SearchBookVO> {
  @override
  final int typeId = 17;

  @override
  SearchBookVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchBookVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as VolumeVO?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchBookVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.eTag)
      ..writeByte(3)
      ..write(obj.selfLink)
      ..writeByte(4)
      ..write(obj.volumeInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchBookVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookVO _$SearchBookVOFromJson(Map<String, dynamic> json) => SearchBookVO(
      json['kind'] as String?,
      json['id'] as String?,
      json['etag'] as String?,
      json['selfLink'] as String?,
      json['volumeInfo'] == null
          ? null
          : VolumeVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchBookVOToJson(SearchBookVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.eTag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
    };
