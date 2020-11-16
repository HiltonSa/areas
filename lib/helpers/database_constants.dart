class DatabaseConstants {
  static const SqlCreateProjetos = 'CREATE TABLE PROJETOS ( ' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'proprietario TEXT, ' +
      'observacao TEXT)';
  static const SqlCreateAmbientes = 'CREATE TABLE AMBIENTES ( ' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'projeto INTEGER, ' +
      'formato INTEGER, ' +
      'icone INTEGER, ' +
      'descricao TEXT, ' +
      'areaparedes REAL, ' +
      'altura REAL, ' +
      'areapiso REAL, ' +
      'dimensaoMenor REAL, ' +
      'dimensaoMaior REAL, ' +
      'perimetro REAL)';
  static const SqlCreateParedes = 'CREATE TABLE PAREDES ( ' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'ambiente INTEGER, ' +
      'observacao TEXT, ' +
      'altura REAL, ' +
      'area REAL, ' +
      'revestimento INTEGER)';
}
