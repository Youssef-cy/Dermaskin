import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: TopCurveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffd4fcf9),
                    Color(0xfff6d6ff),
                    Color(0xffffd6c9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 5),
                Text("Back"),
              ],
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(0,-40),
              child: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  color: Color(0xfff8f8f8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Ready to continue your skin journey?Your path is right here",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 25),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter email",
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      obscureText: isPasswordHidden,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (val) {
                                setState(() {
                                  isChecked = val!;
                                });
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                        Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xfffbc2eb),
                            Color(0xffa6c1ee),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:
                            Color(0xfffbc2eb).withOpacity(0.5),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Text("Log in with"),
                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook,
                            color: Colors.blue, size: 30),
                        SizedBox(width: 20),
                        Icon(Icons.g_mobiledata,
                            color: Colors.red, size: 35),
                      ],
                    ),

                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        Text(
                          "Sign up",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 70);

    path.cubicTo(
      size.width * 0.25,
      size.height + 40,
      size.width * 0.75,
      size.height - 120,
      size.width,
      size.height - 70,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}