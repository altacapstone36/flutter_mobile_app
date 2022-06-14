import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.height * 0.1,
                  child: const Center(
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Alshad Ahmad'),
              ),
              const ListTile(
                title: Text(
                  'Doctor ID',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('DR001'),
              ),
              const ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('alshadahmad@email.com'),
              ),
              const ListTile(
                title: Text(
                  'Gender',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Laki - Laki'),
              ),
              const ListTile(
                title: Text(
                  'Role',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('General Doctor'),
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton.icon(
                    icon: const Icon(Icons.lock),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                    label: const Text(
                      'Change Password',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.red)),
                    label: const Text(
                      'Log Out',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
