// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDetailResponse _$DataDetailResponseFromJson(Map<String, dynamic> json) {
  return DataDetailResponse(
    lema: json['lema'] as String,
    arti: (json['arti'] as List)
        ?.map((e) => e == null
            ? null
            : ArtiDetailResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataDetailResponseToJson(DataDetailResponse instance) =>
    <String, dynamic>{
      'lema': instance.lema,
      'arti': instance.arti,
    };
