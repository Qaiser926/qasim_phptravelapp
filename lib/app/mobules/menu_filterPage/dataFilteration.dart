import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:input_slider/input_slider.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailpage.dart';


String _selectedLang='en';
bool selectedLang=false;

class DataFilteration extends StatefulWidget {
  @override
  State<DataFilteration> createState() => _DataFilterationState();
}

class _DataFilterationState extends State<DataFilteration> {
  
  final List locale=[
    {'name':'ENGLISH','locale':Locale('en','US')},
    {'name':'АНГЛИЙСКИЙ','locale':Locale('en','IS')},
    {'name':'姓名','locale':Locale('zh','CN')},
  ];


   String? selected;
  List<Map> _mapList=[
    {
      'id': '1',
      'image':""
    }
  ];


  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  builddialog(BuildContext context){
    showDialog(context: context, builder: (builder){

      return

        AlertDialog(
        title: Text('Choose a language'),
        content: Container(
          width: double.maxFinite,
          child:ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      updateLanguage(locale[index]['locale']);
                    },
                    child: Text(locale[index]['name'],));
              },
              separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              },
              itemCount: locale.length) ,
        ),
      );


    });
  }

  // const DataFilteration({Key? key}) : super(key: key);
  static double _lowerValue=1.0;
  static double _upperValue=1000.0;
  double brightness=0.0;
  RangeValues values=RangeValues(_lowerValue, _upperValue);


  bool isCheck=false;
  bool isradio=false;
  bool apartment=false;
  bool home=false;
  bool hotel=false;
  bool resort=false;

  bool freebreaking=false;
  bool freeparking=false;
  bool pool =false;
  bool petfriendly=false;
  bool freewifi=false;

  // void dropdowncallback(){
  //   if(selectedValue is String){
  //     setState((){
  //
  //     })
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.mainColor,
        surfaceTintColor:TColor.mainColor,
        title: Text('Filters',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
        centerTitle: true,
      actions: [

      ],
      automaticallyImplyLeading: false,
      leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: selectedLang?Icon(Icons.arrow_back_ios):Icon(Icons.close,color: Colors.black,)),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              // color: Colors.black,
              // child: Scrollbar(
              //   isAlwaysShown: true,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.black,
                ),
                child: DropdownButton(
                    menuMaxHeight: Get.size.height*0.3,
                    // dropdownColor: Colors.black,
                    focusColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    items: [
                      DropdownMenuItem(child: Text('Turkish',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'turkish',),
                      DropdownMenuItem(child: Text('Rassian',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'ra',),
                      DropdownMenuItem(child: Text('Philippen',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'filipin',),
                      DropdownMenuItem(child: Text('Korean',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'korean',),
                      DropdownMenuItem(child: Text('Khmer',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'Khmer',),
                      DropdownMenuItem(child: Text('Indonesia',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'indonesia',),
                      DropdownMenuItem(child: Text('French',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'french',),
                      DropdownMenuItem(child: Text('Spanish',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'spanish',),
                      DropdownMenuItem(child: Text('English',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'en',),
                      DropdownMenuItem(child: Text('German',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'german',),
                      DropdownMenuItem(child: Text('Chiness',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'chnes',),
                      DropdownMenuItem(child: Text('Arabic',style: TextStyle(color: Colors.white,fontSize: 17),),value: 'arabic',),
                    ],
                    value: _selectedLang
                    , onChanged: (value){
                  setState((){
                    _selectedLang=value!;
                    selectedLang=true;
                  });
                  Get.updateLocale(Locale(_selectedLang));
                }),
              ),
            ),

            // FlutterSlider(
            //   values: [30, 420],
            //   max: 1000,
            //   min: 0,
            //   tooltip: FlutterSliderTooltip(
            //     leftPrefix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
            //     rightSuffix: Icon(Icons.attach_money, size: 19, color: Colors.black45,),
            //   ),
            //   onDragging: (handlerIndex, lowerValue, upperValue) {
            //     _lowerValue = lowerValue;
            //     _upperValue = upperValue;
            //     setState(() {
            //
            //     });
            //   },
            // )

           // commonText('Price ( for 1 night)'),
            SizedBox(height: 16,),
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('featuretourPriceText'.tr),
                  Text(' ('),
                  Text('for 1 night'.tr),
                  Text(')')
                ],
              ),
            ),*/
            SizedBox(height: 10,),
          /*  Padding(
              padding: const EdgeInsets.all(6.0),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  rangeThumbShape: RoundRangeSliderThumbShape(

                    enabledThumbRadius: 10,
                    // disabledThumbRadius: 10,
                    elevation: 6
                  )
                ),
                child: RangeSlider(
                  labels: RangeLabels(values.start.toString(),values.end.toString()),
                  activeColor: TColor.maingreenColor,
                  inactiveColor: TColor.mainColor,
                  values:values,
                min: _lowerValue,
                  max: _upperValue,
                  onChanged: (val){
                  setState((){
                    print(val);
                    values=val;
                  });
                  },
                ),
              ),
            ),
*/
          /*  commonText('Popular filters'.tr),*/

        /*  Container(
            width: Get.size.width,
            height: Get.size.height*0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // direction: Axis.horizontal,
              // runSpacing: 2,
              // spacing: 2,
              // verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  width: Get.size.width*0.99,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.size.width*0.48,
                          child: Row(
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (v){
                                  setState((){
                                    isCheck=v!;
                                  });
                                },
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text('Free Breakfast'.tr),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.size.width*0.48,
                          child: Row(

                            children: [
                              Checkbox(
                                activeColor: TColor.maingreenColor,
                                value: isCheck,
                                onChanged: (v){
                                  setState((){
                                    isCheck=v!;
                                  });
                                },
                              ),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('Free Parking'.tr),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: Get.size.width*0.99,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.size.width*0.48,
                          child: Row(
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (v){
                                  setState((){
                                    isCheck=v!;
                                  });
                                },
                              ),
                              Text('Pool'.tr),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.size.width*0.48,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (v){
                                  setState((){
                                    isCheck=v!;
                                  });
                                },
                              ),
                              Expanded(child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('pet Friendly'.tr),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.size.width*0.99,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          child: Row(
                            children: [
                              Checkbox(
                                value: isCheck,
                                onChanged: (v){
                                  setState((){
                                    isCheck=v!;
                                  });
                                },
                              ),
                              Text('Free Wifi'.tr),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            // child: Wrap(
            //   direction: Axis.horizontal,
            //   runAlignment: WrapAlignment.spaceEvenly,
            //   children: [
            //     CheckboxListTile(
            //       dense: true,
            //
            //       controlAffinity: ListTileControlAffinity.leading,
            //       title: Text('Free Breaking'),
            //         value: freebreaking, onChanged: (index){
            //           freebreaking=index!;
            //     }
            //     ), CheckboxListTile(    dense: true, controlAffinity: ListTileControlAffinity.leading,
            //       title: Text('Free Breaking'),
            //         value: freebreaking, onChanged: (index){
            //           freebreaking=index!;
            //     }
            //     ), CheckboxListTile(     dense: true,controlAffinity: ListTileControlAffinity.leading,
            //       title: Text('Free Breaking'),
            //         value: freebreaking, onChanged: (index){
            //           freebreaking=index!;
            //     }
            //     ),
            //   ],
            // ),
          ),
*/
/*
            commonText('Distance from city center'.tr),*/
            // InputSlider(
            //   onChange: (value) => print("change: $value"),
            //   min: 0.0,
            //   max: 100.0,
            //   decimalPlaces: 0,
            //   // value: 50.0,
            //   // leading: Text("Percentage:"),
            //   defaultValue: 50,
            // ),

/*
            commonText('Type of Accommodation'.tr),*/
          /* SwitchListTile(
             activeColor: TColor.maingreenColor,
             value: (isradio||apartment||home||hotel||resort), onChanged: (index){
             setState((){
               // if(isradio==index || apartment==index|| home==index||hotel==index||resort==index){
               home=index;
               isradio=index;
               apartment=index;
               hotel=index;
               resort=index;
               // }
             });
           },
           title: Text('All'.tr),
           ),*/
        /*    SwitchListTile( activeColor: TColor.maingreenColor,value: (apartment), onChanged: (index){
              setState((){

                isradio=index;
                apartment=index;

              });
            },
              title: Text('Apartment'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (home), onChanged: (index){
              setState((){
                home=index;
                isradio=index;

              });
            },
              title: Text('Home'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (hotel), onChanged: (index){
              setState((){

                isradio=index;

                hotel=index;

              });
            },
              title: Text('Hotel'.tr),
            ),
            SwitchListTile( activeColor: TColor.maingreenColor,value: (resort), onChanged: (index){
              setState((){

                isradio=index;

                resort=index;
              });
            },
              title: Text('Resort'.tr),
            ),

            SizedBox(height: Get.size.height*0.03,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(onPressed: (){},
                minWidth: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text('Apply'.tr,style: TextStyle(color: Colors.white),),
              ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: TColor.maingreenColor,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
  Widget commonText(String title,){
    return  Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Text(title),
        ));
  }

  // Widget dropDownButton(){
  //   return
  //
  // }
}
