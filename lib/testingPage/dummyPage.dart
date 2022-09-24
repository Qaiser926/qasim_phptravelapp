// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:phptravelapp/app/mobules/services/controller/flightDetail_controller.dart';
// import 'package:phptravelapp/app/mobules/services/data/api/flightDetail_ApiClient.dart';

// class DummyPage extends StatefulWidget {
//   const DummyPage({Key? key}) : super(key: key);

//   @override
//   State<DummyPage> createState() => _DummyPageState();
// }

// class _DummyPageState extends State<DummyPage> {
//   final controller = Get.put(FlightDetailController());
//   // var data = FlightDetailApiClientProvider.getFlightDetailData();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         width: double.infinity,
//         height: 400,
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     print("the api data is :$data");
//                   });
//                 },
//                 child: Text('press me ')),
//             GetBuilder<FlightDetailController>(builder: (flightController) {
//               return Container(
//                 width: double.infinity,
//                 height: 300,
//                 child: ListView.builder(
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     return Text(flightController.modal.value.name.toString());
//                   },
//                 ),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }
