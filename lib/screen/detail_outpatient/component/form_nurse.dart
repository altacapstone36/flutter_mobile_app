import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/model/outpatient/process_model.dart';
import 'package:hospital_management/screen/outpatient/outpatient_view_model.dart';
import 'package:provider/provider.dart';

import '../../../components/loading_toast.dart';
import '../../../constants.dart';
import '../detail_outpatient_view_model.dart';

class FormNurse extends StatefulWidget {
  const FormNurse({Key? key, required this.idPatient}) : super(key: key);

  final int idPatient;

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
    var viewModel = Provider.of<DetailOutpatientViewModel>(context);
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const LoadingToast(
                                message: 'Processing Data...');
                          });
                      var data = ProcessNurseModel(
                          bloodTension: int.parse(_bloodTension.text),
                          height: int.parse(_height.text),
                          weight: int.parse(_weight.text),
                          bodyTemp: int.parse(_bodyTemp.text));
                      await viewModel.processNurse(
                          data: data, id: widget.idPatient);
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: viewModel.message, gravity: ToastGravity.CENTER);
                      Navigator.pop(context);
                      Provider.of<OutpatientViewModel>(context, listen: false)
                          .getOutpatient();
                    }
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
