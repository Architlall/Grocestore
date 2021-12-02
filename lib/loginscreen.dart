import 'package:flutter/material.dart';
import 'userhome.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserHome()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "Phone Number",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message)));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text("SEND"),
          // color: Colors.blue,
          // textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: otpController,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Enter OTP',
            hintStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w300)),
        onChanged: (value) {},
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomPaint(
          painter: MyPainter(),
          child: Column(children: [
            SizedBox(height: 100),
            Center(
              child: Text(
                'Grocestore',
                style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Lobster')),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            SingleChildScrollView(
                child: Container(
                    child: showLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : currentState ==
                                MobileVerificationState.SHOW_MOBILE_FORM_STATE
                            ? Container(
                                //             child: Column(
                                // children: [
                                //   Spacer(),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: phoneController,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Phone Number',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300)),
                                    ),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () async {
                                        setState(() {
                                          showLoading = true;
                                        });
                                        await _auth.verifyPhoneNumber(
                                          phoneNumber: phoneController.text,
                                          verificationCompleted:
                                              (phoneAuthCredential) async {
                                            setState(() {
                                              showLoading = false;
                                            });
                                            //signInWithPhoneAuthCredential(phoneAuthCredential);
                                          },
                                          verificationFailed:
                                              (verificationFailed) async {
                                            setState(() {
                                              showLoading = false;
                                            });
                                            _scaffoldKey.currentState
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        verificationFailed
                                                            .message)));
                                          },
                                          codeSent: (verificationId,
                                              resendingToken) async {
                                            setState(() {
                                              showLoading = false;
                                              currentState =
                                                  MobileVerificationState
                                                      .SHOW_OTP_FORM_STATE;
                                              this.verificationId =
                                                  verificationId;
                                            });
                                          },
                                          codeAutoRetrievalTimeout:
                                              (verificationId) async {},
                                        );
                                      },
                                      child: Text("SEND"),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(color: Colors.black),
                                      controller: otpController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: 'Enter OTP',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300)),
                                     
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        PhoneAuthCredential
                                            phoneAuthCredential =
                                            PhoneAuthProvider.credential(
                                                verificationId: verificationId,
                                                smsCode: otpController.text);

                                        signInWithPhoneAuthCredential(
                                            phoneAuthCredential);
                                      },
                                      child: Text("VERIFY"),
                                      // color: Colors.blue,
                                      // textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              )))
          ])),
    );
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

    paint.color = fromCssColor('#4ae5dc');

    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();

    ovalPath.moveTo(width * 0.7, 0);

    ovalPath.quadraticBezierTo(
        width * 0.25, height * 0.25, width, height * 0.4);

    ovalPath.lineTo(width, 0);

    ovalPath.close();

    paint.color = Color.fromARGB(200, 45, 202, 193);
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
