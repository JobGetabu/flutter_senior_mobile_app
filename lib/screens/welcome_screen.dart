import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/constants/colors.dart';
import 'package:flutter_senior_mobile_app/screens/login_screen.dart';
import 'package:flutter_senior_mobile_app/utils/size_config.dart';
import 'package:flutter_senior_mobile_app/utils/toast_utils.dart';
import 'package:flutter_senior_mobile_app/widgets/default_amitruck_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'WelcomeScreen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    setUpScreenUtil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.4,),
            Text('Welcome To Amitruck Driver', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0
            )),
            SizedBox(height:16),
            Text('A simple Reliable Logistics App', style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0
            )),
            SizedBox(height:16),
            Spacer(),
            termsConditions(),
            SizedBox(height:16),
            PrimaryButton(
              text: 'Accept T&C and Continue',
              displayLoading: false,
              fontSize: 14,
              height: 50,
              press: (){
                ToastUtils.showSuccessToast('Accepted terms and Conditions!');

                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
            SizedBox(height:16),
          ],
        ),
      ),
    );
  }

  Widget termsConditions() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          children: <TextSpan>[

            TextSpan(
                text: "Terms and Conditions",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchTermsURL('https://www.amitruck.com/terms-of-service/');
                  }),
          ],
        ),
      ),
    );
  }

  void _launchTermsURL(String urlLink) async {
    await canLaunchUrl(Uri.parse(urlLink))
        ? await launchUrl(Uri.parse(urlLink))
        : ToastUtils.showErrorToast('Not Open Terms & Condition');
  }

  void setUpScreenUtil(BuildContext context) {
    SizeConfig().init(context);
  }
}
