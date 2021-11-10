import 'package:flutter/material.dart';
import 'userhome.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _email = "x", _password = "y";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: CustomPaint(
            painter: MyPainter(),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Center(
                    child: Text(
                      'Grocestore',
                      
                      style: GoogleFonts.lobster( textStyle: TextStyle(color: Colors.white, fontSize: 60),),
                      
                    ),
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(30, 10, 80, 0),
                    child: Text(
                      'Agent ID',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                    child: TextField(
                      obscureText: true,
                      // keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.black , fontWeight: FontWeight.w300)),
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(30, 10, 80, 0),
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 360,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              child: Text(
                                'Log In',
                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800
                                ),
                              ),
                              onPressed: () async {
                                if (_email == "admin" && _password == "admin") {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => UserHome()));
                                }
                              }),
                        )
                      ])
                ])));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    //  paint.color = Color.fromARGB(160, 229, 229, 229);
    paint.color = fromCssColor('#4ae5dc');

    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 70% width to the right
    ovalPath.moveTo(width * 0.7, 0);

    ovalPath.quadraticBezierTo(
        width * 0.25, height * 0.25, width, height * 0.4);

    // draw remaining line to bottom left side
    ovalPath.lineTo(width, 0);
    // Close line to reset it back
    ovalPath.close();

    paint.color = Color.fromARGB(200, 45, 202, 193);
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
