// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleInfoVOAdapter extends TypeAdapter<SaleInfoVO> {
  @override
  final int typeId = 16;

  @override
  SaleInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleInfoVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as bool?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SaleInfoVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.saleAbility)
      ..writeByte(2)
      ..write(obj.isEbook)
      ..writeByte(3)
      ..write(obj.buyLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleInfoVO _$SaleInfoVOFromJson(Map<String, dynamic> json) => SaleInfoVO(
      json['country'] as String?,
      json['saleability'] as String?,
      json['isEbook'] as bool?,
      json['buyLink'] as String?,
    );

Map<String, dynamic> _$SaleInfoVOToJson(SaleInfoVO instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleAbility,
      'isEbook': instance.isEbook,
      'buyLink': instance.buyLink,
    };
