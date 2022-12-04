// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panelization_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaneLiZationVOAdapter extends TypeAdapter<PaneLiZationVO> {
  @override
  final int typeId = 13;

  @override
  PaneLiZationVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PaneLiZationVO(
      fields[0] as bool?,
      fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PaneLiZationVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.containsEpubBubbles)
      ..writeByte(1)
      ..write(obj.containsImageBubbles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaneLiZationVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaneLiZationVO _$PaneLiZationVOFromJson(Map<String, dynamic> json) =>
    PaneLiZationVO(
      json['containsEpubBubbles'] as bool?,
      json['containsImageBubbles'] as bool?,
    );

Map<String, dynamic> _$PaneLiZationVOToJson(PaneLiZationVO instance) =>
    <String, dynamic>{
      'containsEpubBubbles': instance.containsEpubBubbles,
      'containsImageBubbles': instance.containsImageBubbles,
    };
