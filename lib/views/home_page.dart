import 'package:flutter/material.dart';
import 'package:app_cep/views/cep_details_page.dart';
import 'package:get/get.dart';
import 'package:app_cep/controllers/controller.dart';

final Uri url = Uri.parse('https://cepsbrasil.com.br/blog/o-que-e-o-cep/');

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final controller = Get.put(Controller());
  late final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Consulte um CEP", style: TextStyle(color: Colors.black),),
          backgroundColor: const Color.fromARGB(255, 70,130,180),
          actions: [
            IconButton(
              onPressed: () {
                controller.openUrl(url);
              },
              icon: const Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 169,169,169),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 90.0, bottom: 20.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Ex.: 01001000",
                    errorText: errorText,
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 70,130,180),
                      ),
                    ),
                  ),
                  controller: searchController,
                  onSubmitted: (String search) {
                    if(search.isEmpty || search.length != 8){
                      errorText = "Informe um CEP de formato válido";
                    }
                    String text = searchController.text;
                    Get.to(CepDetailsPage(cep: text));
                    searchController.clear();
                  },
                ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed('historic');
              },
              child: const Text(
                'Ver consultas recentes',
                style: TextStyle(
                  color: Color.fromARGB(255, 70, 130, 180),
                ),
              ),
            ),
          ],
        )
    );
  }
}
