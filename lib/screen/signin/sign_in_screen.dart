import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/constants.dart';
import 'package:hospital_management/screen/forgot_pass/forgot_pass.dart';
import 'package:hospital_management/screen/home/home_screen.dart';
import 'package:hospital_management/screen/signin/sign_in_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/loading_toast.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  late SharedPreferences prefs;
  late bool isLogin;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? false;

    if (isLogin == true) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
  }

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
                      // keyboardType: TextInputType.,
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      controller: _pass,
                      obscureText: !_showPassword,
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
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
                          onPressed: () async {
                            var viewModel = Provider.of<SignInViewModel>(
                                context,
                                listen: false);
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (_) {
                                    return const LoadingToast(
                                      message: 'Please Wait...',
                                    );
                                  });

                              await viewModel.signIn(
                                  email: _email.value.text.toString(),
                                  pass: _pass.value.text.toString());
                              Navigator.pop(context);

                              if (viewModel.eror == null ||
                                  viewModel.eror == '') {
                                Fluttertoast.showToast(
                                    backgroundColor: Colors.white,
                                    textColor: kPrimaryColor,
                                    msg: 'User Log In',
                                    gravity: ToastGravity.BOTTOM);

                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/home', (route) => false);
                              } else {
                                Fluttertoast.showToast(
                                    backgroundColor: Colors.white,
                                    textColor: kPrimaryColor,
                                    msg: viewModel.eror!.toString(),
                                    gravity: ToastGravity.CENTER);
                                setState(() {
                                  String? data;
                                  viewModel.eror = data;
                                });
                              }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Don't Have an Account yet?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
