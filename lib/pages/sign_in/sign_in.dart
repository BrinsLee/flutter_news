import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/common/api/apis.dart';
import 'package:flutter_new/common/entity/entitys.dart';
import 'package:flutter_new/common/router/router.gr.dart';
import 'package:flutter_new/common/utils/utils.dart';
import 'package:flutter_new/common/values/colors.dart';
import 'package:flutter_new/common/values/radii.dart';
import 'package:flutter_new/common/values/shadows.dart';
import 'package:flutter_new/common/widgets/widgets.dart';
import 'package:flutter_new/global.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  ///// 事件函数
  _handleSignIn() async {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: "请输入正确的邮箱");
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: "密码不能小于6位");
      return;
    }

    UserRequestEntity requestEntity = UserRequestEntity(
      email: _emailController.value.text,
      password: duSHA256(_passController.value.text),
    );

    UserResponseEntity responseEntity =
        await UserApi.login(context: context, params: requestEntity);
    // 保存用户信息
    Global.saveProfile(responseEntity);
    print(responseEntity);
    // Navigator.pushNamed(context, "/app");
    context.rootNavigator.push(Routes.applicationPage);
  }

  _handleSignUp() {
    context.rootNavigator.push(Routes.signUpPage);
    /*Navigator.pushNamed(
      context,
      "/sign-up",
    );*/
  }

  ///// 组件函数
  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(84.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetHeight(76),
            width: duSetWidth(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    height: duSetHeight(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(duSetWidth(76 * 0.5))),
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: duSetHeight(15),
            ),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          )
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                btnFlatButtonWidget(
                  onPressed: _handleSignUp,
                  gbColor: AppColors.thirdElement,
                  title: "Sign up",
                ),
                Spacer(),
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                )
              ],
            ),
          ),
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                "Forget password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: _handleSignUp,
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildSignupButton(),
          ],
        ),
      ),
    );
  }
}
