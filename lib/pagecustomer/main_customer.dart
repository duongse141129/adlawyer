import 'package:advisorylawyer/pagecustomer/home_customer.dart';
import 'package:advisorylawyer/pagecustomer/navbar_customer.dart';
import 'package:advisorylawyer/pagecustomer/phonebook_customer.dart';
import 'package:advisorylawyer/pagecustomer/schedule_customer.dart';
import 'package:advisorylawyer/pagecustomer/settings_customer.dart';
import 'package:flutter/material.dart';

class CustomerMain extends StatefulWidget {
  const CustomerMain({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomerMain> {
  int _currentIndex = 0;
  Icon actionIcon=new Icon(Icons.search, color: Colors.white,);
  Widget appBarTitle= Text('Advisory Lawyer');
  final List pages = [
    CustomerHomePage(),
    CustomerPhoneBook(),
    CustomerSchedule(),
    CustomerSettings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: CustomerNavBar(),
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: appBarTitle,

          actions: <Widget>[
            IconButton(        
              icon: actionIcon,
              onPressed: (){
                setState(() {
                  if(this.actionIcon.icon == Icons.search){
                    this.actionIcon = Icon(Icons.close);
                      appBarTitle = TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration:  InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search ...",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    );
                    
                  }
                  else{
                    this.actionIcon =  Icon(Icons.search);
                    this.appBarTitle= Text("Advisory Lawyer");
                  }
                });
              },
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
          ],


          ),
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.purple,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),            
                backgroundColor: Colors.purple
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.recent_actors),
                title: Text('Contacts'),
                backgroundColor: Colors.purple
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Calendar'),
                backgroundColor: Colors.purple
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.settings_applications_outlined),
                title: Text('Settings'),
                backgroundColor: Colors.purple
              ),
            ],
            onTap: (index){
              setState(() {
                _currentIndex=index;
              });
            },
          ),
      ),
    );
  }
}