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

class SupplierLogin extends StatefulWidget {
  const SupplierLogin({Key? key}) : super(key: key);

  @override
  State<SupplierLogin> createState() => _SupplierLoginState();
}

class _SupplierLoginState extends State<SupplierLogin> {
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
        // title: Text('Supplier Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.size.width,
                height: Get.size.height * 0.78,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey.shade300, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 0, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://phptravels.net/api/uploads/global/favicon.png',
                        width: Get.size.width * 0.15,
                        height: Get.size.height * 0.15,
                      ),
                      commonText(
                        title: 'Login',
                        fontWeight: FontWeight.w900,
                        size: 21,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SmallText(
                        title: 'Administrator Users Only',
                        size: 16,
                      ),
                      SizedBox(
                        height: Get.size.height * 0.05,
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
                        height: Get.size.height * 0.02,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      setState(() =>
                                                          isCheck = value!);
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
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.02,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Forget Password',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue[900],
                                    fontSize: 14),
                              ),
                              MaterialButton(
                                minWidth: Get.size.width * 0.06,
                                height: Get.size.height * 0.05,
                                color: Colors.blue[900],
                                onPressed: () {},
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.7),
                                ),
                              )
                            ],
                          )),
                      SizedBox(
                        height: Get.size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
