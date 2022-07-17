import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/loading_toast.dart';
import 'package:hospital_management/screen/forgot_pass/change_password_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword1 = false;
  bool _showPassword2 = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var viewModel = Provider.of<ChangePasswordViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/forgotpass.svg',
                  height: size.height * 0.28,
                ),
              ),
              const SizedBox(
                height: 30,
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
                          'Enter Password',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
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
                                _showPassword1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: 'password',
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
                          height: 10,
                        ),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
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
                                _showPassword2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: 'password',
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return const LoadingToast(
                                            message: 'Please Wait..');
                                      });
                                  await viewModel.changePassword(_pass.text);
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                      msg: viewModel.message,
                                      backgroundColor: Colors.white,
                                      textColor: kPrimaryColor);
                                  Navigator.pop(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: kPrimaryColor),
                              child: const Text('Confirm')),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
