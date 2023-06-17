import 'package:sqflite/sqflite.dart';
import 'package:sqlite_crud/db_connection.dart';

class Service{
  

  late DbHelper _dbHelper;
  Service(){
    _dbHelper =DbHelper();
  }

  static Database? _database;

  Future<Database?> get database async{
    if(_database!=null){
      return _database;
    }
    else{
      _database = await _dbHelper.setDb();
      return _database;
    }
  }

  addData(table,values) async {
    var connection = await database;
    return await connection?.insert(table, values);
  }

  readallData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  readdata(table,id) async {
    var connection = await database;
    return await connection?.query(table,where:'id=?',whereArgs: [id]);
  }
  
  updatedata(table,data) async {
    var connection = await database;
    return await connection?.update(table,data,where:'id=?',whereArgs: [data["id"]]);
  }

  deletedata(table,id) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$id");
  }

}