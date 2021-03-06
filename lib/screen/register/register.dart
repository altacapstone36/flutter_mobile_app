import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/components/loading_toast.dart';
import 'package:hospital_management/model/user/register_model.dart';
import 'package:hospital_management/screen/register/register_view_model.dart';
import 'package:hospital_management/screen/signin/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedGender = 'male';
  String selectedRole = 'doctor';
  String selectedFacility = 'general';

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();

  int activeIndex = 0;
  int totalIndex = 3;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          setState(() {});
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 10),
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/signup.svg',
                      height: size.height * 0.27,
                      width: size.height * 0.3,
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
                      child: switchForm(size)),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Already Have Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget switchForm(Size size) {
    switch (activeIndex) {
      case 0:
        return form1(size);
      case 1:
        return form2(size);
      case 2:
        return form3(size);
      default:
        return form1(size);
    }
  }

  Widget form1(Size size) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Name',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              if (value.length < 3) {
                return 'Name cannot be less than 3';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Your Name Here',
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
            height: 7,
          ),
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 5,
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
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintText: 'Enter Email',
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
            height: 7,
          ),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: true,
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
              hintText: 'Create Password',
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
            height: 7,
          ),
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
            title: const Text('Male'),
          ),
          ListTile(
            leading: Radio<String>(
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),
            title: const Text('Female'),
          ),
          //
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      activeIndex++;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                child: const Text('Next')),
          )
        ],
      ),
    );
  }

  Widget form2(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Role',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        ListTile(
          leading: Radio<String>(
            value: '2',
            groupValue: selectedRole,
            onChanged: (String? value) {
              setState(() {
                selectedRole = value!;
              });
            },
          ),
          title: const Text('Doctor'),
        ),
        ListTile(
          leading: Radio<String>(
            value: '3',
            groupValue: selectedRole,
            onChanged: (String? value) {
              setState(() {
                selectedRole = value!;
              });
            },
          ),
          title: const Text('Nurse'),
        ),
        SizedBox(
          width: size.width,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  activeIndex++;
                });
              },
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: const Text('Next')),
        )
      ],
    );
  }

  Widget form3(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Facility',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        ListTile(
          leading: Radio<String>(
            value: '1',
            groupValue: selectedFacility,
            onChanged: (String? value) {
              setState(() {
                selectedFacility = value!;
              });
            },
          ),
          title: const Text('General'),
        ),
        ListTile(
          leading: Radio<String>(
            value: '2',
            groupValue: selectedFacility,
            onChanged: (String? value) {
              setState(() {
                selectedFacility = value!;
              });
            },
          ),
          title: const Text('Pediantrecian'),
        ),
        ListTile(
          leading: Radio<String>(
            value: '3',
            groupValue: selectedFacility,
            onChanged: (String? value) {
              setState(() {
                selectedFacility = value!;
              });
            },
          ),
          title: const Text('Dentist'),
        ),
        SizedBox(
          width: size.width,
          child: ElevatedButton(
              onPressed: () async {
                var viewModel =
                    Provider.of<RegisterViewModel>(context, listen: false);
                showDialog(
                    context: context,
                    builder: (context) {
                      return const LoadingToast(message: 'Please Wait...');
                    });

                var data = RegisterModel(
                    email: _email.text,
                    password: _pass.text,
                    facilityId: int.parse(selectedFacility),
                    fullName: _name.text,
                    gender: selectedGender,
                    roleId: int.parse(selectedRole));

                await viewModel.register(data);
                Navigator.pop(context);
                Fluttertoast.showToast(
                    msg: viewModel.message,
                    backgroundColor: Colors.white,
                    textColor: kPrimaryColor);

                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const SignIn()));
              },
              style: ElevatedButton.styleFrom(primary: kPrimaryColor),
              child: const Text('Sign Up')),
        )
      ],
    );
  }
}
