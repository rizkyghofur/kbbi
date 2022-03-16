import 'package:json_annotation/json_annotation.dart';
import 'package:kbbi/models/responses/DataDetailResponse.dart';

part 'CariDataResponse.g.dart';

@JsonSerializable()
class CariDataResponse {
  bool status;
  String message;
  List<DataDetailResponse> data;

  CariDataResponse({this.status, this.message, this.data});

  Map<String, dynamic> toJson() => _$CariDataResponseToJson(this);

  static CariDataResponse fromJson(Map<String, dynamic> json) =>
      _$CariDataResponseFromJson(json);
}
