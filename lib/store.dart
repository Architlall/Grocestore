import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:grocestore/product.dart';
import 'userhome.dart';
import 'package:grocestore/Models/listModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var l;

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var checkboxValue = false;
  var checkboxValue2 = false;
  var checkboxValue3 = false;
  ListModel listModel = ListModel();

  bool circular = true;

  @override
  Future StoreData() async {
    http.Response response = await http.get(
        Uri.parse("https://api.airtable.com/v0/appNafBekDdjSEiQt/Products"),
        headers: {"Authorization": 'Bearer keydn34O3fhfNivSO'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (mounted) {
        setState(() {
          listModel = ListModel.fromJson(data);
          print(listModel.records.length);
          l = listModel.records.length;

          circular = false;
        });
      }
    } else {
      throw Exception("Failed to load data!");
    }
  }

  initState() {
    super.initState();
    StoreData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (
        SafeArea(
          child: Center(
            child: circular == true
                  ? CircularProgressIndicator()
                  : 
             Column(children: [
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
                  SizedBox(width: 30),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      'Store\'s Orders',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                
                  padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
                  child: Text('Delivery Date : 18/05/2021',
                 
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text('Store name : abc',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ),
              Divider(),
              SizedBox(height: 30),
              SizedBox(
                height: 470,
                child: ListView.separated(
                  itemCount: l,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => Product()));
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                          width: 360,
                          color: Colors.grey[200],
                          height: 150,
                          child: Row(
                           
                            children: [
                              Image.network(
                                  listModel.records[index].fields.product_image[0].url,
                                  width: 150,
                                  height: 120,
                                  alignment: Alignment.centerLeft),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Column(
                                  
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 170,
                                      child: Text( 
                                        'Name:' + listModel.records[index].fields.product_name,
                                        textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    SizedBox(height: 7),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Pending : ',
                                      textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    SizedBox(height: 7),
                                    Text('Quantity : ' ,
                                    textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: new Checkbox(
                                    value: checkboxValue,
                                    activeColor: Colors.green,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        checkboxValue = newValue;
                                      });
                                      Text('Remember me');
                                    }),
                              ),
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                ),
              ),
            ]),
          ),
        )
      ),
    );
  }
}
