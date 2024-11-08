import 'package:dmks_furniture/viewmodels/product_view_model.dart';
import 'package:flutter/material.dart';
import 'detail_view.dart';

class ScannerView extends StatelessWidget {
  final ProductViewModel viewModel = ProductViewModel();

  ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulasi hasil pemindaian
    final scannedProduct = viewModel.getProductById('1');

    return Scaffold(
      appBar: AppBar(title: const Text('Scan Product')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(scannedProduct.imageUrl),
            Text(scannedProduct.name),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(product: scannedProduct),
                  ),
                );
              },
              child: const Text('View Product Details'),
            ),
          ],
        ),
      ),
    );
  }
}
