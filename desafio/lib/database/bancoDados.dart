import 'package:desafio/model/Anotacao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class AnotacaoHelper {

  static final String nomeTabela = "compras";

  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal();
  get db async {

    if( _db != null ){
      return _db;
    }else{
      _db = await inicializarDB();
      return _db;
    }

  }

  _onCreate(Database db, int version) async {

    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "idjogo VARCHAR ,"
        "name VARCHAR, "
        "price VARCHAR, "
        "score VARCHAR,"
        "image VARCHAR)";
    await db.execute(sql);

  }

  inicializarDB() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_minhas_compras.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate );
    return db;

  }

  Future<int> salvarCompra(Anotacao anotacao) async {

    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, anotacao.toMap() );
    return resultado;

  }

  recuperarCompra() async {

    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela";
    List anotacoes = await bancoDados.rawQuery( sql );
    return anotacoes;

  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {

    var bancoDados = await db;
    return await bancoDados.update(
        nomeTabela,
        anotacao.toMap(),
        where: "id = ?",
        whereArgs: [anotacao.id]
    );

  }

  Future<int> removerCompra( int id ) async {

    var bancoDados = await db;
    return await bancoDados.delete(
        nomeTabela,
        where: "id = ?",
        whereArgs: [id]
    );

  }


}
