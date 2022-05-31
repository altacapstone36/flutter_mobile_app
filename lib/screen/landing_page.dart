import 'package:flutter/material.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/register/register_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryPurple,
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.8,
          decoration: BoxDecoration(
              color: kSecondaryWhite, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  child: Image.asset(
                    'assets/images/landing_image.png',
                    fit: BoxFit.fill,
                    height: size.height * 0.16,
                    width: size.width * 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Holy Hospital',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: size.width * 1,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('LOGIN'),
                    style: ElevatedButton.styleFrom(primary: kSecondaryPurple),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegisterScreen()));
                  },
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 14),
                  ),
                  style: TextButton.styleFrom(primary: kSecondaryPurple),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
