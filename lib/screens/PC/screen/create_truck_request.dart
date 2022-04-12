import 'package:cocoa/models/pc_model.dart';
import 'package:cocoa/my_functions.dart';
import 'package:cocoa/screens/PC/Components/my_progress_indicator.dart';
import 'package:cocoa/screens/PC/Provider/app_state.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';


class CreateTruckRequest extends StatefulWidget {
  const CreateTruckRequest({Key? key}) : super(key: key);

  @override
  _CreateTruckRequestState createState() => _CreateTruckRequestState();
}

class _CreateTruckRequestState extends State<CreateTruckRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? selectedDO;

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {

    }
  }

  @override
  Widget build(BuildContext context) {
    final _pro = Provider.of<appState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Create Truck Request"),
      ),
      body: ModalProgressHUD(
        progressIndicator: const MyProgressIndicator(),
        inAsyncCall: _pro.loading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children:   [
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value != null && value.trim().length < 3) {
                  //       return 'This field requires a minimum of 3 characters';
                  //     }
                  //
                  //     return null;
                  //   },
                  //   decoration: formDeco,
                  // ),

                  DropdownSearch<String>(
                    mode: Mode.BOTTOM_SHEET,
                    showSelectedItems: true,
                    showClearButton: true,
                    dropdownSearchDecoration: const InputDecoration(labelText: "Select District Office", border: OutlineInputBorder(borderSide: BorderSide(color: appColor))),
                    items: _pro.pcdetail!.districtsOffices == null ? [] : [
                      for (DistrictsOffices DO in _pro.pcdetail!.districtsOffices??[])
                        DO.name!
                    ],
                    onChanged: (value){
                          final List<DistrictsOffices> sel = _pro.pcdetail!.districtsOffices!.where((element) => element.name == value).toList();
                          if(sel.isNotEmpty){
                            selectedDO = sel.first.id.toString();
                          }
                          },
                  ),
              const SizedBox(height: 30,),

              TextButton(onPressed: (){
                if(selectedDO == null) {
                  MyFunc.showSnack(context: context, message: "Select district office");
                } else {
                  _pro.requestTruck(selectedDO!, context);
                }
              }, child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Request", style: TextStyle(color: Colors.white),),
              ),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appColor),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
