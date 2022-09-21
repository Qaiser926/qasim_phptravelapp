import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/authentication/agents/agentsLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/agents/agentsSignup.dart';
import 'package:phptravelapp/app/mobules/authentication/customer/customerLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/customer/customerSignup.dart';
import 'package:phptravelapp/app/mobules/authentication/supplier/supplierLogin.dart';
import 'package:phptravelapp/app/mobules/authentication/supplier/supplierSignup.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/component/expandedListAnimation.dart';
import 'package:phptravelapp/app/mobules/homePage/component/myScrollerBar.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/reusableText/dimension.dart';
import 'package:phptravelapp/app/reusableText/reusable_commonText.dart';
import 'package:phptravelapp/testingPage/testingmodel.dart';

const double _kScrollbarThickness = 12.0;

List currencyList = [
  'USD',
  'GBP',
  'SAR',
  'EUR',
  'pkr',
  'JPY',
  'INR',
  'CNY',
  'TRY',
  'RUB',
  'IRR',
];
bool selected = true;

class LanguageChange extends StatefulWidget {
  // const LanguageChange({Key? key}) : super(key: key);

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  List countryImage = [
    'images/turkish.jpg',
    'images/rassian.jpg',
    'images/philippen.png',
    'images/korean.jpg',
    'images/Khmer.png',
    'images/indonesia.png',
    'images/french.jpg',
    'images/spanish.jpg',
    'images/us.jpg',
    'images/german.jpg',
    'images/chines.jpg',
    'images/arabic.jpg',
  ];
  //   List<Widget> _buildList(HomeOfferListModelClass homeOfferListModelClass) {
  //     var list = new List<Widget>();
  //     var rootList = new List<Widget>();

  //     homeOfferListModelClass.languages!.forEach((element) {
  //       list.add(Padding(
  //         padding: EdgeInsets.all(8),
  //         child: Align(
  //           alignment: Alignment.centerRight,
  //           child: Text(
  //             element.name.toString(),
  //             style: TextStyle(fontSize: 12),
  //             textAlign: TextAlign.right,
  //           ),
  //         ),
  //       ));
  //     });
  //     rootList.add(IntrinsicHeight(
  //       child: Row(
  //         children: [
  //           Expanded(
  //               flex: 1,
  //               child: Column(
  //                 children: list,
  //               )),
  //           VerticalDivider(
  //             thickness: 2,
  //             width: 5,
  //           ),
  //           Expanded(child: Text('qaiser'))
  //         ],
  //       ),
  //     ));
  //     return rootList;
  //   }
  // List<HomeOfferListModelClass> homeofferControlerList =
  //     <HomeOfferListModelClass>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng = TranslationPage().getCurrentLang();

    // homeOfferList=
  }

  String? lng;

  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: InkWell(
        child: DropdownButton2(
          hint: Text(
            'English',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: TranslationPage.langs
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: lng,
          onChanged: (value) {
            setState(() {
              this.lng = value.toString();
              TranslationPage().changeLocale(value.toString());
            });
          },

          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
          // buttonElevation: 2,
          itemHeight: 40,
          // itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: Get.size.height * 0.3,
          // dropdownPadding: null,
          // dropdownDecoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(4),
          // ),
          // dropdownElevation: 8,
          // scrollbarRadius: const Radius.circular(10),
          // scrollbarThickness: 6,
          // scrollbarAlwaysShow: true,
          // offset: const Offset(0, 0),
        ),
      ),
    );

    // );
    /* DropdownButton(
      menuMaxHeight: Get.size.height*0.35,

      value: this.lng,
      underline: Container(),
      isExpanded: false,
      onChanged: (newVal){
        setState((){
          this.lng=newVal!;
          TranslationPage().changeLocale(newVal);
        });
      },
      items: TranslationPage.langs.map((value) {
      // items: langs.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              // Text('${txt[value]}'),
              Text(value),
            ],
          ),
        );
      }).toList(),*/
    // return  DropdownButton<String>(
    //   menuMaxHeight: Get.size.height*0.35,
    //
    //   value: this.lng,
    //   underline: Container(),
    //   isExpanded: false,
    //   onChanged: (newVal){
    //     setState((){
    //       this.lng=newVal!;
    //       TranslationPage().changeLocale(newVal);
    //     });
    //   },
    //   items: TranslationPage.langs.map(( value) {
    //     // items: langs.map((value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Row(
    //         children: [
    //           Image.asset(countryImage[2],width: 35,height: 35,),
    //           Text(value),
    //         ],
    //       ),
    //     );
    //   }).toList(),

    /*  return DropdownMenuItem(
    value: value['id'].toString(),
    child: Row(
    children: [
    Image.asset(value['image'],width: 35,height: 35,),
    // Text(value),
    Container(
    margin: EdgeInsets.only(left: 10),
    child: Text(value['name']),
    )
    ],
    ),
    );*/

    // );
  }
}

