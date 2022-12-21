import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/constants/colors.dart';
import 'package:flutter_senior_mobile_app/utils/size_config.dart';
import 'package:flutter_senior_mobile_app/utils/toast_utils.dart';
import 'package:flutter_senior_mobile_app/widgets/default_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar,
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 16),
              Text('Welcome John Doe.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  )),
              SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: tdRed)),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              '17,239',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Completed trips',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: tdRed)),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              'Ksh. 791K',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Revenue',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              status(),

              SizedBox(height: 18),
              Row(
                children: [
                  menuItem('Register a vehicle', (){}),
                  SizedBox(width: 8),
                  menuItem('Request \n fuel', (){}),
                ],
              ),

              SizedBox(height: 18),
              Row(
                children: [
                  menuItem('Accept \n Trips', (){}),
                  SizedBox(width: 8),
                  menuItem('Complete \n trips', (){}),
                ],
              ),
              SizedBox(height: 18),
              InkWell(
                onTap: (){
                  ToastUtils.showInfoToast('Action: Call Center');

                },
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: tdRed)),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 8),
                        Text('Contact Call Center',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(String description, Function cb){
    return Expanded(
      child: InkWell(
        onTap: (){
          ToastUtils.showInfoToast('Action: $description');
          cb.call();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: tdRed)),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                Text('$description',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget status() {
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
                text: "Status:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                )),
            TextSpan(
                text: "Available",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                )),
          ],
        ),
      ),
    );
  }
}
