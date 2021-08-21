import 'package:flutter/material.dart';
import 'package:stage2_apptest/my_qoutes_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var quoteController = TextEditingController();
  var quote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/11.jpg'),
                      fit: BoxFit.cover,
                    ))),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Padding(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SafeArea(child: Container()),
                      Container(
                        width: 700,
                        height: 100,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF060604).withOpacity(0.3),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xFF5C412B).withOpacity(0.3),
                        ),
                        child: Center(
                          child: Text(
                            '"My Quotes"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 52,
                                color: Colors.white,
                                letterSpacing: 5,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Parisienne'),
                          ),
                        ),
                      ),
                      // SizedBox(height: 330),
                      TextField(
                        controller: quoteController,
                        // autofocus: true,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 5,
                        // onChanged: (value)=> setState(()=> quote = value),
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your qoutes',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 25),
                          counterText: '100 characters',
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color(0xFF5C412B),
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Color(0xFF5C7482),
                              primary: Color(0xFF5C412B)),
                          onPressed: () {
                            quote = quoteController.text;
                            print(quote);
                            if (quoteController.text.isEmpty) {
                              showAlertDialog(context);
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyQuotes(quote: quote)),
                              );
                              quoteController.clear();
                            }
                          },
                          child: Text(
                            'Click here to save Quote',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal),
                          )),
                      SizedBox(height: 220),
                      Text(
                        'Powered by:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(flex: 3, child: Image.asset('assets/hng2.png')),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(flex: 3, child: Image.asset('assets/hng3.png')),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(flex: 3, child: Image.asset('assets/hng4.png')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("You are yet to input your quote"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}