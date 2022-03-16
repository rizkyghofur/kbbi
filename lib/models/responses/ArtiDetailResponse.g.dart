// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtiDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtiDetailResponse _$ArtiDetailResponseFromJson(Map<String, dynamic> json) {
  return ArtiDetailResponse(
    kelaskata: json['kelas_kata'] as String,
    deskripsi: json['deskripsi'] as String,
  );
}

Map<String, dynamic> _$ArtiDetailResponseToJson(ArtiDetailResponse instance) =>
    <String, dynamic>{
      'kelas_kata': instance.kelaskata,
      'deskripsi': instance.deskripsi,
    };
