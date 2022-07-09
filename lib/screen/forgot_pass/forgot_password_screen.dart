import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/loading_toast.dart';
import 'package:hospital_management/screen/forgot_pass/change_password_view_model.dart';
import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  String nameButton = '';
  String message = '';
  bool visible = false;

  int activeIndex = 0;
  int totalIndex = 2;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                height: 25,
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
                  child: changeForm(size)),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SignIn()));
                    },
                    child: const Text(
                      'Back to start',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                          fontSize: 14),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget changeForm(Size size) {
    switch (activeIndex) {
      case 0:
        return findEmail(size);
      case 1:
        return changePassword(size);
      default:
        return findEmail(size);
    }
  }

  Widget findEmail(Size size) {
    var viewModel = Provider.of<ChangePasswordViewModel>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Registered Email',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
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
              hintText: 'Email address',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
          Visibility(
            visible: !visible,
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const LoadingToast(message: 'Please wait');
                          });
                      await viewModel.findEmail(email: _email.text);
                      Navigator.pop(context);

                      viewModel.message == 'Email found'
                          ? setState(() {
                              visible = !visible;
                            })
                          : message = viewModel.message;
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: const Text('Find Account')),
            ),
          ),
          Visibility(
            visible: visible,
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        activeIndex++;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: const Text('Next')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(message),
            ),
          )
        ],
      ),
    );
  }

  Widget changePassword(Size size) {
    var viewModel = Provider.of<ChangePasswordViewModel>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Password',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: !_showPassword1,
            controller: _pass,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password can't be empty";
              } else if (value.length < 8) {
                return "Password minimum is 8 charachter";
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword1 = !_showPassword1;
                  });
                },
                child: Icon(
                  _showPassword1 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              hintText: 'password',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            height: 10,
          ),
          const Text(
            'Confirm Password',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: !_showPassword2,
            controller: _confirmPass,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password can't be empty";
              } else if (value != _pass.text) {
                return "password don't match";
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword2 = !_showPassword2;
                  });
                },
                child: Icon(
                  _showPassword2 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              hintText: 'password',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const LoadingToast(message: 'Please wait');
                        });
                    await viewModel.forgotPass(pass: _pass.text);
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: viewModel.message,
                        backgroundColor: Colors.white,
                        textColor: kPrimaryColor);
                    Navigator.pushNamed(context, '/signin');
                  }
                },
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                child: const Text('Confirm')),
          )
        ],
      ),
    );
  }
}
