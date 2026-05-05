import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profile (1).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back_ios, size: 22),
                          ),
                          Text(
                            'salma tamer',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF775A9),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 36),

                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 72,
                            backgroundColor: Color(0xFFF775A9).withOpacity(0.3),
                            child: CircleAvatar(
                              radius: 65,
                              backgroundImage: AssetImage('assets/Fluttershy.jpeg'),
                            ),
                          ),
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Color(0xFFF775A9),
                            child: Icon(Icons.edit, color: Colors.white, size: 22),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 80),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('username',
                                  style: TextStyle(
                                      color: Color(0xFFAA80FF),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      fontSize: 16)),
                              Text('@salmatamer2009',
                                  style: TextStyle(color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          Icon(Icons.edit_outlined, color: Colors.grey, size: 24),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email',
                                  style: TextStyle(
                                      color: Color(0xFFAA80FF),
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      fontSize: 16)),
                              Text('salmatamer20009@gmail.com',
                                  style: TextStyle(color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 32),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Color(0xffB9E2FD).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "skin type & concerns",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 12),
                            Text("Combination skin",
                                style: TextStyle(fontSize: 15)),
                            Text("dark spots - dryness",
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 50),
                            Image.asset(
                              'assets/button.png',
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}