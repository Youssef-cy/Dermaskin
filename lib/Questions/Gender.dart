import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/Questions/ThankYouView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();

    return Scaffold(
      backgroundColor: const Color(0xfff5d9de),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 230,
              decoration: const BoxDecoration(
                color: Color(0xffe88ca3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
          ),

          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Hi, ${userData.name}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Please select your gender",
                  style: TextStyle(color: Colors.black54, fontSize: 20),
                ),
              ],
            ),
          ),

          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const SizedBox(height: 100),

                genderItem(
                  image: "assets/female.jpg",
                  text: "Female",
                ),

                const SizedBox(height: 30),

                genderItem(
                  image: "assets/male.jpg",
                  text: "Male",
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: GestureDetector(
              onTap: () {
                if (selected == null) return;

                context.read<UserData>().setGender(selected!);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sign Up successful")),
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ThankYouView()));
              },
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xffe45c8c),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "Finish Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget genderItem({
    required String image,
    required String text,
  }) {
    bool isSelected = selected == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: Column(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: isSelected
                  ? Border.all(color: Colors.pink, width: 3)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.pink : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}