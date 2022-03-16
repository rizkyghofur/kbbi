import 'package:json_annotation/json_annotation.dart';
import 'package:kbbi/models/responses/ArtiDetailResponse.dart';

part 'DataDetailResponse.g.dart';

@JsonSerializable()
class DataDetailResponse {
  String lema;
  List<ArtiDetailResponse> arti;

  DataDetailResponse({this.lema, this.arti});

  Map<String, dynamic> toJson() => _$DataDetailResponseToJson(this);

  static DataDetailResponse fromJson(Map<String, dynamic> json) =>
      _$DataDetailResponseFromJson(json);
}