final List<DataList> data = <DataList>[
  DataList(
    'Mobiles',
    <DataList>[
      DataList('iphone'),
      DataList('vivo'),
      DataList('oppo'),
    ],
  ),
  DataList(
    'Laptops',
    <DataList>[
      DataList('Dell'),
      DataList('HP'),
    ],
  ),
  DataList(
    'name',
    <DataList>[
      DataList('qaiser'),
      DataList('ali'),
      DataList('ali'),
    ],
  ),
];

class DataList {
  DataList(this.title, [this.children = const <DataList>[]]);

  final String title;
  final List<DataList> children;
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  Widget _buildTiles(DataList root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<DataList>(root),
      title: Text(
        root.title,
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(popup);
  }
}

class DropDownPage extends StatefulWidget {
  @override
  State<DropDownPage> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownPage> {
  List<String> countryImage = [
    'images/turkish.jpg',
    'images/rassian.jpg',
    'images/philippen.png',
    'images/korean.jpg',
    'images/Khmer.png',
    'images/indonesia.png',
    'images/french.jpg',
    'images/spanish.jpg',
    'images/us.jpg',
    'images/german.jpg',
    'images/chines.jpg',
    'images/arabic.jpg'
  ];
  String _selectedLang = 'en';
  bool selectedLang = false;

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        // focusColor: Colors.black,
        //   hintColor: Colors.black,
      ),
      child: Scrollbar(
        isAlwaysShown: true,
        child: DropdownButton(
          borderRadius: BorderRadius.circular(6),
          style: TextStyle(color: Colors.orange),
          underline: Container(),
          menuMaxHeight: Get.size.height * 0.3,
          // dropdownColor: Colors.white,
          isExpanded: true,
          // focusColor: selectedLang?Colors.black:Colors.white,
          // style: TextStyle(color: Colors.black),
          value: _selectedLang,
          onChanged: (value) {
            setState(() {
              _selectedLang = value.toString();
              selectedLang = true;
              // TextStyle(color: Colors.black);
              // TextStyle(color:selected?Colors.black:Colors.white);
            });
            Get.updateLocale(Locale(_selectedLang));
          },
          items: [
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[0],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Turkish',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'turkish',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[1],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Rassian',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'ra',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[2],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Philippen',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'filipin',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[3],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Korean',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
              value: 'korean',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[4],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Khmer',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'Khmer',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[5],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Indonesia',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'indonesia',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[6],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'French',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'french',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[7],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Spanish',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'spanish',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[8],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'English',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'en',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[9],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'German',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'german',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[10],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Chiness',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'chnes',
            ),
            DropdownMenuItem(
              child: Row(
                children: [
                  Image.asset(
                    countryImage[11],
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    'Arabic',
                    style: TextStyle(
                        color: selected ? Colors.black : Colors.white,
                        fontSize: 17),
                  ),
                ],
              ),
              value: 'arabic',
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  String _selectedLang = 'USD';
  bool selectedLang = false;

  List currencyList = [
    'USD',
    'GBP',
    'SAR',
    'EUR',
    'pkr',
    'JPY',
    'INR',
    'CNY',
    'TRY',
    'RUB',
    'IRR',
  ];
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          // focusColor: Colors.black,
          //   hintColor: Colors.black,
        ),
        child:
            // Scrollbar(
            //   isAlwaysShown: true,
            //   child: DropdownButton(
            //     borderRadius: BorderRadius.circular(6),
            //     style: TextStyle(color: Colors.orange),
            //     underline: Container(),
            //     menuMaxHeight: Get.size.height*0.3,
            //     // dropdownColor: Colors.white,
            //     isExpanded: true,
            //     // focusColor: selectedLang?Colors.black:Colors.white,
            //     // style: TextStyle(color: Colors.black),
            //     value: _selectedLang
            //     , onChanged: (value){
            //     setState((){
            //       _selectedLang=value!;
            //       selectedLang =true;
            //       // TextStyle(color: Colors.black);
            //       // TextStyle(color:selected?Colors.black:Colors.white);
            //     });
            //     Get.updateLocale(Locale(_selectedLang));
            //   },
            //     items: [
            //
            //       DropdownMenuItem(child: Text('USD',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'usd',),
            //       DropdownMenuItem(child: Text('GBP',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20,),),value: 'gbp',),
            //       DropdownMenuItem(child: Text('SAR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'sar',),
            //       DropdownMenuItem(child: Text('EUR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 20),),value: 'eur',),
            //       DropdownMenuItem(child: Text('PKR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'pkr',),
            //       DropdownMenuItem(child: Text('JPY',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'jpy',),
            //       DropdownMenuItem(child: Text('INR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'inr',),
            //       DropdownMenuItem(child: Text('CNY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'cny',),
            //       DropdownMenuItem(child: Text('TRY',style: TextStyle(color:selected?Colors.black:Colors.white,fontSize: 17),),value: 'en',),
            //       DropdownMenuItem(child: Text('RUB',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'rub',),
            //       DropdownMenuItem(child: Text('IRR',style: TextStyle(color: selected?Colors.black:Colors.white,fontSize: 17),),value: 'irr',),
            //     ],
            //   ),
            // ),
            DropdownButtonHideUnderline(
          child: DropdownButton2(
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
            buttonHeight: 50,
            buttonWidth: 160,
            buttonPadding: const EdgeInsets.only(left: 5, right: 5),
            buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: Get.size.height * 0.3,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(10),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(0, 0),
            hint: Text(
              'USD',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: currencyList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: _selectedLang,
            onChanged: (value) {
              setState(() {
                _selectedLang = value as String;
              });
            },
          ),
        ));
  }
}

class ExpandableList extends StatefulWidget {
  const ExpandableList({super.key});

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  /*  List<Widget> _buildList(HomeOfferListModelClass homeOfferListModelClass) {
    var list = <Widget>[];
    var rootList = <Widget>[];

    homeOfferListModelClass.languages!.forEach((element) {
      list.add(Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            element.name.toString(),
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.right,
          ),
        ),
      ));
    });
    rootList.add(IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: list,
              )),
          VerticalDivider(
            thickness: 2,
            width: 5,
          ),
          Expanded(child: Text('qaiser'))
        ],
      ),
    ));
    return rootList;
  }

  List<HomeOfferListModelClass> homeofferControlerList =
      <HomeOfferListModelClass>[].obs;

  List<String>   myData = ['qaiser', 'qfaroo', 'qas', 'aadf'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeofferControlerList =
        myData.map((e) => HomeOfferListModelClass.fromJson(e)).toList();
    // homeOfferList=
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
        /*  child: ListView.builder(
        itemCount: homeofferControlerList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ExpansionTile(
                title: Text(homeofferControlerList[index]
                    .languages![index]
                    .country
                    .toString()),
                children: _buildList(homeofferControlerList[index]),
              ),
            ),
          );
        },
      ), */

        );
  }
}

