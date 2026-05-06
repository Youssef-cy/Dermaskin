import 'package:dramaskin/cart/review.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildCartItem(
                      brand: "BYOMA",
                      name: "Gel-cream",
                      price: "\$14,99",
                      imagePath:
                      "assets/images/WhatsApp Image 2026-04-19 at 3.44.31 AM.jpeg",
                    ),
                    _buildCartItem(
                      brand: "Glow Recipe",
                      name: "Pore-Tight Toner",
                      price: "\$13,48",
                      imagePath:
                      "assets/images/WhatsApp Image 2026-04-19 at 3.51.22 AM (1).jpeg",
                    ),
                    _buildCartItem(
                      brand: "Medicube",
                      name: "Medicube Collagen Series",
                      price: "\$98,46",
                      imagePath:
                      "assets/images/WhatsApp Image 2026-04-19 at 3.51.22 AM (3).jpeg",
                      subtitle: "5 Products",
                    ),
                  ],
                ),
              ),
              _buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRoundedButton(Icons.arrow_back_ios_new, size: 18),
          const Text(
            "Cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _buildRoundedButton(Icons.shopping_bag_outlined),
        ],
      ),
    );
  }

  Widget _buildRoundedButton(IconData icon, {double size = 20}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, color: const Color(0xFFFF8FA3), size: size),
    );
  }

  Widget _buildCartItem({
    required String brand,
    required String name,
    required String price,
    required String imagePath,
    String? subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    brand,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Text(
                "View Brand",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 1.2,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade300, Colors.grey.shade100],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0F3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      subtitle ?? name,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  _buildCounterButton(Icons.add),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "1",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  _buildCounterButton(Icons.remove),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFFFC2D1)),
      ),
      child: Icon(icon, size: 14, color: const Color(0xFFFF8FA3)),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Amount Price",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                "\$126,93",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReviewOrderScreen(address: 'badr', payment: 'CIB', ),
                ),
              );
            },
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8FA3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Check out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}