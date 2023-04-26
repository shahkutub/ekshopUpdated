

 import 'package:active_ecommerce_flutter/data_model/country_list_response.dart';
import 'package:active_ecommerce_flutter/data_model/customer_information_response.dart';
import 'package:active_ecommerce_flutter/repositories/location_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../my_theme.dart';

class CheckOutScreen extends StatefulWidget {

  final double subTotal;
  final int shipping;
  final double vat;
  final DataCustomerInfo customerInfo;
  final List<CountryData> countryList;


  const CheckOutScreen({Key key, this.subTotal, this.shipping, this.vat,this.customerInfo,this.countryList}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();

 }

 class _CheckoutState extends State<CheckOutScreen> {
   // Default Radio Button Selected Item When App Starts.
   String radioButtonItemPickUp = 'Home';
   // Group Value for Radio Button.
   int radioIdPickUp = 1;

   // Default Radio Button Selected Item When App Starts.
   String radioButtonItemPayment = 'Cash';
   // Group Value for Radio Button.
   int radioIdPayment = 1;


   final _formKey = GlobalKey<FormState>();
   String dropdownValueCountry = 'Select country';
   String dropdownValueDivision = 'Select division';
   String dropdownValueDistrict = 'Select district';
   String dropdownValueUpozila = 'Select upozila';
   String dropdownValueUp = 'Select union parishad';

  var nameEditController = TextEditingController();
  var phoneEditController = TextEditingController();
  var emailEditController = TextEditingController();

   List<CountryData> divisionList = [];
   List<CountryData> districtList = [];
   List<CountryData> upozilaList = [];
   List<CountryData> upList = [];

  int countryid;
  int divisionId;
  int districtId;
  int upozilaId;
  //final divisionKey = GlobalKey<FormFieldState>();

  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    if(widget.customerInfo != null){
      nameEditController.text = widget.customerInfo.name;
      phoneEditController.text = widget.customerInfo.phone;
      emailEditController.text = widget.customerInfo.email;
    }

    widget.countryList.insert(0,CountryData(name: dropdownValueCountry));



  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   return Scaffold(
     appBar: buildAppBar(context),
     body: InkWell(
       onTap: (){
         FocusScope.of(context).requestFocus(FocusNode());
       },
       child: SingleChildScrollView(
         child: Container(
           margin: EdgeInsets.only(left: 15,right: 15),
           child: Column(
             children: [
               //pickup from
               Row(
                 children: [
                   Text('Pick Up Your Parcel From:'),
                   Radio(
                     value: 1,
                     groupValue: radioIdPickUp,
                     onChanged: (val) {
                       setState(() {
                         radioButtonItemPickUp = 'Home';
                         radioIdPickUp = 1;
                       });
                     },
                   ),
                   Text(
                     'Home',
                     style: new TextStyle(),
                   ),

                   Radio(
                     value: 2,
                     groupValue: radioIdPickUp,
                     onChanged: (val) {
                       setState(() {
                         radioButtonItemPickUp = 'Office';
                         radioIdPickUp = 2;
                       });
                     },
                   ),
                   Text('Office', style: new TextStyle(),),

                 ],
               ),
               Form(
                   key: _formKey,
                   child: Column(
                     children: [
                       //name email
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             width: width/2.2,
                             height: width/8,
                             child: TextFormField(
                               controller: nameEditController,
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter name';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Name',
                                 hintText: 'Name',
                                 contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),
                               style: TextStyle(fontSize: 13),
                             ),
                           ),
                           Container(
                             width: width/2.2,
                             height: width/8,
                             child: TextFormField(
                               controller: emailEditController,
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter email';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Email',
                                 hintText: 'Email',
                                 contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),
                               style: TextStyle(fontSize: 13,),
                               keyboardType: TextInputType.emailAddress,
                             ),
                           )
                         ],
                       ),
                       SizedBox(height: 20,),
                       //phone alter
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             width: width/2.2,
                             height: width/8,
                             child: TextFormField(
                               controller: phoneEditController,
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter phone number';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Phone Number',
                                 hintText: 'Phone Number',
                                 contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),
                               style: TextStyle(fontSize: 13,),
                               keyboardType: TextInputType.phone,
                             ),
                           ),
                           Container(
                             width: width/2.2,
                             height: width/8,
                             child: TextFormField(
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter alternative phone number';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 labelText: 'Alternative Phone Number',
                                 hintText: 'Alternative Phone Number',
                                 contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),
                               style: TextStyle(fontSize: 13,),
                               keyboardType: TextInputType.phone,
                             ),
                           )
                         ],
                       ),
                       SizedBox(height: 20,),
                       //country & division
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           widget.countryList.length>0?
                           Container(
                               width: width/2.2,
                               height: width/8,
                               child: InputDecorator(
                                 decoration: InputDecoration(
                                   contentPadding: EdgeInsets.symmetric(
                                       horizontal: 20.0, vertical: 15.0),
                                   labelText: 'Country',
                                   border:
                                   OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                 ),

                                 child: DropdownButtonHideUnderline(
                                   child:DropdownButton(
                                   //hint: Text("Select Country"),
                                   value: dropdownValueCountry,
                                   icon: const Icon(Icons.arrow_drop_down),
                                   iconSize: 24,
                                   elevation: 16,
                                   style: const TextStyle(color: Colors.black),

                                   onChanged: (String newValue)  {
                                     //setState(()  {
                                       dropdownValueCountry = newValue;
                                     //divisionKey.currentState.reset();
                                       widget.countryList.forEach((element){
                                         if(newValue != 'Select country' && newValue == element.name){
                                           countryid = element.id;
                                           getDivision();
                                         }
                                       });

                                     //});
                                   },
                                   items: widget.countryList.map((country){
                                     return DropdownMenuItem(
                                       child: Text(country.name),
                                       value: country.name,
                                     );
                                   }).toList(),
                                 ),  ),
                               )
                           ):SizedBox(),