// temprory drop down
class customDropDownListButton extends StatefulWidget {
  const customDropDownListButton({Key? key}) : super(key: key);

  @override
  State<customDropDownListButton> createState() =>
      _customDropDownListButtonState();
}

class _customDropDownListButtonState extends State<customDropDownListButton> {
  bool isVisible = false;
  bool istravellerVisible = false;
  bool isdropDownOpen = false;
  bool isCancel = false;
  bool isDropdownVisible = false;
  String Travellers = 'Travellers';
  String Rooms = 'Rooms';
  int childCount = 0;
  int adultCount = 1;
  int infants = 0;
  bool isSingleVisible = true;
  bool isDoubleVisible = false;
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lng = TranslationPage().getCurrentLang();

    // homeOfferList=
  }

  String? lng;

  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: dropdownButton(context),
    );
  }

  Container dropdownButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.5),
        // border: Border.all(
        //   color: Colors.grey.shade500.withOpacity(0.6),
        //   width: 0.5,
        // ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          style: TextStyle(color: Colors.transparent),
          buttonDecoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey.shade500.withOpacity(0.6),
            width: 0.5,
          )),
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'English',
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          items: TranslationPage.langs
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black54),
                        ),
                      ),
                    ),
                  ))
              .toList(),
          value: lng,
          onChanged: (value) {
            setState(() {
              this.lng = value.toString();
              TranslationPage().changeLocale(value.toString());
            });
          },
          buttonElevation: 0,
          dropdownElevation: 0,
          buttonHeight: 20,
          buttonWidth: 0,
          dropdownMaxHeight: 250,
          isExpanded: true,
          itemHeight: 35,
          // dropdownDecoration: BoxDecoration(
          //     color: Colors.white,
          //     border: Border.all(
          //       color: Colors.grey.shade400.withOpacity(0.7),
          //       width: 0.7,
          //     )),
        ),
      ),
    );
  }
}

