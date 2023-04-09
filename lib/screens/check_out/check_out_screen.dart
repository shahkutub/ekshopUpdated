

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../my_theme.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();

 }

 class _CheckoutState extends State<CheckOutScreen> {
   // Default Radio Button Selected Item When App Starts.
   String radioButtonItem = 'Home';

   // Group Value for Radio Button.
   int id = 1;
   final _formKey = GlobalKey<FormState>();
   String dropdownValueCountry = 'Select Country';
   String dropdownValueDivision = 'Select division';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
   return Scaffold(
     appBar: buildAppBar(context),
     body: SingleChildScrollView(
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
                   groupValue: id,
                   onChanged: (val) {
                     setState(() {
                       radioButtonItem = 'Home';
                       id = 1;
                     });
                   },
                 ),
                 Text(
                   'Home',
                   style: new TextStyle(),
                 ),

                 Radio(
                   value: 2,
                   groupValue: id,
                   onChanged: (val) {
                     setState(() {
                       radioButtonItem = 'Office';
                       id = 2;
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
                     //country division
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
                                 labelText: 'Country',
                                 border:
                                 OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                               ),

                               child: DropdownButtonHideUnderline( child:DropdownButton<String>(
                                 value: dropdownValueCountry,
                                 icon: const Icon(Icons.arrow_drop_down),
                                 iconSize: 24,
                                 elevation: 16,
                                 style: const TextStyle(color: Colors.deepPurple),

                                 onChanged: (String newValue) {
                                   setState(() {
                                     dropdownValueCountry = newValue;
                                   });
                                 },
                                 items: <String>['Select Country', 'Two', 'Free', 'Four']
                                     .map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value),
                                   );
                                 }).toList(),
                               ),  ),
                             )
                         ),

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

                             child: DropdownButtonHideUnderline( child:DropdownButton<String>(
                               value: dropdownValueDivision,
                               icon: const Icon(Icons.arrow_drop_down),
                               iconSize: 24,
                               elevation: 16,
                               style: const TextStyle(color: Colors.deepPurple),

                               onChanged: (String newValue) {
                                 setState(() {
                                   dropdownValueDivision = newValue;
                                 });
                               },
                               items: <String>['Select division', 'Two', 'Free', 'Four']
                                   .map<DropdownMenuItem<String>>((String value) {
                                 return DropdownMenuItem<String>(
                                   value: value,
                                   child: Text(value),
                                 );
                               }).toList(),
                             ),  ),
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

                               child: DropdownButtonHideUnderline( child:DropdownButton<String>(
                                 value: dropdownValueCountry,
                                 icon: const Icon(Icons.arrow_drop_down),
                                 iconSize: 24,
                                 elevation: 16,
                                 style: const TextStyle(color: Colors.deepPurple),

                                 onChanged: (String newValue) {
                                   setState(() {
                                     dropdownValueCountry = newValue;
                                   });
                                 },
                                 items: <String>['Select Country', 'Two', 'Free', 'Four']
                                     .map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value),
                                   );
                                 }).toList(),
                               ),  ),
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

                               child: DropdownButtonHideUnderline( child:DropdownButton<String>(
                                 value: dropdownValueDivision,
                                 icon: const Icon(Icons.arrow_drop_down),
                                 iconSize: 24,
                                 elevation: 16,
                                 style: const TextStyle(color: Colors.deepPurple),

                                 onChanged: (String newValue) {
                                   setState(() {
                                     dropdownValueDivision = newValue;
                                   });
                                 },
                                 items: <String>['Select division', 'Two', 'Free', 'Four']
                                     .map<DropdownMenuItem<String>>((String value) {
                                   return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value),
                                   );
                                 }).toList(),
                               ),  ),
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

                           child: DropdownButtonHideUnderline( child:DropdownButton<String>(
                             value: dropdownValueCountry,
                             icon: const Icon(Icons.arrow_drop_down),
                             iconSize: 24,
                             elevation: 16,
                             style: const TextStyle(color: Colors.black),

                             onChanged: (String newValue) {
                               setState(() {
                                 dropdownValueCountry = newValue;
                               });
                             },
                             items: <String>['Select Country', 'Two', 'Free', 'Four']
                                 .map<DropdownMenuItem<String>>((String value) {
                               return DropdownMenuItem<String>(
                                 value: value,
                                 child: Text(value),
                               );
                             }).toList(),
                           ),  ),
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
                                 Text('750 tk'),
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
                             Container(
                               width: width/1.5,
                               height: width/8,
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
                                     contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                     
                                 ),
                                 style: TextStyle(fontSize: 13),

                               ),
                             ),
                           ],
                         )

                     ),

                   ],
                 )
             ),
           ],
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

 }

