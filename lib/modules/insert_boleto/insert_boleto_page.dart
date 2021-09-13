import 'package:flutter/material.dart';

class InsertBoletoPage extends StatefulWidget {
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Boleto"),
      ),
    );
  }
}
