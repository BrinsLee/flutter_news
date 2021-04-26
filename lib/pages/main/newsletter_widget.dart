import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/common/utils/screen.dart';
import 'package:flutter_new/common/values/colors.dart';
import 'package:flutter_new/common/widgets/widgets.dart';

Widget newsletterWidget() {
  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              'Newsletter',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: duSetFontSize(18),
                fontWeight: FontWeight.w600,
                color: AppColors.thirdElement,
              ),
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.thirdElementText,
                  size: duSetFontSize(17),
                ),
                onPressed: () {})
          ],
        ),
        inputEmailEdit(
          marginTop: 19,
          textInputType: TextInputType.emailAddress,
          hintText: "Email",
          isPassword: false,
          controller: null,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: btnFlatButtonWidget(
            onPressed: () {},
            width: duSetWidth(335),
            height: duSetHeight(44),
            fontWeight: FontWeight.w600,
            title: "Subscribe",
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(29)),
          width: duSetWidth(261),
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                text: 'By clicking on Subscribe button you agree to accept',
                style: new TextStyle(
                  color: AppColors.thirdElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(14),
                ),
              ),
              TextSpan(
                text: ' Privacy Policy',
                style: new TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(14),
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    toastInfo(msg: 'Privacy Policy');
                  },
              ),
            ]),
          ),
        ),
      ],
    ),
  );
}
