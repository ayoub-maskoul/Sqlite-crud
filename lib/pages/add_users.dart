import 'package:flutter/material.dart';
import 'package:sqlite_crud/model/User.dart';
import 'package:sqlite_crud/services/user_servise.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {

  final _nameController = TextEditingController();
  final _adderssController = TextEditingController();
  final _ageController = TextEditingController();

  final _userService = UserServise();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Users"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              const Text("Add new User",style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.brown
              ))
              ,
              const SizedBox(height: 30),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const  InputDecoration(
                  labelText: "Age",
                  errorStyle: TextStyle(color: Colors.red),
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _adderssController,
                decoration: const InputDecoration(
                  labelText: "Address",
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 30),
              saveButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        )
      ;
  }

  OutlinedButton saveButton() {
    return OutlinedButton(
        onPressed: (){
          setState(() async{
            var user = User();
            user.name = _nameController.text;
            user.address = _adderssController.text;
            user.age = int.parse(_ageController.text);
            var res = await _userService.saveUser(user);
            // ignore: use_build_context_synchronously
            Navigator.pop(context,res);
          });
          },
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Save"),
      );
    
    
  }
}