                           Container(
                             width: width/2.2,
                             height: width/8,
                             child: InputDecorator(
                               decoration: InputDecoration(
                                 contentPadding: EdgeInsets.symmetric(
                                     horizontal: 20.0, vertical: 15.0),
                                 labelText: 'Division',
                                 border:
                                 OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),

                               child: divisionList.length>0?
                               DropdownButtonHideUnderline( child:DropdownButton(
                                 value: dropdownValueDivision,
                                 //key: divisionKey,
                                 icon: const Icon(Icons.arrow_drop_down),
                                 iconSize: 24,
                                 elevation: 16,
                                 style: const TextStyle(color: Colors.black),

                                 onChanged: (String newValue) {
                                  // setState(() {
                                     dropdownValueDivision = newValue;
                                     divisionList.forEach((element){
                                       if(newValue != 'Select division' && newValue == element.name){
                                         divisionId = element.id;
                                         getDistrict();
                                       }
                                     });
                                  // });
                                 },
                                 items: divisionList.map((country){
                                   return DropdownMenuItem(
                                     child: Text(country.name),
                                     value: country.name,
                                   );
                                 }).toList(),
                               ),):SizedBox(),
                             )
                           )
                         ],
                       ),
                       SizedBox(height: 20,),
                       //district upozila
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                               width: width/2.2,
                               height: width/8,
                               child: InputDecorator(
                                 decoration: InputDecoration(
                                   contentPadding: EdgeInsets.symmetric(
                                       horizontal: 20.0, vertical: 15.0),
                                   labelText: 'District',
                                   border:
                                   OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                 ),

                                 child: districtList.length>0?
                                 DropdownButtonHideUnderline( child:DropdownButton(
                                   value: dropdownValueDistrict,
                                   //key: divisionKey,
                                   icon: const Icon(Icons.arrow_drop_down),
                                   iconSize: 24,
                                   elevation: 16,
                                   style: const TextStyle(color: Colors.black),

                                   onChanged: (String newValue) {
                                     // setState(() {
                                     dropdownValueDistrict = newValue;
                                     districtList.forEach((element){
                                       if(newValue != 'Select district' && newValue == element.name){
                                         districtId = element.id;
                                         getUpozila();
                                       }
                                     });
                                     // });
                                   },
                                   items: districtList.map((country){
                                     return DropdownMenuItem(
                                       child: Text(country.name),
                                       value: country.name,
                                     );
                                   }).toList(),
                                 ),):SizedBox(),

                               )
                           ),
                           Container(
                               width: width/2.2,
                               height: width/8,
                               child: InputDecorator(
                                 decoration: InputDecoration(
                                   contentPadding: EdgeInsets.symmetric(
                                       horizontal: 20.0, vertical: 15.0),
                                   labelText: 'Upozila',
                                   border:
                                   OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                 ),

                                 child: upozilaList.length>0?
                                 DropdownButtonHideUnderline( child:DropdownButton(
                                   value: dropdownValueUpozila,
                                   //key: divisionKey,
                                   icon: const Icon(Icons.arrow_drop_down),
                                   iconSize: 24,
                                   elevation: 16,
                                   style: const TextStyle(color: Colors.black),

                                   onChanged: (String newValue) {
                                     // setState(() {
                                     dropdownValueUpozila = newValue;
                                     upozilaList.forEach((element){
                                       if(newValue != 'Select upozila' && newValue == element.name){
                                         upozilaId = element.id;
                                          getUp();
                                       }
                                     });
                                     // });
                                   },
                                   items: upozilaList.map((country){
                                     return DropdownMenuItem(
                                       child: Text(country.name),
                                       value: country.name,
                                     );
                                   }).toList(),
                                 ),):SizedBox(),

                               )
                           )
                         ],
                       ),
                       SizedBox(height: 20,),
                       //union
                       Container(
                           width: width,
                           height: width/8,
                           child: InputDecorator(
                             decoration: InputDecoration(
                               contentPadding: EdgeInsets.symmetric(
                                   horizontal: 20.0, vertical: 15.0),
                               labelText: 'Union Parishad',
                               border:
                               OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                             ),

                             child: upList.length>0?
                             DropdownButtonHideUnderline( child:DropdownButton(
                               value: dropdownValueUp,
                               //key: divisionKey,
                               icon: const Icon(Icons.arrow_drop_down),
                               iconSize: 24,
                               elevation: 16,
                               style: const TextStyle(color: Colors.black),

                               onChanged: (String newValue) {
                                 // setState(() {
                                 dropdownValueUp = newValue;
                                 upList.forEach((element){
                                   if(newValue != 'Select union parishad' && newValue == element.name){
                                     //upozilaId = element.id;
                                     //getUp();
                                   }
                                 });
                                 // });
                                 setState(() {

                                 });
                               },
                               items: upList.map((country){
                                 return DropdownMenuItem(
                                   child: Text(country.name),
                                   value: country.name,
                                 );
                               }).toList(),
                             ),):SizedBox(),


                           )
                       ),

                       SizedBox(height: 20,),
                       //Address
                       Container(
                         width: width,
                         //height: width/8,
                         child: TextFormField(
                           maxLines: 3,
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'Address';
                             }
                             return null;
                           },
                           decoration: InputDecoration(
                             labelText: 'Address',
                             hintText: 'Address',
                             contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                           ),
                           style: TextStyle(fontSize: 13,),
                           keyboardType: TextInputType.multiline,
                         ),
                       ),
                       SizedBox(height: 20,),
                       //Checkout Summary
                       Container(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Checkout Summary'),
                               Divider(),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Subtotal'),
                                   Text('${widget.subTotal.toStringAsFixed(2)} tk'),
                                 ],
                               ),
                               Divider(),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Shipping'),
                                   Text('50 tk'),
                                 ],
                               ),
                               Divider(),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Vat'),
                                   Text('0 tk'),
                                 ],
                               ),
                               Divider(),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('Payable Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                   Text('800 tk',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                               Divider(),

                               Row(
                                 children: [
                                   Container(
                                     height: width/8,
                                     width: width/1.4,
                                     child: TextFormField(
                                       validator: (value) {
                                         if (value.isEmpty) {
                                           return 'Please enter Coupon';
                                         }
                                         return null;
                                       },
                                       decoration: InputDecoration(
                                         labelText: 'Coupon',
                                         hintText: 'Coupon',
                                         contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                         border: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight:Radius.circular(0),topLeft: Radius.circular(5),topRight: Radius.circular(0),)),
                                       ),
                                       style: TextStyle(fontSize: 13),

                                     ),
                                   ),
                                   InkWell(
                                     onTap: (){

                                       },
                                     child: Container(
                                       alignment: Alignment.center,
                                       width: width/5,
                                       height: width/8,
                                       decoration: BoxDecoration(
                                         color: Colors.purple,
                                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight:Radius.circular(5),topLeft: Radius.circular(0),topRight: Radius.circular(5),)
                                       ),
                                       child: Text('Apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                     ),
                                   )
                                 ],
                               ),

                               SizedBox(height: 20,)


                             ],
                           )
                       ),

                       SizedBox(height: 20,),
                       //payment buttons
                       Container(
                         height: width/6,
                         child: ListView(
                           scrollDirection: Axis.horizontal,
                           children: [
                             Container(
                               width: width/2.5,
                               height: width/8,
                               decoration: BoxDecoration(
                                   border: Border.all(),
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 1,
                                     groupValue: radioIdPayment,
                                     onChanged: (val) {
                                       setState(() {
                                         radioButtonItemPayment = 'Cash';
                                         radioIdPayment = 1;
                                       });
                                     },
                                   ),
                                   Text(
                                     'Cash on delivery',
                                     style: new TextStyle(),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               width: width/2.5,
                               height: width/8,
                               decoration: BoxDecoration(
                                   border: Border.all(),
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 2,
                                     groupValue: radioIdPayment,
                                     onChanged: (val) {
                                       setState(() {
                                         radioButtonItemPayment = 'Nagad';
                                         radioIdPayment = 2;
                                       });
                                     },
                                   ),
                                   Text(
                                     'Nagad',
                                     style: new TextStyle(),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               width: width/2.5,
                               height: width/8,
                               decoration: BoxDecoration(
                                   border: Border.all(),
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 3,
                                     groupValue: radioIdPayment,
                                     onChanged: (val) {
                                       setState(() {
                                         radioButtonItemPayment = 'Bkash';
                                         radioIdPayment = 3;
                                       });
                                     },
                                   ),
                                   Text(
                                     'Bkash',
                                     style: new TextStyle(),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               width: width/2.5,
                               height: width/8,
                               decoration: BoxDecoration(
                                   border: Border.all(),
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Row(
                                 children: [
                                   Radio(
                                     value: 4,
                                     groupValue: radioIdPayment,
                                     onChanged: (val) {
                                       setState(() {
                                         radioButtonItemPayment = 'Rocket';
                                         radioIdPayment = 4;
                                       });
                                     },
                                   ),
                                   Text(
                                     'Rocket',
                                     style: new TextStyle(),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(width: 10,),
                           ],
                         ),
                       ),

                       SizedBox(height: 20,),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           InkWell(
                             child: Container(
                               alignment: Alignment.center,
                               width: width/2,
                               height: width/8,
                               decoration: BoxDecoration(
                                 color: Colors.purple,
                                   border: Border.all(color: Colors.purple),
                                   borderRadius: BorderRadius.circular(5)
                               ),
                               child: Text('Place Order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                             ),
                             onTap: (){

                             },
                           ),
                         ],
                       ),
                       SizedBox(height: 20,),

                     ],
                   )
               ),
             ],
           ),
         ),
       ),
     ),

   );

  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: MyTheme.dark_grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        'Check Out',
        style: TextStyle(fontSize: 16, color: MyTheme.accent_color),

      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  void getDivision() async{
    divisionList.clear();
    CountryListResponse countryListResponse = await LocationRepository().getDivisionListResponse(countryid);
    divisionList = countryListResponse.country_data;
    divisionList.insert(0,CountryData(name: dropdownValueDivision));
    setState(() {

    });
  }

   void getDistrict() async{
     districtList.clear();
     CountryListResponse countryListResponse = await LocationRepository().getDistrictListResponse(divisionId);
     districtList = countryListResponse.country_data;
     districtList.insert(0,CountryData(name: dropdownValueDistrict));

     setState(() {

     });
   }

   void getUpozila() async{
     upozilaList.clear();
     CountryListResponse countryListResponse = await LocationRepository().getUpozilaListResponse(districtId);
     upozilaList = countryListResponse.country_data;
     upozilaList.insert(0,CountryData(name: dropdownValueUpozila));

     setState(() {

     });
   }

   void getUp() async{
     upList.clear();
     CountryListResponse countryListResponse = await LocationRepository().getUpListResponse(upozilaId);
     upList = countryListResponse.country_data;
     upList.insert(0,CountryData(name: dropdownValueUp));

     setState(() {

     });
   }

 }

