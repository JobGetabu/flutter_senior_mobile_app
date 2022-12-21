import 'package:flutter/material.dart';
import 'package:flutter_senior_mobile_app/utils/size_config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.press,
      this.height,
      this.hasBackground = true,
      this.fontSize,
      this.displayLoading = false,
      this.loaderSize = 40.0,
      this.frontIcon,
      this.disable = false,
      this.backGroundColor = tdRed,
      this.textColor = Colors.white,
      this.frontIconColor = Colors.white,
      this.width,
      this.iconHeight})
      : super(key: key);
  final String text;
  final Function()? press;
  final double? height;
  final bool hasBackground;
  final double? fontSize;
  final double loaderSize;
  final bool displayLoading;
  final bool disable;
  final String? frontIcon;
  final Color? backGroundColor;
  final Color? textColor;
  final Color? frontIconColor;
  final double? width;
  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height == 0 ? null : height ?? getProportionateScreenHeight(48),
      child: TextButton(
        style: ButtonStyle(
            alignment: Alignment.center,
            textStyle: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.disabled)
                    ? TextStyle(color: Colors.black)
                    : TextStyle(color: Colors.white)),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => states.contains(MaterialState.disabled)
                    ? tdGrey
                    : hasBackground
                        ? backGroundColor!
                        : Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)))),
        onPressed: !disable ? (!displayLoading ? press : null) : null,
        child: !displayLoading
            ? (frontIcon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        frontIcon!,
                        color: frontIconColor,
                        height: iconHeight ?? 18,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(fontSize ?? 18),
                              color: hasBackground
                                  ? textColor
                                  : Colors.white)),
                      Spacer()
                    ],
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(fontSize ?? 18),
                      color: hasBackground ? textColor : Colors.white,
                    ),
                  )
            : SpinKitThreeBounce(
                color: Colors.white,
                size: loaderSize,
              ),
      ),
    );
  }
}
