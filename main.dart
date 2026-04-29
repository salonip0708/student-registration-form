import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Registration Form"),
        backgroundColor: Colors.blue[100],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Name"),
              keyboardType: TextInputType.text,
              controller: _nameController,
              validator: validateName,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: validateEmail,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Phone"),
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              validator: validateMobile,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
              obscureText: true,
              controller: _passwordController,
              validator: validatePassword,
            ),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateName(String? value) {
  if (value!.length < 3) {
    return "Name must be more than 2 character";
  }
  return null;
}

String? validateMobile(String? value) {
  if (value!.length != 10) {
    return "Mobile number must be 10 digit";
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "This field is required";
  }
  if (!regex.hasMatch(value)) {
    return "Enter valid Email";
  }
  return null;
}

String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "This field is required";
  }
  if (value.length < 8) {
    return "Password should have atleast 8 charaters";
  }
  if (!RegExp(
    r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
  ).hasMatch(value)) {
    return "Enter a Strong Password";
  }
  return null;
}
