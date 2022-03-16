import 'package:kbbi/models/responses/CariDataResponse.dart';
import 'package:kbbi/repositories/CariData.dart';

class CariDataBloc {
  CariData cariData = CariData();

  Future<CariDataResponse> ambilData(String kata) async {
    try {
      return cariData.cariData(kata);
    } catch (e) {
      return null;
    }
  }
}