/// ye wala original he
class CurrencyChanger extends StatefulWidget {
  const CurrencyChanger({Key? key}) : super(key: key);

  @override
  State<CurrencyChanger> createState() => _CurrencyChangerState();
}

class _CurrencyChangerState extends State<CurrencyChanger> {
  List currencyList = [
    'USD',
    'GBP',
    'SAR',
    'EUR',
    'pkr',
    'JPY',
    'INR',
    'CNY',
    'TRY',
    'RUB',
    'IRR',
  ];
  String code = 'USD';
  final controller = Get.find<HomeController>();

  bool isSelect = false;
  bool selected = true;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        botomsheet();
        // showModalBottomSheet(
        //     context: context, builder: (context) => botomsheet());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  // SizedBox(
                  //   width: Get.size.width * 0.085,
                  // ),
                  Text(
                    code,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  botomsheet() {
    // showModalBottomSheet(

    //     context: context, // rather context
    //     builder: (BuildContext bc) {
    //       return Container(
    //         child: new Wrap(
    //           children: <Widget>[
    //             ListTile(
    //                 leading: Icon(Icons.music_note),
    //                 title: Text('Music'),
    //                 onTap: () => {}),
    //             ListTile(
    //               leading: Icon(Icons.videocam),
    //               title: Text('Video'),
    //               onTap: () => {},
    //             ),
    //           ],
    //         ),
    //       );
    //     });
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.84,
          minChildSize: 0.4,
          // context: context,
          builder: (_, ctrl) {
            return Container(
              color: Colors.white,
              // height: Get.size.height * 0.74,
              child: Container(
                height: Get.size.height * 0,
                child: GetBuilder<HomeController>(builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(''),
                    ));
                  }
                  return ListView.builder(
                    controller: ctrl,
                    itemCount: currencyList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        //     CircleAvatar(
                        //   backgroundImage: AssetImage(countryImage[index]),
                        // ),
                        title: isSelect
                            ? Text(
                                controller.modal.value.currencies![index]
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 18),
                              )
                            : Text(
                                controller.modal.value.currencies![index].name
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                        onTap: () {
                          Get.back();
                          setState(() {
                            code = controller
                                .modal.value.currencies![index].name
                                .toString();

                            // ignore: unrelated_type_equality_checks
                          });
                        },
                      );
                    },
                  );
                }),
              ),
            );
          },
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(4), topRight: Radius.circular(4))),
          // backgroundColor: Colors.white,
        );
      },
      // child:
    );
  }
}
/*  return Container(
      margin: EdgeInsets.only(left: 10, right: 0),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.modalBottomSheet(
          showSelectedItems: true,
          // showSearchBox: true,
          // fit: FlexFit.loose,
          // scrollbarProps: ScrollbarProps(crossAxisMargin: 8),
          constraints:
              BoxConstraints(maxHeight: 500, maxWidth: double.infinity),
        ),

        // showSearchBox: true,
        // mode: Mode.BOTTOM_SHEET,
        items: [
          'USD',
          'GBP',
          'SAR',
          'EUR',
          'pkr',
          'JPY',
          'INR',
          'CNY',
          'TRY',
          'RUB',
          'IRR',
        ],

        dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          border: InputBorder.none,
        )),
        onChanged: (v) {},
        selectedItem: "USD",
        validator: (String? item) {
          if (item == null)
            return "Required field";
          else if (item == "Brazil")
            return "Invalid item";
          else
            return null;
        },
      ),
    );
  }
} */

class Athentication extends StatefulWidget {
  const Athentication({Key? key}) : super(key: key);

  @override
  State<Athentication> createState() => _AthenticationState();
}

class _AthenticationState extends State<Athentication> {
  String language = 'USD';
  final controller = Get.find<HomeController>();

  bool isSelect = false;

  String? selectedValue;
  String? account = 'Account';

  bool isVisible = false;
  String? lng;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: dropdownButton(context),
    );
  }

  Container dropdownButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 0),
      child: DropdownSearch<String>(
        dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
          border: InputBorder.none,
        )),
        // showSearchBox: true,
        // mode: Mode.BOTTOM_SHEET,
        popupProps: const PopupProps.modalBottomSheet(
          showSelectedItems: true,
          // showSearchBox: true,
          // fit: FlexFit.loose,
          // scrollbarProps: ScrollbarProps(crossAxisMargin: 8),
          constraints:
              BoxConstraints(maxHeight: 340, maxWidth: double.infinity),
        ),

        items: [
          'Customer Login',
          'Customer Signup',
          'Agents Login',
          'Agents Signup',
          'Supplier Login',
          'Supplier Signup',
        ],
        // dropdownSearchDecoration: InputDecoration(border: InputBorder.none),
        onChanged: (v) {},
        selectedItem: account,
        validator: (String? item) {
          if (item == null)
            return "Required field";
          else if (item == "Brazil")
            return "Invalid item";
          else
            return null;
        },
      ),
    );
  }
}

