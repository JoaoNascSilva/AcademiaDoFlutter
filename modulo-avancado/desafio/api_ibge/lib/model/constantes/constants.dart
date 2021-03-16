class Constants {
  Constants._();

  static const String _URL_REGIAO =
      'https://servicodados.ibge.gov.br/api/v1/localidades/regioes?orderBy=nome';
  static const String _URL_UF =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
  static const String _URL_MUNICIPIO =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/IDESTADO/distritos';

  static String getURL_UF() => _URL_UF;
  static String getURLRegiao() => _URL_REGIAO;
  static String getURLMunicipio(int idMunicipio) =>
      _URL_MUNICIPIO.replaceAll('IDESTADO', idMunicipio.toString());
}
