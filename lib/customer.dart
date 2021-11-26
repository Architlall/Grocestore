import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:grocestore/userhome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:grocestore/Models/listModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

int index1 = 0;
int len;
var phone;

class Customer extends StatefulWidget {
  final int passedId;
   var passedProduct;
   var passedQuant;
  Customer({Key key, this.passedId, this.passedProduct, this.passedQuant}) : super(key: key);
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  ListModel listModel = ListModel();
  bool circular = true;
  @override
  Future CustomerData() async {
    http.Response response = await http.get(
        Uri.parse(
            "https://techville.getgrist.com/api/docs/kWHSc5h2i1GAqxA6wP95QX/tables/GroceryUsers/records?filter="),
        headers: {
          "Authorization": 'Bearer 2420be228c356569707bcb2e7f79ac37898e57a6'
        });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (mounted) {
        setState(() {
          
         
          listModel = ListModel.fromJson(data);
          
          
          len = listModel.records.length;
          print(widget.passedId);
          
         
          circular = false;
          assign();
          print(listModel.records[index1].fields.user_phone);
         
        });
      }
    } else {
      throw Exception("Failed to load data!");
    }
  }

  initState() {
    super.initState();
    CustomerData();
  }

  void assign() {
    for (int i = 0; i < len; i++) {
      if (listModel.records[i].fields.user_id == widget.passedId) {
        index1 = i;
        phone = listModel.records[index1].fields.user_phone;
        print(index1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                        icon:
                            // FaIcon(FontAwesomeIcons.solidArrowAltCircleLeft,
                            FaIcon(
                          FontAwesomeIcons.solidArrowAltCircleLeft,
                          color: fromCssColor('#4ae5dc'),
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(
                              MaterialPageRoute(builder: (context) => UserHome()));
                        }),
                  ),
                  SizedBox(width: 150),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(fromCssColor('#4ae5dc')),
                      ),
                      child: Text(
                        'Delivered',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Customer\'s Details',
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Delivery Date : 18/05/2021',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                        'Name : ' + listModel.records[index1].fields.user_name,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text('Phone number : ' + phone.toString(),
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  )),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                        'Adress : ' + listModel.records[index1].fields.user_address,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  )),
              Divider(),
              Card(
                  color: Colors.grey[300],
                  child: ListTile(
                      title: Text(
                          'SL No.                         Items                          Quantity'))),

                           SizedBox(
                              height: 400,
                              child: ListView.separated(
                                itemCount: widget.passedProduct.length-1,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.grey[200],
                                    child: ListTile(
                                      title: new Text(listModel
                                              .records[index+1].id.toString() +
                                          '                                        ' +
                                          widget.passedProduct[index+1] +
                                          '                                 ' +
                                          widget.passedQuant[index+1] 
                                         ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container();
                                },
            
            
          ),
                           ),
            ]),
        ),
    ));
  }
}
