// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CariDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CariDataResponse _$CariDataResponseFromJson(Map<String, dynamic> json) {
  return CariDataResponse(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DataDetailResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CariDataResponseToJson(CariDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
