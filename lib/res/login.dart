import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(57, 62, 70, 1),
      body: Stack(
        children: [
          bgImage(),
           Align(
            alignment: Alignment.center,
            child:SizedBox(
              width: 300,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Flutter",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,fontSize: 50
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Text("login",style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize: 50
                        ),
                        ),
                      ),
                    ],
                  ),
                  Text("Page de connexion flutter",style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),)
                ],
              ),
            ),
          ),
          loginForm()
        ],
      ),
    );
  }

  Align loginForm() {
    return Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
              height: 300,
              color: Colors.transparent,
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(30),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.13)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.05)
                            ])),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          color: Colors.black45,
                          height: 70,
                          hint: "Pseudo",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PasswordField(
                            color: Colors.black45,
                            hint: "Mot de passe",
                            height: 50),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextButton(
                            color: Colors.orange,
                            width: 150,
                            height: 50,
                            radius: BorderRadius.circular(50),
                            text: const Text("Connexion",style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                            func: () {

                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }

  Align bgImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          'https://images.unsplash.com/photo-1517842837662-9988868c06d3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8ZmlyZXdvcmtzfGVufDB8fHx8MTcwNjc1NDA2Nnww&ixlib=rb-4.0.3&q=80&w=1080',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final Color color;
  final String hint;
  final double height;
  TextEditingController controller = TextEditingController();

  CustomTextField(
      {super.key,
      required this.color,
      required this.hint,
      required this.height});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(30)),
      height: 50,
      width: MediaQuery.of(context).size.width * 8.5 / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.person)),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: widget.controller,
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final Color color;
  final String hint;
  final double height;
  TextEditingController controller = TextEditingController();

  PasswordField(
      {super.key,
      required this.color,
      required this.hint,
      required this.height});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black45, borderRadius: BorderRadius.circular(30)),
      height: 50,
      width: MediaQuery.of(context).size.width * 8.5 / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)),
              child: const Icon(Icons.lock)),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              controller: widget.controller,
              decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatefulWidget {
  final Color color;
  final double width;
  final double height;
  final BorderRadius radius;
  final Text text;
  final VoidCallback func;

  const CustomTextButton(
      {super.key,
      required this.color,
      required this.width,
      required this.height,
      required this.radius,
      required this.text,
      required this.func});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.func();
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        decoration:
            BoxDecoration(borderRadius: widget.radius, color: widget.color),
        child: widget.text,
      ),
    );
  }
}
