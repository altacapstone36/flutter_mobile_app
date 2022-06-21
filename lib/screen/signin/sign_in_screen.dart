import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/register/register%20screen.dart';

class SignIn extends StatelessWidget {
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
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
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
                    decoration: InputDecoration(
                      labelText: "password",
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        child: const Text('Sign In')),
                  ),
                  const SizedBox(height: 15.0),
                  TextButton(
                    onPressed: () {},
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
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: const Text(
                  "Don Have an Account yet? Sign Up",
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
