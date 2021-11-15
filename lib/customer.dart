import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:grocestore/userhome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Customer extends StatefulWidget {


  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: IconButton(icon:
                  // FaIcon(FontAwesomeIcons.solidArrowAltCircleLeft,
                  FaIcon(FontAwesomeIcons.solidArrowAltCircleLeft,
                   color: fromCssColor('#4ae5dc'),
                   size: 40,
                   ) ,
                    onPressed: (){
                    Navigator.of(context).pop(
                      MaterialPageRoute(builder: (context) => UserHome()));
                    
                        
                 }),
               ),
               SizedBox(width: 150),
               ElevatedButton(onPressed: (){}, style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all(fromCssColor('#4ae5dc')),
                              ),  child: Text('Delivered', style:  TextStyle(color: Colors.white,fontSize: 20),))
            ],
          ),
          Container(
             alignment: Alignment.centerLeft,
            child: 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Customer\'s Details',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600
                  )
                  ),
            )
                ),
                 Container(
             alignment: Alignment.centerLeft,
            child: 
           Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Delivery Date : 18/05/2021',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                  )
                  ),
            ) 
                ),
                 Container(
             alignment: Alignment.centerLeft,
            child: 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Name : abc',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                  )
                  ),
            )
                ),
                 Container(
             alignment: Alignment.centerLeft,
            child: 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Phone number : 999999999',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                  )
                  ),
            )
                ),
                 Container(
             alignment: Alignment.centerLeft,
            child: 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Adress : ndsdddmdwjdjdwjdwjdmdsdSNDSDSNDSNDDDHWDsdnsnnd',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                  )
                  ),
            )
                ),
                Divider(),
                 Card(
                color: Colors.grey[300],
                child: ListTile(
                    title: Text(
                        'SL No.                         Items                          Quantity'))),
                         ListTile(
                  title: Text(
                      '4352                              Atta                               5kg'),
                ),
        ],
        
      ),
    );
  }
}