import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_senior_mobile_app/screens/verification_screen.dart';
import 'package:flutter_senior_mobile_app/utils/toast_utils.dart';
import 'package:flutter_senior_mobile_app/widgets/default_amitruck_button.dart';
import 'package:flutter_senior_mobile_app/widgets/default_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/validations.dart';
import '../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String? _phoneNumber;
  CountryCode? _countryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height -
                  (defaultAppBar.preferredSize.height + 100),
              margin: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      Text('Enter Your Phone number to Join Amitruck',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0,)),
                      SizedBox(height: 32),

                      _buildPhoneNumberField(),
                      SizedBox(height: 42),
                      PrimaryButton(
                        text: 'Confirm and Continue',
                        displayLoading: false,
                        fontSize: 14,
                        height: 50,
                        press: () {

                          Navigator.pushNamed(context, VerificationScreen.routeName);
                        },
                      ),
                      Spacer(),
                      PrimaryButton(
                        text: 'Go Back',
                        displayLoading: false,
                        fontSize: 14,
                        height: 50,
                        backGroundColor: Colors.grey,
                        frontIcon: Icon(Icons.arrow_back, color: Colors.white,),
                        press: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
              ))),
    );
  }

  TextFormField _buildPhoneNumberField() {
    return TextFormField(
      validator: validateMobileNumber,
      onChanged: (value) {
        _phoneNumber = value.trim();
        setState(() {});
      },
      maxLength: 20,
      decoration: Decorations.outlineInputDecoration(onTap: () {}).copyWith(
          prefixIcon: _buildCountryCodePicker(),
          hintStyle: TextStyle(color: Colors.grey),
          hintText: 'Enter Phone Number',
          hintMaxLines: 1,
          counterText: ''),
      keyboardType: TextInputType.phone,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

  Widget _buildCountryCodePicker() {
    return CountryCodePicker(
      padding: EdgeInsets.only(left: 16.0),
      showDropDownButton: true,
      onChanged: (CountryCode countryCode) {
        _countryCode = countryCode;
        setState(() {});
      },
      onInit: (CountryCode? cc) {
        _countryCode = cc;
      },
      textStyle: TextStyle(color: Colors.grey),
      flagWidth: 22.0,
      initialSelection: _countryCode?.code,
      showCountryOnly: false,
      hideMainText: false,
      hideSearch: false,
      //countryFilter: state.countries,
      showOnlyCountryWhenClosed: false,
      comparator: (a, b) => b.name!.compareTo(a.name!),
      alignLeft: false,
    );
  }
}
