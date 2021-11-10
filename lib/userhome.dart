import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       body:  Column(
           children: [
             Container(
               height: 270,
               width: double.infinity,
               color: fromCssColor('#4ae5dc'),
              
               child: Row(
                 children: [
                   Column(
                     children :[ Padding(
                       padding: const EdgeInsets.fromLTRB(0, 50, 10, 20),
                       child: CircleAvatar(  
                         radius: 70,
                         backgroundImage: AssetImage('assets/kitten.png'),
                         
                       ),
                       
                     ),
                     
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20, 5, 200, 20),
                       child: Text('Agent Name',
                       style: TextStyle(fontSize: 20,
                       color: Colors.white),),
                     ),
                    
                     ]
                   ),
                   
                    Padding(
                       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                       child: Icon(
                         Icons.home,
                         color: Colors.black,
                         size : 35,
                         semanticLabel: 'Home',
                       ),
                     )
                 ],
               ),
               
             
             )
           ],
       )
    );
  }
}