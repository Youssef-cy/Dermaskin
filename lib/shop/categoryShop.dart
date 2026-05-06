import 'package:dramaskin/shop/product.dart';
import 'package:flutter/material.dart';



class Product {
  final String brand;
  final String name;
  final String price;
  final String image;

  Product({
    required this.brand,
    required this.name,
    required this.price,
    required this.image,
  });
}

class Categoryshop extends StatelessWidget {
  final List<Product> products = [
    Product(brand: 'C E N T E L L A', name: 'Facial Serum', price: '\$10,3', image: 'assets/download__58_-removebg-preview.png'),
    Product(brand: 'Mario Badescu', name: 'Facial Spray', price: '\$11,75', image: 'assets/Facial_Spray_With_Aloe__Herbs_And_Rosewater_-_8_oz-removebg-preview.png'),
    Product(brand: 'Glow Recipe', name: 'Pore-tight Toner', price: '\$13,48', image: 'assets/download__59_-removebg-preview.png'),
    Product(brand: 'BYOMA', name: 'Gel-cream', price: '\$14,99', image: 'assets/Byoma_gel_cream-removebg-preview.png'),
    Product(brand: 'Rhode', name: 'glazing milk', price: '\$12,00', image: 'assets/glazing_milk-removebg-preview.png'),
    Product(brand: 'Summer Fridays', name: 'Lip Butter Balm', price: '\$24,00', image: 'assets/Lipbalm.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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

                  Expanded(
                    child: Center(
                      child: Text(
                        'Normal Skin',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search Product For Normal Skin',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '50 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Product Results',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('Sort By',
                            style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down,
                            size: 18, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 14),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _ProductCard(product: product);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFF0F4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: Icon(Icons.favorite_border, color: Colors.black87, size: 20),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 16, 12, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(color: Colors.transparent),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.brand,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: product.brand == 'C E N T E L L A' ? 1.5 : 0,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  SizedBox(height: 5),
                  Text(
                    product.price,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}