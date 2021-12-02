import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:grocestore/store.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
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
                              MaterialPageRoute(builder: (context) => Store()));
                        }),
                  ),
                  SizedBox(width: 25),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      'Product Details',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Image.asset(
                  'assets/kitten.png',
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text('Product name : ABC',
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
                  child: Text('Quantity : 5 kgs',
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
                  child: Text('Order Date : 18/05/2021',
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
                  child: Text('Description : ',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare eu pulvinar vestibulum id mollis fusce duis .',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(9, 12, 0, 0),
                    child: Text('Store owner',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 10, 0),
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mi, placerat morbi tortor sed ut pulvinar. Quis tincidunt a a cras tempor, ac.'),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 272,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 04, 0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                    child: SizedBox(
                      height: 30,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(
                              fromCssColor('#4ae5dc')),
                        ),
                        child: Text(
                          'Comment',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