// ye wala b original he language changer class
class DropDownSearch extends StatefulWidget {
  const DropDownSearch({Key? key}) : super(key: key);

  @override
  State<DropDownSearch> createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   lng = TranslationPage().getCurrentLang();

  //   // homeOfferList=
  // }

  late final DropdownSearchBuilder dropdownBuilder;
  String language = 'English';
  final controller = Get.find<HomeController>();
  List<String> countryImage = [
    'images/arabic.jpg',
    'images/german.jpg',
    'images/us.jpg',
    'images/spanish.jpg',
    'images/german.jpg',
    'images/french.jpg',
    'images/rassian.jpg',
    'images/turkish.jpg',
    'images/philippen.png',
    'images/korean.jpg',
    'images/Khmer.png',
    'images/indonesia.png',
    'images/chines.jpg',
  ];
  String image = 'images/us.jpg';
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        botomsheet();
        // showModalBottomSheet(
        //     context: context, builder: (context) => botomsheet());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8),
                  //   child: Image.asset(
                  //     image,
                  //     width: 37,
                  //     height: 37,
                  //   ),
                  // ),
                  Container(
                    width: 35,
                    height: 35,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    language,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  botomsheet() {
    // showModalBottomSheet(

    //     context: context, // rather context
    //     builder: (BuildContext bc) {
    //       return Container(
    //         child: new Wrap(
    //           children: <Widget>[
    //             ListTile(
    //                 leading: Icon(Icons.music_note),
    //                 title: Text('Music'),
    //                 onTap: () => {}),
    //             ListTile(
    //               leading: Icon(Icons.videocam),
    //               title: Text('Video'),
    //               onTap: () => {},
    //             ),
    //           ],
    //         ),
    //       );
    //     });
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.84,
          minChildSize: 0.4,
          // context: context,
          builder: (_, ctrl) {
            return Container(
              color: Colors.white,
              // height: Get.size.height * 0.74,
              child: Container(
                height: Get.size.height * 0,
                child: GetBuilder<HomeController>(builder: (controller) {
                  if (controller.isLoading.value) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(''),
                    ));
                  }
                  return ListView.builder(
                    controller: ctrl,
                    itemCount: controller.modal.value.languages?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: Get.size.height * 0.015,
                          ),
                          ListTile(
                            leading: SizedBox(
                                height: Get.size.height * 0.15,
                                width: Get.size.width * 0.15,
                                child: Image.asset(countryImage[index])),

                            //     CircleAvatar(
                            //   backgroundImage: AssetImage(countryImage[index]),
                            // ),
                            title: isSelect
                                ? Text(
                                    controller
                                        .modal.value.languages![index].name
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  )
                                : Text(
                                    controller
                                        .modal.value.languages![index].name
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                            onTap: () {
                              Get.back();
                              setState(() {
                                language = controller
                                    .modal.value.languages![index].name
                                    .toString();
                                image = countryImage[index];
                                // ignore: unrelated_type_equality_checks
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
              ),
            );
          },
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(4), topRight: Radius.circular(4))),
          // backgroundColor: Colors.white,
        );
      },
      // child:
    );
  }
}

// ye wala original he
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text('Customer Login'),
                      onTap: () {
                        Get.to(CustomerLoginPage());
                      },
                    ),
                    ListTile(
                      title: Text('Customer Signup'),
                      onTap: () {
                        Get.to(CustomerSignupPage());
                      },
                    ),
                    ListTile(
                      title: Text('Agents Login'),
                      onTap: () {
                        Get.to(AgentsLogin());
                      },
                    ),
                    ListTile(
                      title: Text('Agents Signup'),
                      onTap: () {
                        Get.to(AgentsSignupPage());
                      },
                    ),
                    ListTile(
                      title: Text('Supplier Login'),
                      onTap: () {
                        Get.to(SupplierLogin());
                      },
                    ),
                    ListTile(
                      title: Text('Supplier Signup'),
                      onTap: () {
                        Get.to(SupplierSignup());
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // SizedBox(
                    //   width: Get.size.width * 0.09,
                    // ),
                    Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
