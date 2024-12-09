import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final int _id;
  final String _name;
  final String _description;

  final _myTextStyle1 = const TextStyle(color: Colors.blue, fontSize: 30.0);
  final _myTextStyle2 = const TextStyle(color: Colors.indigo, fontSize: 30.0);
  final _myTextStyle3 = const TextStyle(color: Colors.indigo, fontSize: 25.0);

  const ProductDetail(this._id, this._name, this._description, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product detail'),),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey.shade100, Colors.green.shade100])
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Id:', style: _myTextStyle1,),
                Text(' $_id ', style: _myTextStyle2,),
                Text('Name: ', style: _myTextStyle1,),
                Text(_name, style: _myTextStyle2,),
              ],
            ),
            const Divider(color: Colors.grey, thickness: 1,),
            Text('Description ', style: _myTextStyle1,),
            Text(_description, style: _myTextStyle3, textAlign: TextAlign.justify,),
          ],
        ),
      ),
    );
  }
}