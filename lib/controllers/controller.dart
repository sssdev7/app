import 'package:app_cep/models/cep_details.dart';
import 'package:get/get.dart';
import 'package:app_cep/repositories/cep_details_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Controller extends GetxController{

  Controller();
  CepDetailsRepository cepDetailsRepository = CepDetailsRepository();
  late List<CepDetails> historicItems;

  void addAtHistoric(CepDetails newItem) {
    historicItems.add(newItem);
    if(historicItems.length > 5) {
      historicItems.removeAt(0);
    }
    cepDetailsRepository.saveHistoricItems(historicItems);
  }

  Future<Map> getCep(String cep) async {
    http.Response response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    return json.decode(response.body);
  }

  Future<void> openUrl(url) async {
    try {
      await launchUrl(url);
    } on Error {
      return;
    }

    /*if (!await launchUrl(url)) {
      null;
    }*/
  }
}