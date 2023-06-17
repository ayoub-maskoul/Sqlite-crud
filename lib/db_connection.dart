import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class DbHelper{

  Future<Database> setDb() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,"crud");

    return await openDatabase(path,version: 1,onCreate: _creatDb);
  }

  Future<void> _creatDb(Database db, int version) async{
    String sql = "CREATE TABLE users(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,address TEXT)";
    await db.execute(sql);
  }

}
