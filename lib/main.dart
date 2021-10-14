import 'package:advisorylawyer/pagecustomer/main_customer.dart';
import 'package:advisorylawyer/pagelawyer/main_lawyer.dart';
//import 'package:advisorylawyer/pagelawyer/schedule.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainApp(),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class MyMainApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
         
              RaisedButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                              builder: (context) => LawyerMain()
                              )
                          );
                    },
                    child: Text("Laywer"),
                    color: Colors.white,
              ),
              RaisedButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                              builder: (context) => CustomerMain()
                              )
                          );
                    },
                    child: Text("Customer"),
                    color: Colors.white,
              ),
            ],
          )
        
        )
      ),
    );
  }
}