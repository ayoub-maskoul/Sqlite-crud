import 'package:flutter/material.dart';
import 'package:sqlite_crud/User.dart';
import 'package:sqlite_crud/add_users.dart';
import 'package:sqlite_crud/user_servise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<User> _userlist = <User>[];
  final _userService = UserServise();
  getAllUser() async{
    var users = await _userService.readAllData();
    
    _userlist = <User>[];
    users.forEach((user){
      setState(() {
      var u = User();
      u.id=user['id'];
      u.name=user['name'];
      u.address=user['address'];
      u.age=user['age'];
      _userlist.add(u);
      });
    });
    
  }

  @override
  void initState() {
    getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crud SQlite"),
      ),
      body: ListView.builder(
        itemCount: _userlist.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                
              },
              leading:const Icon(Icons.person),
              title: Row(
                children: [
                  const Text("Name: "),
                  Text(_userlist[index].name ?? " "),
                ],
              ),
              subtitle: Row(
                children: [
                  Column(
                      children: [
                        const Text("Age: "),
                        Text(_userlist[index].age.toString() ?? "0"),
              ]),
                  Column(
                      children: [
                        const Text("Address: "),
                        Text(_userlist[index].address ?? " "),
              ])
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async{
                        var res = await _userService.deleteUser(_userlist[index].id);
                        if(res!=null){
                          getAllUser();
                        }
                      
                    }, 
                    icon:const Icon(Icons.delete)
                    ),
                  IconButton(
                    onPressed: () {
                      
                    }, 
                    icon:const Icon(Icons.edit)
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => AddUsers(),)
          ).then((res){
            if(res!=null){
              getAllUser();
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
