import 'package:flutter/material.dart';

import 'package:mini_project/Screens/checkout/checkoutview.dart';
import 'package:mini_project/Screens/checkout/custom/customtextfield.dart';
import 'package:mini_project/Screens/customwidgets/customappbar.dart';
import 'package:mini_project/Screens/customwidgets/custombutton.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  TextEditingController editControllerHome = TextEditingController();
  TextEditingController editControllerOffice = TextEditingController();

  addHomeAddress() {
    var addressHome = editControllerHome.text;
    if (addressHome.isNotEmpty) {
      address.add(addressHome);
      editControllerOffice.clear();
    }
  }

  addOfficeAddress() {
    var addressOffice = editControllerOffice.text;
    if (addressOffice.isNotEmpty) {
      address.add(addressOffice);
      editControllerOffice.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          color: Colors.grey,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 60,
              ),
              const CustomWhiteAppBar(title: 'Address'),
              CustomTextField(
                textName: 'Home',
                myTextEditingController: editControllerHome,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                textName: 'Office',
                hintText: 'Office Address',
                myTextEditingController: editControllerOffice,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.90,
                  child: CustomButton(
                    buttonText: 'Save',
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckoutView(),
                      ));
                      addHomeAddress();
                      addOfficeAddress();
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
