import 'package:dramaskin/shared/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  final String title, brand, image;
  final double price;
  bool isSelected;
  Product({
    required this.title,
    required this.brand,
    required this.price,
    required this.image,
    this.isSelected = true,
  });
}

class ReviewOrderScreen extends StatefulWidget {
  final String address, payment;

  const ReviewOrderScreen({
    super.key,
    required this.address,
    required this.payment,
  });

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  List<Product> products = [
    Product(
      title: "Pore-tight Toner",
      brand: "Glow Recipe x1",
      price: 13.48,
      image: "assets/toner.png",
    ),
    Product(
      title: "Moisturising Gel Cream",
      brand: "BYOMA x1",
      price: 14.99,
      image: "assets/cream.png",
    ),
    Product(
      title: "Medicube Collagen Series",
      brand: "Medicube x5",
      price: 98.46,
      image: "assets/medicube.png",
    ),
  ];

  double get total =>
      products.where((p) => p.isSelected).fold(0.0, (sum, p) => sum + p.price) +
      (products.any((p) => p.isSelected) ? 3.0 : 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildTopIcon(),
              const SizedBox(height: 25),
              const Text(
                "Review your order",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1D2A4D),
                ),
              ),
              const Text(
                "Double check everything before placing your order.",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Order Summary",
                        style: TextStyle(color: Color(0xFFC1C7D0)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...products.map((p) => _buildProductRow(p)),
                    const Divider(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "incl. shipping \$3.00",
                          style: TextStyle(color: Color(0xFFC1C7D0)),
                        ),
                        Text(
                          "\$${total.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF6991),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // --- Delivery Card ---
                    InfoCard(
                      title: 'DELIVERY TO',
                      iconSection: SizedBox(
                        width: 54,
                        height: 54,
                        child: Material(
                          color: const Color(0xFFFFF0F5),
                          borderRadius: BorderRadius.circular(16),
                          child: const Icon(
                            Icons.push_pin_rounded,
                            color: Color(0xFFF06292),
                            size: 28,
                          ),
                        ),
                      ),
                      contentSection: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '123 Nile St, Cairo, Egypt',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF2C3248),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Est. 3–5 business days',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      onEdit: () {
                        // Handle Edit Address
                      },
                    ),

                    const SizedBox(height: 14), // Spacing between cards
                    // --- Payment Card ---
                    InfoCard(
                      title: 'PAYMENT',
                      iconSection: SizedBox(
                        width: 54,
                        height: 54,
                        child: Material(
                          color: const Color(0xFFF3EFFF),
                          borderRadius: BorderRadius.circular(16),
                          child: const Icon(
                            Icons.credit_card_rounded,
                            color: Colors.lightBlue,
                            size: 28,
                          ),
                        ),
                      ),
                      contentSection: const Text(
                        '•••• •••• •••• 4242',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF2C3248),
                          letterSpacing: 2.0,
                        ),
                      ),
                      onEdit: () {
                        // Handle Edit Payment
                      },
                    ),

                    SizedBox(height: 30),

                    Container(
                      child: Row(
                        children: [

                          Spacer(),

                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16), // هنا الكيرف
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                    horizontal: 50

                                ),
                              ),
                              child: const Text(
                                "Back",
                                style: TextStyle(color: appColors.TextColor),
                              ),
                            ),
                          ),

                          SizedBox(width: 30),

                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16), // هنا الكيرف
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 50
                                ),
                              ),
                              child: Text(
                                "Next",
                                style: TextStyle(color: appColors.TextColor),
                              ),
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductRow(Product p) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => setState(() => p.isSelected = !p.isSelected),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: p.isSelected
                    ? const Color(0xFFFF6991)
                    : Colors.transparent,
                width: 2.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                p.image,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => const Icon(Icons.image),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                p.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                p.brand,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
        Text(
          "\$${p.price}",
          style: const TextStyle(
            color: Color(0xFFFF6991),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );

  Widget _buildEditTile(
    String l,
    String v,
    IconData i,
    Function(String) onEdit,
  ) => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(i, color: const Color(0xFFFFD4E1)),
            const SizedBox(width: 10),
            Expanded(child: Text(v, overflow: TextOverflow.ellipsis)),
            TextButton(
              onPressed: () => _showEdit(l, v, onEdit),
              child: const Text(
                "Edit",
                style: TextStyle(
                  color: Color(0xFFFF6991),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  void _showEdit(String t, String c, Function(String) s) {
    TextEditingController con = TextEditingController(text: c);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit $t"),
        content: TextField(controller: con),
        actions: [
          ElevatedButton(
            onPressed: () {
              s(con.text);
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _buildTopIcon() => Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Color(0xFFFFD4E1),
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.shopping_cart_outlined,
      size: 40,
      color: Color(0xFF8A99B5),
    ),
  );
  Widget _btn(String t, Color c, VoidCallback? f) => ElevatedButton(
    onPressed: f,
    style: ElevatedButton.styleFrom(
      backgroundColor: c,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(vertical: 18),
    ),
    child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}

class InfoCard extends StatelessWidget {
  final String title;
  final Widget iconSection;
  final Widget contentSection;
  final VoidCallback onEdit;

  const InfoCard({
    super.key,
    required this.title,
    required this.iconSection,
    required this.contentSection,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    // Replacing the outer Container with Material + Padding
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w800,
                fontSize: 13,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),

            // Main Row containing Icon, Info, and Edit Button
            Row(
              children: [
                iconSection,
                const SizedBox(width: 16),

                Expanded(child: contentSection),

                // Edit Button
                TextButton(
                  onPressed: onEdit,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Color(0xFFF06292),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
