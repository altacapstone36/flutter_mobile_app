import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/forgot_pass/forgot_pass.dart';
import 'package:hospital_management/screen/home/home_screen.dart';

import '../register/register.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/images/signin.svg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width * 1,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: kSecondaryColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 5,
                      offset: const Offset(0, 1))
                ],
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        labelStyle: const TextStyle(
                          color: kDarkColor,
                        ),
                        fillColor: kSecondaryColor,
                        prefixIcon: const Icon(Icons.person, color: kDarkColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _pass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        // Return null if the entered password is valid
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "password",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        labelStyle: const TextStyle(
                          color: kDarkColor,
                        ),
                        fillColor: kSecondaryColor,
                        prefixIcon: const Icon(Icons.lock, color: kDarkColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen()));
                            }
                          },
                          style:
                              ElevatedButton.styleFrom(primary: kPrimaryColor),
                          child: const Text('Sign In')),
                    ),
                    const SizedBox(height: 15.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPassScreen()));
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: kDarkColor,
                          fontFamily: "Nunito",
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()))
                },
                child: const Text(
                  "Dont Have an Account yet? Sign Up",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: kDarkColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
