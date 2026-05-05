import 'package:dramaskin/Home/Home.dart';
import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/shared/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    return Scaffold(
      backgroundColor: appColors.bgColor,
      body: Stack(
        children: [

          // 🔴 Pink background (زي ما كان)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                color: appColors.topColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
              ),
            ),
          ),

          // ⚪ Content in center
         Positioned(
           top: 90,
           left: 0,
           right: 0,
           child: Center(
             child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(height: 20),

                        Text(
                          "THANK YOU !",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          Provider.of<UserData>(context).name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 80),

                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xffE6C3A8),
                              width: 10,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              size: 120,
                              color: Color(0xffE6C3A8),
                            ),
                          ),
                        ),

                        const SizedBox(height: 80),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Skin Type: ${user.skinType}",style: TextStyle(fontSize: 20),),
                              const SizedBox(height: 8),
                              Text("Skin Concerns: ${user.skinConcerns}",style: TextStyle(fontSize: 20),),
                              const SizedBox(height: 8),
                              Text("Gender: ${user.gender}",style: TextStyle(fontSize: 20),),
                            ],
                          ),
                        ),

                        const SizedBox(height: 80),

                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appColors.buttonColor,
                              minimumSize: Size(50, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Done",style: TextStyle(color: Colors.white),),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],

                ),
           ),
         ),

        ],
      ),
    );
  }
}