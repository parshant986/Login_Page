
import 'package:flutter/material.dart';
import 'package:september/src/view/screens/second_page.dart';
import 'package:september/src/view/screens/texts.dart';

class HomeScreen extends StatefulWidget {
HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
TextEditingController _inputController = TextEditingController();

final formKey = GlobalKey<FormState>();

bool hidePassword = true;

RegExp gmailValidation = RegExp(r'@gmail.com');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Home Screen", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text (
                    "Email",
                    style: 
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  TextFormField(
                    controller: _inputController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return"This field is required";
                      } else if(!gmailValidation.hasMatch(value)){
                        return "Please enter a valid email";
                      }
                      else{
                        return null;
                      }
                    },
                    obscureText: hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: IconButton(
                        onPressed: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                        icon: Icon(hidePassword
                        ?Icons.remove_red_eye:
                        Icons.remove_red_eye_outlined),
                      ),
                      hintText: "Please enter your email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              if(formKey.currentState!.validate())
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