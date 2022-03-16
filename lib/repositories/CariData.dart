import 'package:dio/dio.dart';
import 'package:kbbi/constants/Constants.dart';
import 'package:kbbi/models/responses/CariDataResponse.dart';
import 'package:kbbi/utils/Injector.dart';

class CariData {
  final Dio dio = locator<Dio>();
  Future<CariDataResponse> cariData(String kata) async {
    try {
      dio.options.contentType = "";
      Response response = await dio.get(Constants.url + kata);
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = CariDataResponse.fromJson(map);
      return fetchedResponse;
    } on DioError catch (error, stacktrace) {
      print(error.toString() + stacktrace.toString());
      throw Exception('Failed Load Data');
    }
  }
}
