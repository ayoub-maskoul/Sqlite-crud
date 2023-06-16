


import 'package:sqlite_crud/User.dart';
import 'package:sqlite_crud/servise.dart';

class UserServise{
    late Service _service;
    
    UserServise(){
      _service = Service();

    }

    SaveUser(User user) async{
      return await _service.addData("users", user.userMap());
    }

    readAllData() async{
      return await _service.readallData("users");
    }

    deleteUser(id) async{
      return await _service.deletedata("users",id);
    }
}