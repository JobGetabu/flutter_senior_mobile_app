import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/screens/home_screen.dart';
import 'package:flutter_senior_mobile_app/utils/size_config.dart';
import 'package:flutter_senior_mobile_app/widgets/default_amitruck_button.dart';
import 'package:flutter_senior_mobile_app/widgets/default_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = 'VerificationScreen';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  final TextEditingController _otpTextEditingController =
  TextEditingController();
  String? _otpText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            width: SizeConfig.screenWidth,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 16),
                  Text('Enter Verification Code to confirm Your Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0,)),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.all(4.0),
                    child: createOtpPinField(),
                  ),
                  SizedBox(height: 42),
                  PrimaryButton(
                    text: 'Validate and Continue',
                    displayLoading: false,
                    fontSize: 14,
                    height: 50,
                    press: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
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
                ],
              ),
            )),
      ),
    );
  }

  Widget createOtpPinField() {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      autoFocus: true,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      textStyle: GoogleFonts.nunito(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16),
        fieldHeight: 100,
        fieldWidth: 80,
        borderWidth: 0.5,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.grey,
        inactiveColor: Colors.grey,
        selectedColor: Colors.black,
        activeFillColor:  Colors.grey,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      validator: (v) {
        if ((v?.length ?? 0) < 3) {
          return 'EnterFullOTP';
        } else {
          return null;
        }
      },

      controller: _otpTextEditingController,
      onCompleted: (v) {
      },
      onChanged: (value) {
        setState(() {
          _otpText = value;
        });
      },
      onSaved: (value) {},
    );
  }
}
