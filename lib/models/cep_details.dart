class CepDetails {
  CepDetails (
      {required this.log,
        required this.bairro,
        required this.cid,
        required this.uf,
        required this.ddd,
        required this.cep});

  CepDetails.fromJson(Map<String, dynamic> json)
      : cep = json['cep'],
        log = json['logradouro'],
        bairro = json['bairro'],
        cid = json['cidade'],
        uf = json['uf'],
        ddd = json['ddd'];

  String cep;
  String log;
  String bairro;
  String cid;
  String uf;
  String ddd;


  Map<String, dynamic> toJson () {
    return {
      'cep' : cep,
      'logradouro' : log,
      'bairro' : bairro,
      'cidade': cid,
      'uf': uf,
      'ddd': ddd,
    };
  }
}