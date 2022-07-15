import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    TextEditingController dateController = TextEditingController(); 

 @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Datepicker")),
      body: Container(
          padding:const EdgeInsets.all(15),
          height:150,
          child:Center( 
             child:TextField(
              
                controller: dateController, //editing controller of this TextField
                decoration: const InputDecoration( 
                
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
                ),
                readOnly: true,  // when true user cannot edit text 
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(), //get today's date
                      firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                      setState(() {
                         dateController.text = formattedDate; //set foratted date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
             )
          )
    ));
  }
}
