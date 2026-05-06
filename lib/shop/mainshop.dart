import 'package:dramaskin/Provider/userdata.dart';
import 'package:dramaskin/shop/categoryShop.dart';
import 'package:dramaskin/shop/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class mainShop extends StatelessWidget {
  const mainShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xFFF775A9).withOpacity(0.4), width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(

                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Icon(Icons.arrow_back_ios_new,
                        color: Color(0xFFF775A9), size: 18),
                  ),
                ),

                SizedBox(width: 20,),

                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Choose Your Skincare!", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text("Hi, ${Provider.of<UserData>(context).name}", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.pink[50],
                  backgroundImage: const AssetImage('assets/profile.png'),
                  onBackgroundImageError: (e, s) => {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Search Product, Kit or Brand...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ["Normal skin", "Oily skin", "Dry skin", "Combination"].map((skinType) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Categoryshop()));
                      },
                      
                      child: Chip(
                        label: Text(skinType, style: const TextStyle(color: Colors.pinkAccent)),
                        backgroundColor: Colors.pink[50],
                        shape: StadiumBorder(side: BorderSide(color: Colors.pink[100]!)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:  [
                 ProductCard(brand: "Glow Recipe", name: "Pore-tight Toner", price: "\$13.46", imagePath: 'assets/WhatsApp Image 2026-04-19 at 3.51.22 AM (1).jpeg'),
        GestureDetector(
          onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen()));},
          child:   ProductCard(brand: "BYOMA", name: "Gel-cream", price: "\$14.99", imagePath: 'assets/WhatsApp Image 2026-04-19 at 3.44.31 AM.jpeg')),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Product Kits", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("See All", style: TextStyle(color: Colors.grey))),
              ],
            ),
            const KitTile(title: "Medicube Collagen Series", count: "5 Products", price: "\$98.46", imagePath: 'assets/WhatsApp Image 2026-04-19 at 3.51.22 AM (3).jpeg'),
            const KitTile(title: "The Ordinary Discovery Set", count: "6 Products", price: "\$120.05", imagePath: 'assets/WhatsApp Image 2026-04-19 at 3.51.22 AM (2).jpeg'),
            const KitTile(title: "Glow Recipe Dewy Skin Goals", count: "3 Products", price: "\$70.31", imagePath: 'assets/WhatsApp Image 2026-04-19 at 3.51.22 AM.jpeg'),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String brand, name, price, imagePath;
  const ProductCard({super.key, required this.brand, required this.name, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(color: const Color(0xFFFFF0F3), borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          const Positioned(top: 10, right: 10, child: Icon(Icons.favorite_border, size: 20)),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, color: Colors.pink, size: 40),
                  ),
                ),
                const SizedBox(height: 10),
                Text(brand, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(name, style: const TextStyle(fontSize: 12, color: Colors.grey), textAlign: TextAlign.center), // تم التصحيح هنا
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KitTile extends StatelessWidget {
  final String title, count, price, imagePath;
  const KitTile({super.key, required this.title, required this.count, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 60, height: 60, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                  width: 60, height: 60, color: Colors.grey[100], child: const Icon(Icons.image_not_supported)
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(count, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}