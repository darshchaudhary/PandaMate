import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CouponPage());
}

class CouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade400,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          title: Text(
            'COUPONS AND DISCOUNTS',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )
          ),
        ),
        body: CouponList(),
      ),
    );
  }
}

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade400,
      ),
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CouponItem(title: '50% Off on Electronics', description: 'Bamboo Points required: 100'),
            CouponItem(title: '20% Off on Clothing', description: 'Bamboo Points required: 65'),
            CouponItem(title: 'Free Shipping on Orders', description: 'Bamboo Points required: 50'),
            CouponItem(title: 'Buy One Get One Free', description: 'Bamboo Points required: 100'),
            CouponItem(title: 'Special Discount on Books', description: 'Bamboo Points required: 40'),
            CouponItem(title: 'Weekend Sale', description: 'Bamboo Points required: 45'),
          ],
        ),
      ),
    );
  }
}

class CouponItem extends StatelessWidget {
  final String title;
  final String description;

  CouponItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
