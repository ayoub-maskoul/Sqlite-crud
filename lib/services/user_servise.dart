


import 'package:sqlite_crud/model/User.dart';
import 'package:sqlite_crud/services/servise.dart';

class UserServise{
    late Service _service;
    
    UserServise(){
      _service = Service();

    }

    saveUser(User user) async{
      return await _service.addData("users", user.userMap());
    }

    readAllData() async{
      return await _service.readallData("users");
    }

    update(User user) async{
      return await _service.updatedata("users", user.userMap());
    }

    deleteUser(id) async{
      return await _service.deletedata("users",id);
    }
}