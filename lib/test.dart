import 'package:flutter/material.dart';

class Class extends StatefulWidget {
  @override
  _ClassState createState() => _ClassState();
}

class _ClassState extends State<Class> {
  TextEditingController row = TextEditingController();
  TextEditingController column = TextEditingController();

  int rowC = 1;
  int colC = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            child: GridView.builder(
              itemCount: colC * rowC,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rowC,
                  childAspectRatio: colC * rowC / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                color: Colors.greenAccent,
              ),
            ),
          ),
          Text("Row"),
          TextField(
            controller: row,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Column"),
          TextField(
            controller: column,
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
              onPressed: () {
                rowC = int.parse(row.text);
                colC = int.parse(column.text);
                setState(() {});
              },
              child: Container(
                  color: Colors.purple,
                  padding: EdgeInsets.all(20),
                  child: Text("Add")))
        ],
      ),
    );
  }
}
