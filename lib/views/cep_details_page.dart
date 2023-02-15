import 'package:app_cep/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:app_cep/models/cep_details.dart';
import 'package:get/get.dart';

class CepDetailsPage extends StatelessWidget {
  CepDetailsPage({Key? key, required this.cep}) : super(key: key);

  final controller = Get.put(Controller());
  final String cep;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<Map>(
            future: controller.getCep(cep),
            builder: (context, snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: Text(
                      "Carregando Dados...",
                      style: TextStyle(
                        color: Color.fromARGB(255, 70,130,180),
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text(
                          "Este CEP não existe",
                          style: TextStyle(
                            color: Color.fromARGB(255, 70,130,180),
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                    );
                  } else {

                    CepDetails newItem = CepDetails(
                      cep: snapshot.data?['cep'],
                      log: snapshot.data?['logradouro'],
                      bairro: snapshot.data?['bairro'],
                      cid: snapshot.data?['cidade'],
                      uf: snapshot.data?['uf'],
                      ddd: snapshot.data?['ddd'],
                    );

                    controller.addAtHistoric(newItem);

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
                          child: Text(
                            "CEP: $cep \n\n Logradouro: ${newItem.log} \n\n Bairro: ${newItem.bairro} \n\n Cidade: ${newItem.cid} \n\n UF: ${newItem.uf} \n\n DDD: ${newItem.ddd} \n\n",
                            style: const TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                          child: TextButton(
                            onPressed: () async {
                                final Uri url = Uri.parse('https://www.google.com.br/maps/place/${newItem.cid},+${newItem.uf},+${newItem.cep}/');
                                controller.openUrl(url);
                            },
                            child: const Text(
                              "Encontre no mapa",
                              style: TextStyle(color: Color.fromARGB(150, 70,130,180), fontSize: 20.0),
                            ),

                          ),
                        ),

                      ],
                    );
                  }
              }
            }
        )
    );
  }
}

















