import 'package:flutter/material.dart';
import 'package:stage2_apptest/create_quote.dart';

class MyQuotes extends StatefulWidget {
  final quote;
  MyQuotes({ @required this.quote});

  @override
  _MyQuotesState createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {

  List quoteList = [];

  @override
  void initState() {
    super.initState();
    quoteList.add(widget.quote);
    print(quoteList[0]);
    print('${quoteList[0]} hshhshshgdfetrt');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/9.jpg'),
                fit: BoxFit.cover,
              )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 60, 6, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF5C412B),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      // color: Color(0xFF5C412B),
                      height: 80,
                      child: Center(
                        child: Text(
                          'My Quote list',
                          style: TextStyle(
                            fontFamily: 'Parisienne',
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white

                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_sharp,
                    ),
                    iconSize: 50,
                    color: Colors.black.withOpacity(0.7),
                    splashColor: Color(0xFF5C412B),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()),
                      );
                    },
                  ),
                ],
              ),
              SingleChildScrollView(
                child: GridView.builder(
                    itemCount: quoteList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, mainAxisSpacing: 5),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print(quoteList.length);
                      return Container(
                        alignment: Alignment.center,
                        // color: Colors.greenAccent,
                        child: Text(
                            '${quoteList[index]}',
                          style: TextStyle(
                            fontFamily: 'Parisienne',
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF5C412B).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(35)
                        )
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
