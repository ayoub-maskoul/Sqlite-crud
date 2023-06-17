import 'package:flutter/material.dart';
import 'package:sqlite_crud/User.dart';
import 'package:sqlite_crud/add_users.dart';
import 'package:sqlite_crud/user_servise.dart';



class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.user});
  final User user;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child:  Column(
          children: [
              const SizedBox(height: 30),
                const Text("Detalis User",style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.brown
              )),
              const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Name",style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 232, 72, 13)
                    )),
                    Text(widget.user.name ?? ' ',style: const TextStyle(
                      fontSize: 15,
                    )),
                  ],
                ),
              const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Address",style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 232, 72, 13)
                    )),
                    Text(widget.user.address ?? ' ',style: const TextStyle(
                      fontSize: 15,
                    )),
                  ],
                ),
              const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Age",style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 232, 72, 13)
                    )),
                    Text(widget.user.age.toString(),style: const TextStyle(
                      fontSize: 15,
                    )),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}