import 'package:dmks_furniture/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final Product product;

  const DetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imageUrl),
            const SizedBox(height: 16),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Price: IDR ${product.price.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 16),
            Text(product.description),
            const Spacer(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buy Now'),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Ask for Give Away'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
