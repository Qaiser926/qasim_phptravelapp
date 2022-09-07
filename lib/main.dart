
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phptravelapp/app/language_translation_string/languageTranslation.dart';
import 'package:phptravelapp/app/mobules/homePage/api_servies/api_provider.dart';
import 'package:phptravelapp/routes/app_pages/app_pages.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/mobules/homePage/api_servies/api_provider.dart';
import 'app/mobules/homePage/controller/homeController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // language changing store karta he
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
    return  GetMaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // ye niche wala separate language class k liye
      translations: TranslationPage(),



    // language change k liye he
      locale:TranslationPage().getCurrentLocale(),
      fallbackLocale: Locale('en','US'),


      // fallbackLocale: Locale('en'),
      // locale: Locale('en','US'),
      // fallbackLocale: Locale('en','US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' as rootBundle;
//
// import 'app/mobules/homePage/HomeModel/modelClass.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//           future: ReadJsonData(),
//           builder: (context, data) {
//             if (data.hasError) {
//               return Center(child: Text("${data.error}"));
//             } else if (data.hasData) {
//               var items = data.data as List<ProductDataModel>;
//               return ListView.builder(
//                   itemCount: items == null ? 0 : items.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 5,
//                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                       child: Container(
//                         padding: EdgeInsets.all(8),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 50,
//                               height: 50,
//                               child: Image(
//                                 image:
//                                 NetworkImage(items[index].imageURL.toString()),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             Expanded(
//                                 child: Container(
//                                   padding: EdgeInsets.only(bottom: 8),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 8, right: 8),
//                                         child: Text(
//                                           items[index].name.toString(),
//                                           style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 8, right: 8),
//                                         child: Text(items[index].price.toString()),
//                                       )
//                                     ],
//                                   ),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     );
//                   });
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         )
//     );
//   }
//
//   Future<List<ProductDataModel>> ReadJsonData() async {
//     final jsondata = await rootBundle.rootBundle.loadString('jsonfile/jsonfile.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => ProductDataModel.fromJson(e)).toList();
//   }
// }