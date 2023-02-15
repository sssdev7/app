import 'package:flutter/material.dart';
import 'package:app_cep/models/cep_details.dart';

class HistoricItem extends StatelessWidget {
  const HistoricItem({Key? key, required this.item}) : super(key: key);

  final CepDetails item;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromARGB(255,169,169,169),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'CEP: ${item.cep}',
                    style: const TextStyle(color: Color.fromARGB(255, 70,130,180),),
                ),
                Text('Logradouro: ${item.log} \n\n Bairro: ${item.bairro} \n\n Cidade: ${item.cid} \n\n UF: ${item.uf} \n\n DDD: ${item.ddd} \n\n'),
              ],
            ),
          ),
        ),
    );
  }
}
