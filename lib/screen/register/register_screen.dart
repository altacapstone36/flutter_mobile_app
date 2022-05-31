import 'package:flutter/material.dart';
import 'package:hospital_management/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryPurple,
      body: Center(
        child: Container(
          height: size.height * 0.59,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: kSecondaryWhite, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/icons/bi_hospital.png')],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('CREATE USERNAME'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: kSecondaryPurple),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('CREATE PASSWORD'),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('ENTER EMAIL ADDRESS'),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: size.width * 1,
                  child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: kSecondaryPurple),
                      child: const Text('REGISTER')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
