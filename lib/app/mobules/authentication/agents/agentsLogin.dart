import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';
import 'package:phptravelapp/app/reusableText/authButton.dart';
import 'package:phptravelapp/app/reusableText/commonText.dart';
import 'package:phptravelapp/app/reusableText/reusable_commonText.dart';
import 'package:phptravelapp/app/reusableText/reusable_textfield.dart';

class AgentsLogin extends StatefulWidget {
  const AgentsLogin({Key? key}) : super(key: key);

  @override
  State<AgentsLogin> createState() => _AgentsLoginState();
}

class _AgentsLoginState extends State<AgentsLogin> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.to(BottomNavigationBarPage());
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Agents Login'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: Get.size.width,
              height: Get.size.height * 0.54,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                      title: 'Login',
                      fontWeight: FontWeight.w600,
                      size: 18,
                    ),
                    SmallText(
                      title: 'Please enter your account credentials below',
                      size: 15,
                    ),
                    SizedBox(height: 7),
                    SmallText(
                      title: 'Email',
                      size: 15,
                    ),
                    SizedBox(
                      height: 4.5,
                    ),
                    TextFieldClass(
                      isfalse: false,
                      hintText: 'Email',
                      icon: Icons.person_outline_outlined,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SmallText(
                      title: 'Password',
                      size: 15,
                    ),
                    SizedBox(
                      height: 4.5,
                    ),
                    TextFieldClass(
                      isfalse: true,
                      hintText: 'Password',
                      icon: Icons.lock_outline_rounded,
                      iconColor: Colors.black54,
                    ),
                    SizedBox(
                      height: Get.size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: Get.size.width * 0.4,
                            child: Container(
                                child: FlatButton(
                                    // here toggle the bool value so that when you click
                                    // on the whole item, it will reflect changes in Checkbox
                                    onPressed: () =>
                                        setState(() => isCheck = !isCheck),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 0.0,
                                              width: 0.0,
                                              child: Checkbox(
                                                  value: isCheck,
                                                  onChanged: (value) {
                                                    setState(
                                                        () => isCheck = value!);
                                                  })),
                                          // You can play with the width to adjust your
                                          // desired spacing
                                          SizedBox(width: 15.0),
                                          Text(
                                            "Remember Me",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          )
                                        ])))),
                        commonText(
                            title: 'Reset Password', Textcolor: Colors.grey),
                      ],
                    ),
                    SizedBox(
                      height: Get.size.height * 0.01,
                    ),
                    AuthButton(
                      title: 'Login',
                      onpress: () {},
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: Get.size.height * 0.014,
                    ),
                    AuthButton(
                      title: 'Signup',
                      onpress: () {},
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
