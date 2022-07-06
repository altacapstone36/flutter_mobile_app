import 'package:flutter/material.dart';

import '../../../constants.dart';

class FormNurse extends StatefulWidget {
  const FormNurse({Key? key}) : super(key: key);

  @override
  State<FormNurse> createState() => _FormNurseState();
}

class _FormNurseState extends State<FormNurse> {
  final _formKey = GlobalKey<FormState>();
  final _bodyTemp = TextEditingController();
  final _height = TextEditingController();
  final _weight = TextEditingController();
  final _bloodTension = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0, bottom: 10),
            child: Text('Body Temp',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
          TextFormField(
            controller: _bodyTemp,
            decoration: InputDecoration(
              hintText: "30 C",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Body tempt can't be empty";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10),
            child: Text('Height',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
          TextFormField(
            controller: _height,
            decoration: InputDecoration(
              hintText: '170 cm',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Height can't be empty";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10),
            child: Text('Weight',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
          TextFormField(
            controller: _weight,
            decoration: InputDecoration(
              hintText: '70 kg',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Weight can't be empty";
              }
              return null;
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 10),
            child: Text('Blood Tension',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor)),
          ),
          TextFormField(
            controller: _bloodTension,
            decoration: InputDecoration(
              hintText: '120/80 mmHG',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Blood tension can't be empty";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20),
            child: SizedBox(
              width: size.width,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: const Text('COMPLETE')),
            ),
          )
        ],
      ),
    );
  }
}
