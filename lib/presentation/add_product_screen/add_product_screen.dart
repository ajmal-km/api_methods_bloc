import 'package:api_methods_bloc/presentation/widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Add Product",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.6,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
        child: Column(
          children: <Widget>[
            GlobalWidgets.customTextField(),
            SizedBox(height: 16),
            GlobalWidgets.customTextField(),
            SizedBox(height: 16),
            GlobalWidgets.customTextField(),
            SizedBox(height: 16),
            GlobalWidgets.customTextField(),
            SizedBox(height: 16),
            GlobalWidgets.customTextField(),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
