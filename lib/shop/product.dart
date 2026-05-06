import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';

import '../Provider/products.dart';
import '../cart/cart.dart';


class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFF775A9).withOpacity(0.3),
                            width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: GestureDetector(

                        onTap: () {
                          Navigator.pop(context);
                        },

                        child: Icon(Icons.arrow_back_ios_new,
                            color: Color(0xFFF775A9), size: 22),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('BYOMA',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        Text('View Brand',
                            style: TextStyle(
                                color: Color(0xFFF775A9), fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Image.asset(
                'assets/byoma_cream.png',
                height: 260,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 24,
                      height: 8,
                      decoration: BoxDecoration(
                          color: Color(0xFFF775A9),
                          borderRadius: BorderRadius.circular(6))),
                  SizedBox(width: 6),
                  CircleAvatar(radius: 5, backgroundColor: Colors.grey[300]),
                  SizedBox(width: 6),
                  CircleAvatar(radius: 5, backgroundColor: Colors.grey[300]),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(28, 32, 28, 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        spreadRadius: 6),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('Moisturising Gel Cream',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFF775A9).withOpacity(0.3),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(Icons.favorite_border, size: 26),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text('Gel-cream',
                        style:
                        TextStyle(fontSize: 16, color: Colors.grey[400])),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 12),
                          decoration: BoxDecoration(
                              color: Color(0xFFF775A9),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text('Description',
                              style:
                              TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                        Text('How To Use',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 15)),
                        Text('Reviews',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey[600], height: 1.7),
                        children: [
                          TextSpan(
                              text:
                              'This lightweight, oil-free daily moisturizer delivers effective, '
                                  'targeted hydration to thirsty skin. The unique, gel-cream texture absorbs instantly, '
                                  'softening and hydrating skin with a barrier boosting blend of carefully '),
                          TextSpan(
                            text: 'see more',
                            style: TextStyle(
                                color: Color(0xFFF775A9),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF775A9).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text('50 ML',
                          style: TextStyle(
                              color: Color(0xFFF775A9),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$14.99',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFFF775A9).withOpacity(0.4),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(

                                onTap: () {
                                  Provider.of<products>(context,listen: false).decrement();
                                },


                                child: Text('-',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('${Provider.of<products>(context).count}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFF775A9))),
                              ),
                              GestureDetector(

                                onTap: () {
                                  Provider.of<products>(context,listen: false).increment();
                                },

                                child: Text('+',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.grey)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(

                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                          },

                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFF775A9).withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(Iconsax.shopping_cart)
                          ),
                        ),
                      ],
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
}