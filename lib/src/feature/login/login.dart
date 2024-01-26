import 'package:abcd/src/feature/utils/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double textFieldWidth;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      textFieldWidth = displayWidth(context) * 0.35;
    } else {
      textFieldWidth = displayWidth(context) * 0.8;
    }

    return Material(
      color: Colors.white,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _renderText(),
              _buildPhoneNumberTextField(textFieldWidth),
              const SizedBox(height: 30.0),
              _buildOTPTextField(textFieldWidth),
              const SizedBox(height: 60.0),
              _buildLoginButton(textFieldWidth),
            ],
          ),
        ),
      ),
    );
  }

Widget _renderText(){
return const Text("Welcome to aBCD",);
}
  Widget _buildPhoneNumberTextField(double width) {
    return SizedBox(
      width: width,
      height: displayHeight(context) * 0.06,
      child: const TextField(
         keyboardType: TextInputType.number,
         
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 10, 177, 149), width: 1),
          ),
          hintText: "Mobile number +91",
        ),
      ),
    );
  }

  Widget _buildOTPTextField(double width) {
    return SizedBox(
      width: width,
      child: OTPTextField(
        length: 5,
        style: const TextStyle(fontSize: 17),
        fieldWidth: 50,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        onChanged: (val) => _onChanged(val),
      ),
    );
  }

  Widget _buildLoginButton(double width) {
    return SizedBox(
      width: width,
      height: displayHeight(context) * 0.06,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
        ),
        onPressed: () => _onLoginPressed(),
        child: const Text('Login'),
      ),
    );
  }

  void _onChanged(String val) {
    print(val);
  }

  void _onLoginPressed() {
    Navigator.pushNamed(context, '/home');
    // Add your login logic here
  }
}

