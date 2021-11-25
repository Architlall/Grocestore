import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:grocestore/Models/listModel.dart';
import 'customer.dart';
import 'store.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  ListModel listModel = ListModel();
  bool circular = true;
  @override
  Future getData() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://techville.getgrist.com/api/docs/q69gwCkkR6wyiAvFQc9MGP/tables/Orders/records?filter="),
        headers: {
          "Authorization": 'Bearer 2420be228c356569707bcb2e7f79ac37898e57a6'
        });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      setState(() {
        listModel = ListModel.fromJson(data);
        print(listModel.records[0].fields.delivery_status);
        circular = false;
      });
    } else {
      throw Exception("Failed to load data!");
    }
  }

  initState() {
    super.initState();
    getData();
  }
  @override
  void dispose() {
   
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: circular == true
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: fromCssColor('#4ae5dc'),
                          height: 220,
                          child: Row(children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 30, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('assets/kitten.png'),
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(45, 0, 0, 0),
                                  child: Text(
                                    'Agent Name',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
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
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Store()));
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
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: GestureDetector(
                                      child: Text(
                                        'Store Orders',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => Store()));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                        Container(height: 30),
                        Text('User Orders',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500)),
                        Divider(),
                        Card(
                            color: Colors.grey[300],
                            child: ListTile(
                                title: Text(
                                    'Order ID       Customer name       Items      Status'))),
                        SizedBox(
                          height: 400,
                          child: ListView.separated(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Customer()));
                                },
                                child: Card(
                                  color: Colors.grey[200],
                                  child: ListTile(
                                    title: new Text(listModel
                                            .records[index].fields.order_id
                                            .toString() +
                                        '                         ' +
                                        listModel
                                            .records[index].fields.user_name +
                                        '                       ' +
                                        (listModel.records[index].fields
                                                    .product_ordered.length -
                                                1)
                                            .toString() +
                                        '          ' +
                                        listModel.records[index].fields
                                            .delivery_status),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }

  
}
