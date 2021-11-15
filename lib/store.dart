import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:from_css_color/from_css_color.dart';
import 'userhome.dart';


class Store extends StatefulWidget {
  

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  var checkboxValue = false ;
   var checkboxValue2 = false ;
    var checkboxValue3 = false ;

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
               SizedBox(width: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text('Store\'s Orders', style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w600),),
          )
        ],
      ),
         Container(
           alignment: Alignment.centerLeft,
           child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
                child: Text(
                  'Delivery Date : 18/05/2021',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                    )
                    ),
              ),
         ) ,
          Container(
           alignment: Alignment.centerLeft,
           child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Store name : abc',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                    )
                    ),
              ),
         ) ,
         Divider(),
         SizedBox(height: 30),
         Container(
           width: 360,
           color: Colors.grey[200],
           height: 120,
           child: Row(
             children: [
               Image.asset('assets/kitten.png',
                width: 150, 
                height: 120,
                alignment: Alignment.centerLeft
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Column(
                    children: [
                      Text('Name : abc',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),   
                      SizedBox(height: 7),                
                      Text('Pending : ',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                     SizedBox(height: 7),    
                      Text('Quantity : 12 packets',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                    ],
                  ),
                  
                ),
                     new Checkbox(value: checkboxValue,
          activeColor: Colors.green,
          onChanged:(bool newValue){
        setState(() {
          checkboxValue = newValue;
        });
       Text('Remember me');
          }),
              
             ],
           )
         ),
           Container(
           width: 360,
           color: Colors.white,
           height: 120,
           child: Row(
             children: [
               Image.asset('assets/kitten.png',
                width: 150, 
                height: 120,
                alignment: Alignment.centerLeft
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Column(
                    children: [
                      Text('Name : abc',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),   
                      SizedBox(height: 7),                
                      Text('Pending : ',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                     SizedBox(height: 7),    
                      Text('Quantity : 12 packets',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                    ],
                  ),
                  
                ),
                     new Checkbox(value: checkboxValue2,
          activeColor: Colors.green,
          onChanged:(bool newValue){
        setState(() {
          checkboxValue2 = newValue;
        });
       Text('Remember me');
          }),
              
             ],
           )
         ),
           Container(
           width: 360,
           color: Colors.grey[200],
           height: 120,
           child: Row(
             children: [
               Image.asset('assets/kitten.png',
                width: 150, 
                height: 120,
                alignment: Alignment.centerLeft
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Column(
                    children: [
                      Text('Name : abc',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),   
                      SizedBox(height: 7),                
                      Text('Pending : ',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                     SizedBox(height: 7),    
                      Text('Quantity : 12 packets',style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                    ],
                  ),
                  
                ),
                     new Checkbox(value: checkboxValue3,
          activeColor: Colors.green,
          onChanged:(bool newValue){
        setState(() {
          checkboxValue3 = newValue;
        });
       Text('Remember me');
          }),
              
             ],
           )
         )
        ]
      ),
      
    );
  }
}