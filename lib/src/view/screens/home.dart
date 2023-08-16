
import 'package:flutter/material.dart';
import 'package:september/src/view/screens/second_page.dart';

class HomeScreen extends StatelessWidget {
HomeScreen({super.key});

TextEditingController _inputController = TextEditingController();
dynamic formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: _inputController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return"This field is required";
                  }else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => SecondScreen(
                  title: _inputController.text,
               ))));
          }, 
          child: Text("Tap me"))
         ],
        ),
      ),
    );
  }
}