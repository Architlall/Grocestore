import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'customer.dart';
import 'store.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: fromCssColor('#4ae5dc'),
              height: 220,
              child: Row(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/kitten.png'),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                      child: Text(
                        'Agent Name',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 80),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 35,
                        semanticLabel: 'Home',
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.store,
                          color: Colors.white,
                          size: 35,
                        ),
                        onTap: (){
                            Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => Store()));
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 68, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: GestureDetector(
                          child: Text(
                            'Store Orders',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap:(){
                     Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => Store()));
                     
              } ,
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
            Container(height: 30),
            Text('User Orders',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                Divider(),
            Card(
                color: Colors.grey[300],
                child: ListTile(
                    title: Text(
                        'Order ID       Customer name       Items      Status'))),
            GestureDetector(
                child: ListTile(
                  title: Text(
                      '123                             abc                  5           delivered'),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Customer()));
                }),
            GestureDetector(
              child: ListTile(
                tileColor: Colors.grey[300],
                title: Text(
                    '123                             abc                  5           delivered'),
              ),
              onTap: (){
                     Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => Customer()));
                     
              }
            ),
          ],
        ));
  }
}
