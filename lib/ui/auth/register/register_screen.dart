import 'package:chat_app/utlis/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController(text: 'sohaila');

  var emailController = TextEditingController(text: 'sohaila@route.com');

  var passwordController = TextEditingController(text: '1234567');

  var confirmPasswordController = TextEditingController(text: '1234567');

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Image.asset(
          'assets/images/background.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Create Account'),
            centerTitle: true,
          ),
          body: Form(
            // key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  CustomTextFormField(
                    label: "Name",
                    controller: nameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter your username';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter your email';
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: 'Password',
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter your password';
                      }
                      if (text.length < 6) {
                        return 'password should be at least 6 characters';
                      }
                      return null;
                    },
                    isObsecure: isObscure,
                    isPassword: true,
                    suffixIcon: InkWell(
                      child: isObscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onTap: () {
                        if (isObscure) {
                          isObscure = false;
                        } else {
                          isObscure = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  CustomTextFormField(
                    label: 'confirm password',
                    keyboardType: TextInputType.number,
                    controller: confirmPasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please confirm your password';
                      }
                      if (text != passwordController.text) {
                        return 'password doesnt match';
                      }

                      return null;
                    },
                    isPassword: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
