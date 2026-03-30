import 'package:flutter/material.dart';
import '../models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final Welcome product;

  DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? "Detail")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO IMAGE
            Center(
              child: Hero(
                tag: "product_${product.id}",
                child: Image.network(
                  product.image ?? "",
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image, size: 100);
                  },
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              product.title ?? "-",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Kategori: ${product.category ?? "-"}",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 10),

            Text(
              "Rp ${product.price?.toStringAsFixed(0)}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 5),
                Text("${product.rating?.rate ?? 0}"),
                SizedBox(width: 5),
                Text(
                  "(${product.rating?.count ?? 0} review)",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Deskripsi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(product.description ?? "-", textAlign: TextAlign.justify),
          ],
        ),
      ),
    );
  }
}
