import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';
import 'package:phptravelapp/app/reusableText/authButton.dart';
import 'package:phptravelapp/app/reusableText/commonText.dart';
import 'package:phptravelapp/app/reusableText/reusable_commonText.dart';
import 'package:phptravelapp/app/reusableText/reusable_textfield.dart';

class CustomerSignupPage extends StatefulWidget {
  const CustomerSignupPage({Key? key}) : super(key: key);

  @override
  State<CustomerSignupPage> createState() => _CustomerSignupPageState();
}

class _CustomerSignupPageState extends State<CustomerSignupPage> {
  List<String> suggestons = [
    "Customer",
    "Supplier",
    "Agent",
  ];
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
        title: Text('Customer Signup'),
      ),
      body: ListView(
        // shrinkWrap: true,
        // physics: AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: Get.size.height * 0.045,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: Get.size.width,
                  // height: Get.size.height * 0.9,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 14, bottom: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(
                          title: 'Signup',
                          fontWeight: FontWeight.w600,
                          size: 19,
                        ),
                        SmallText(
                          title: 'Please enter your account credentials below',
                          size: 14,
                        ),
                        SizedBox(height: 7.5),
                        SmallText(
                          title: 'First Name',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        TextFieldClass(
                          isfalse: false,
                          hintText: 'First Name',
                          icon: Icons.person_outline_outlined,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SmallText(
                          title: 'Last Name',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        TextFieldClass(
                          isfalse: false,
                          hintText: 'Last Name',
                          icon: Icons.person_outline,
                          iconColor: Colors.black54,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SmallText(
                          title: 'Phone',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        TextFieldClass(
                          isfalse: false,
                          hintText: 'Phone',
                          icon: Icons.phone,
                          iconColor: Colors.black54,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SmallText(
                          title: 'Email',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        TextFieldClass(
                          isfalse: false,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          iconColor: Colors.black54,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SmallText(
                          title: 'Password',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        TextFieldClass(
                          isfalse: false,
                          hintText: 'Password',
                          icon: Icons.lock_outline,
                          iconColor: Colors.black54,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        SmallText(
                          title: 'Account Type',
                          size: 14,
                        ),
                        SizedBox(
                          height: 4.5,
                        ),
                        autocompleteTextfield(),
                        SizedBox(
                          height: Get.size.height * 0.015,
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
            ),
          ),
        ],
      ),
    );
  }

  Container autocompleteTextfield() {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.064,
      child: Autocomplete<String>(
          // check now the giving strng and matching string are match or not
          optionsBuilder: (TextEditingValue value) {
            // if (value.text.isEmpty) {
            //   return List.empty();
            // }
            return suggestons
                .where((element) =>
                    element.toLowerCase().contains(value.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (BuildContext context,
                  TextEditingController controller,
                  FocusNode node,
                  Function onSubmit) =>
              TextFormField(
                cursorColor: Colors.black54,
                controller: controller,
                focusNode: node,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.black54,
                    size: 21,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(left: 0, top: 0, right: 10),
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ),
                  // enabledBorder: const OutlineInputBorder(
                  //   borderSide: BorderSide(width: 3, color: Colors.amber),
                  // ),

                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 0.7),
                    // borderRadius: BorderRadius.circular(25.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
          onSelected: (value) => print((value)),
          optionsViewBuilder: (BuildContext context, Function onSelect,
              Iterable<String> dataList) {
            return Container(
              decoration: BoxDecoration(),
              child: Material(
                elevation: 30,
                child: ListView.builder(
                  itemCount: dataList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    String d = dataList.elementAt(index);
                    {
                      return InkWell(
                        onTap: () => onSelect(d),
                        child: Container(
                            height: Get.size.height * 0.07,
                            margin: EdgeInsets.only(right: 27),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.6, color: Colors.grey.shade200)),
                            child: Container(
                              width: Get.size.width,
                              height: Get.size.height * 0.07,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 6, right: 6),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SmallText(
                                                      title: d,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
            );
          },
          initialValue: TextEditingValue(text: 'Supplier'),

          // display data from api
          displayStringForOption: (
            d,
          ) {
            return "${d}";
          }),
    );
  }
}
