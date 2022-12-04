// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_mode_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReadingModeVOAdapter extends TypeAdapter<ReadingModeVO> {
  @override
  final int typeId = 15;

  @override
  ReadingModeVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReadingModeVO(
      fields[0] as bool?,
      fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ReadingModeVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReadingModeVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModeVO _$ReadingModeVOFromJson(Map<String, dynamic> json) =>
    ReadingModeVO(
      json['text'] as bool?,
      json['image'] as bool?,
    );

Map<String, dynamic> _$ReadingModeVOToJson(ReadingModeVO instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };
