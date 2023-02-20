import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_cep/models/cep_details.dart';

const itemsListKey = 'details_list';

class CepDetailsRepository {

  late SharedPreferences sharedPreferences;

  Future<List<CepDetails>> getHistoricItems() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(itemsListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => CepDetails.fromJson(e)).toList();
  }

  void saveHistoricItems (List<CepDetails> historicItems) {
    final String jsonString = json.encode(historicItems);
    sharedPreferences.setString(itemsListKey, jsonString);

  }

}
