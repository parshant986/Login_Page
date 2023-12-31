import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:september/src/view/screens/register.dart';
import 'package:september/src/view/screens/home.dart';
import 'package:september/src/view/screens/texts.dart';
import 'package:september/src/view/utilis/colors.dart';

class LoginScreen extends StatefulWidget {
	LoginScreen({super.key});

	@override
	State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	TextEditingController _emailInputController = TextEditingController();
	TextEditingController _passwordInputController = TextEditingController();

	final formKey = GlobalKey<FormState>();

	bool hidePassword = true;
	RegExp gmailValidation = RegExp(r'@gmail.com');
	RegExp paasswordValidaton = RegExp(r"[a-z0-9A-Z]");

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
				Padding(
					padding: const EdgeInsets.all(8.0),
					child: Container(
					 child: Icon(Icons.person, size: 150),
					),
				),
				Padding(
					padding: const EdgeInsets.all(8.0),
					child: Form(
					 key: formKey,
					 child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Text(
							 "Email",
							 style:
									TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
							),
							SizedBox(
							 height: 10,
							),
							TextFormField(
							 controller: _emailInputController,
							 validator: (value) {
								if (value == null || value.isEmpty) {
									return "This field is required";
								} else if (!gmailValidation.hasMatch(value)) {
									return "Please enter a valid email";
								} else {
									return null;
								}
							 },
							 autovalidateMode: AutovalidateMode.onUserInteraction,
							 decoration: InputDecoration(
								prefixIcon: Icon(Icons.email),
								hintText: "Please enter your email",
								border: OutlineInputBorder(
									borderRadius: BorderRadius.circular(20),
								),
							 ),
							),
							SizedBox(
							 height: 10,
							),
							Text(
							 "Password",
							 style:
									TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
							),
							Padding(
							 padding: const EdgeInsets.all(8.0),
							 child: TextFormField(
								controller: _passwordInputController,
								validator: (value) {
									if (value == null || value.isEmpty) {
									 return "Password required";
									} else if (!paasswordValidaton.hasMatch(value)) {
									 return "Please enter corrrect password";
									} else {
									 return null;
									}
								},
								obscureText: hidePassword,
								decoration: InputDecoration(
									 prefixIcon: Icon(Icons.lock),
									 suffixIcon: IconButton(
										onPressed: () {
											hidePassword = !hidePassword;
											setState(() {});
										},
										icon: Icon(hidePassword
											 ? Icons.remove_red_eye
											 : Icons.remove_red_eye_outlined),
									 ),
									 hintText: "Please enter your password",
									 border: OutlineInputBorder(
										borderRadius: BorderRadius.circular(20),
									 ),),
							 ),
							)
						],
					 ),
					),
				),
				ElevatedButton(
					 onPressed: () {
						if (formKey.currentState!.validate())
							Navigator.of(context).pushReplacement(MaterialPageRoute(
								builder: ((context) =>
									 HomeScreen(title: "Welcome to second screen"))));
					 },
					 child: Text("Log in")),
				TextButton(onPressed: () {}, child: Text("Forgot password ?")),
				RichText(text: TextSpan(children: [
					TextSpan(text:"Not Registered?", 
					style: TextStyle(color: kRedColor)),
					TextSpan(text: "Register", 
					recognizer:TapGestureRecognizer()
					..onTap =() {
						Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
					},
					style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold)),
				]))
			 ],
			),
		),
	 );
	}
}