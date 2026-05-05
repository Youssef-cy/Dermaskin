import 'package:dramaskin/Provider/userdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios_new, color: Color(0xFFFF74A4), size: 18),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Text(
                            '${Provider.of<UserData>(context).name}',
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
                              Text('${Provider.of<UserData>(context).name}',
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
                              Text('${Provider.of<UserData>(context).email}',
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
                            Text('${Provider.of<UserData>(context).skinType}',
                                style: TextStyle(fontSize: 15)),
                            Text('${Provider.of<UserData>(context).skinConcerns}',
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