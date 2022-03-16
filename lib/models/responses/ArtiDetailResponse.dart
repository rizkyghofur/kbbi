import 'package:json_annotation/json_annotation.dart';

part 'ArtiDetailResponse.g.dart';

@JsonSerializable()
class ArtiDetailResponse {
  @JsonKey(name: "kelas_kata")
  String kelaskata;
  String deskripsi;

  ArtiDetailResponse({this.kelaskata, this.deskripsi});

  Map<String, dynamic> toJson() => _$ArtiDetailResponseToJson(this);

  static ArtiDetailResponse fromJson(Map<String, dynamic> json) =>
      _$ArtiDetailResponseFromJson(json);
}
