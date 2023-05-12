import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mosquito/MosData.dart';

class MosAPI {

  final String baseUrl = "http://openapi.seoul.go.kr:8088/777876567a736b3038396f754c4658/json/MosquitoStatus/1/2";
  
  MosAPI();

  Future<MosData?> fetchNew(String date) async {
    final response = await http.get(Uri.parse('$baseUrl/$date'));

    if (response.statusCode == 200) {
      print("요청 성공");
      Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      var rowData = decodedResponse['MosquitoStatus']['row'][0];
      MosData mosquitoData = MosData(
        date: rowData['MOSQUITO_DATE'],
        valueWater: double.parse(rowData['MOSQUITO_VALUE_WATER']),
        valueHouse: double.parse(rowData['MOSQUITO_VALUE_HOUSE']),
        valuePark: double.parse(rowData['MOSQUITO_VALUE_PARK']),
      );
      return mosquitoData;
    } else {
      print("요청 실패");
      throw Exception("Failed to Mos");
    }
  }

}