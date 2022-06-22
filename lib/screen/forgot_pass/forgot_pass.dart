import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management/screen/signin/sign_in_screen.dart';

import '../../constants.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _email = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 45, 16, 10),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/forgotpass.svg',
                  height: size.height * 0.28,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width * 0.91,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: kSecondaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 5,
                            offset: const Offset(3, 6))
                      ]),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter Registered Email',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'email tidak boleh kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            labelStyle: const TextStyle(
                              //color: kDarkColor,
                              fontSize: 16.0,
                            ),
                            fillColor: kSecondaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SignIn()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor),
                              child: const Text('Send Recovery Email')),
                        )
                      ],
                    ),
                  )),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    },
                    child: const Text('Back to start')),
              )
            ],
          ),
        ),
      )),
    );
  }
}
