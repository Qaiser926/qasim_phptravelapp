import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/services/main_apiProvider.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:phptravelapp/testingPage/dummyPage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/mobules/services/main_apiProvider.dart';
import 'app/mobules/homePage/controller/homeController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // language changing store karta he
  await GetStorage.init(); // language changing store karta he
  await Hive.initFlutter();
  setPathUrlStrategy();
  // runApp(DevicePreview(builder: (context)=>travelapp()));
  runApp(travelapp());
}

class travelapp extends StatefulWidget {
  travelapp({Key? key}) : super(key: key);

  @override
  State<travelapp> createState() => _travelappState();
}

class _travelappState extends State<travelapp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // ye niche wala separate language class k liye
      translations: TranslationPage(),

      // language change k liye he
      locale: TranslationPage().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),

      // fallbackLocale: Locale('en'),
      // locale: Locale('en','US'),
      // fallbackLocale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      // home: DummyPage(),
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
// import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'dropdownSearch Demo',
//       //enable this line if you want test Dark Mode
//       //theme: ThemeData.dark(),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   // final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
//   // final _multiKey = GlobalKey<DropdownSearchState<String>>();
//   // final _popupBuilderKey = GlobalKey<DropdownSearchState<String>>();
//   // final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();
//   // final _userEditTextController = TextEditingController(text: 'Mrs');

//   // final controller = Get.put(HomeController());
//   // bool? _popupBuilderSelection = false;
//   List countryImage = [
//     'images/turkish.jpg',
//     'images/rassian.jpg',
//     'images/philippen.png',
//     'images/korean.jpg',
//     'images/Khmer.png',
//     'images/indonesia.png',
//     'images/french.jpg',
//     'images/spanish.jpg',
//     'images/us.jpg',
//     'images/german.jpg',
//     'images/chines.jpg',
//     'images/arabic.jpg',
//   ];
//   List name = ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'];
//   @override
//   Widget build(BuildContext context) {
//     void _handleCheckBoxState({bool updateState = true}) {
//       // var selectedItem =
//       //     _popupBuilderKey.currentState?.popupGetSelectedItems ?? [];
//       // var isAllSelected =
//       //     _popupBuilderKey.currentState?.popupIsAllItemSelected ?? false;
//       // _popupBuilderSelection =
//       //     selectedItem.isEmpty ? false : (isAllSelected ? true : null);

//       if (updateState) setState(() {});
//     }

//     _handleCheckBoxState(updateState: false);

//     return Scaffold(
//       appBar: AppBar(title: Text("DropdownSearch Demo")),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: ListView(
//             padding: EdgeInsets.all(4),
//             children: <Widget>[
//               ///************************[Favorites examples]**********************************///
//               Padding(padding: EdgeInsets.all(8)),
//               Text("[Favorites examples]"),
//               Divider(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownSearch<UserModel>(
//                       asyncItems: (filter) => getData(filter),
//                       compareFn: (i, s) => i.isEqual(s),
//                       popupProps: PopupProps.modalBottomSheet(
//                         isFilterOnline: true,
//                         showSelectedItems: true,

//                         // showSearchBox: true,
//                         itemBuilder: _customPopupItemBuilderExample2,
//                       ),
//                     ),
//                     //     child: DropdownSearch<String>(
//                     //   popupProps: PopupProps.modalBottomSheet(
//                     //     showSelectedItems: true,
//                     //     // disabledItemFn: (String s) => s.startsWith('I'),
//                     //   ),
//                     //   items: TranslationPage.langs,
//                     //   dropdownDecoratorProps: DropDownDecoratorProps(
//                     //     dropdownSearchDecoration: InputDecoration(
//                     //       labelText: "Menu mode",
//                     //       hintText: "country in menu mode",
//                     //     ),
//                     //   ),
//                     //   onChanged: print,
//                     //   selectedItem: "English",
//                     // ),
//                   ),
//                   Padding(padding: EdgeInsets.all(4)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _customPopupItemBuilderExample2(
//     BuildContext context,
//     UserModel? item,
//     bool isSelected,
//   ) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 8),
//       // decoration: !isSelected
//       //     ? null
//       //     : BoxDecoration(
//       //         border: Border.all(color: Theme.of(context).primaryColor),
//       //         borderRadius: BorderRadius.circular(5),
//       //         color: Colors.white,
//       //       ),
//       child: ListTile(
//           selected: isSelected,
//           title: Text(item?.name ?? ''),
//           // subtitle: Text(item?.createdAt?.toString() ?? ''),
//           leading: CircleAvatar(
//               // backgroundImage: AssetImage('images/turkish.jpg'),

//               )
//           //   // this does not work - throws 404 error
//           //   // backgroundImage: NetworkImage(item.avatar ?? ''),
//           // ),
//           // leading: Image.network(item?.avatar ?? ""),
//           ),
//     );
//   }

//   Future<List<UserModel>> getData(filter) async {
//     var response = await Dio().get(
//       "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
//       // 'https://phptravels.net/api/api/main/app?appKey=phptravels&lang=en&currency=usd',
//       queryParameters: {"filter": filter},
//     );

//     final data = response.data;
//     if (data != null) {
//       return UserModel.fromJsonList(data);
//     }

//     return [];
//   }
// }

// class UserModel {
//   final String id;
//   final DateTime? createdAt;
//   final String name;
//   final String? avatar;

//   UserModel(
//       {required this.id, this.createdAt, required this.name, this.avatar});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json["id"],
//       createdAt:
//           json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//       name: json["name"],
//       avatar: json["avatar"],
//     );
//   }

//   static List<UserModel> fromJsonList(List list) {
//     return list.map((item) => UserModel.fromJson(item)).toList();
//   }

//   ///this method will prevent the override of toString
//   // String userAsString() {
//   //   return '#${this.id} ${this.name}';
//   // }

//   ///this method will prevent the override of toString
//   bool userFilterByCreationDate(String filter) {
//     return this.createdAt?.toString().contains(filter) ?? false;
//   }

//   ///custom comparing function to check if two users are equal
//   bool isEqual(UserModel model) {
//     return this.id == model.id;
//   }

//   @override
//   String toString() => name;
// }
