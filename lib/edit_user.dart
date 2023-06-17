import 'package:flutter/material.dart';
import 'package:sqlite_crud/User.dart';
import 'package:sqlite_crud/user_servise.dart';

class EditUser extends StatefulWidget {
  const EditUser({super.key,required this.user});
  final User user;

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  final _nameController = TextEditingController();
  final _adderssController = TextEditingController();
  final _ageController = TextEditingController();

  final _userService = UserServise();

  @override
  void initState() {
    
    setState(() {
      _nameController.text = widget.user.name ?? "";
      _adderssController.text = widget.user.address ?? "";
      _ageController.text = widget.user.age.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: ListView(
            children: [
              const Text("Edit User",style:TextStyle(
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
              clearButton(context),
            ],
          ),
        ),
        )
      ;
  }
  TextButton clearButton(BuildContext context) {
    return TextButton(
        onPressed: (){
          _nameController.text= "";
          _adderssController.text= "";
          _ageController.text= "";
          
        },
        style: TextButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Clear"),
      );
  }


  OutlinedButton saveButton() {
    return OutlinedButton(
        onPressed: (){
          setState(()async {
            
            var _user = User();
            _user.id = widget.user.id;
            _user.name = _nameController.text;
            _user.address = _adderssController.text;
            _user.age = int.parse(_ageController.text);

            var res = await _userService.update(_user);
            // ignore: use_build_context_synchronously
            Navigator.pop(context,res);
          });
          },
        style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        child: const Text("Save Edit"),
      );
    
    
  }
}