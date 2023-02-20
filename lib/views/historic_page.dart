import 'package:app_cep/controllers/cep_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_cep/widgets/historic_item.dart';
import 'package:app_cep/models/cep_details.dart';
import 'package:app_cep/repositories/cep_details_repository.dart';
import 'package:get/get.dart';

class HistoricPage extends StatelessWidget {
  HistoricPage({Key? key}) : super(key: key);

  final CepDetailsRepository cepDetailsRepository = CepDetailsRepository();
  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_) {
        cepDetailsRepository.getHistoricItems().then((value) {
          controller.historicItems = value;
        });
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  for(CepDetails item in controller.historicItems)
                    HistoricItem(item: item)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
