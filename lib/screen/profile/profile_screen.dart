import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/screen/forgot_pass/change_password_screen.dart';
import 'package:provider/provider.dart';

import '../../components/loading_toast.dart';
import '../../constants.dart';
import '../home/home_view_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {Key? key,
      required this.name,
      required this.code,
      required this.email,
      required this.gender,
      required this.role})
      : super(key: key);

  final String name, code, email, gender, role;

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
                  radius: size.width * 0.16,
                  backgroundColor: kPrimaryColor,
                  child: Center(
                    child: Text(
                      name[0],
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(name),
              ),
              ListTile(
                title: const Text(
                  'Doctor ID',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(code),
              ),
              ListTile(
                title: const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(email),
              ),
              ListTile(
                title: const Text(
                  'Gender',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(gender),
              ),
              ListTile(
                title: const Text(
                  'Role',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(role),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePassword()));
                },
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: const [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.lock)),
                      SizedBox(
                          // margin: const EdgeInsets.only(left: 10.0),
                          child: Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Change Password",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var viewModel =
                      Provider.of<HomeViewModel>(context, listen: false);
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const LoadingToast(message: 'Logging Out...');
                      });
                  await viewModel.logOut();
                  Navigator.pop(context);
                  if (viewModel.message != null || viewModel.message != '') {
                    Fluttertoast.showToast(
                        msg: viewModel.message!.toString(),
                        backgroundColor: Colors.white,
                        textColor: kPrimaryColor);
                    Navigator.pushReplacementNamed(context, '/signin');
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(color: Colors.red)),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: const [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.logout_rounded,
                            color: Colors.red,
                          )),
                      SizedBox(
                          // margin: const EdgeInsets.only(left: 10.0),
                          child: Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Log Out",
                          style: TextStyle(fontSize: 16.0, color: Colors.red),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
