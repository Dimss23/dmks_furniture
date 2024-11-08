import 'package:dmks_furniture/models/product_model.dart';
import 'package:dmks_furniture/viewmodels/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class FavoritesView extends StatelessWidget {
  final List<String> favoriteProductIds = ['6', '2'];
  final ProductViewModel productViewModel = ProductViewModel();

  FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> favoriteProducts = favoriteProductIds
        .map((id) => productViewModel.getProductById(id))
        .toList();

    // Create a NumberFormat instance for IDR currency
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Set the locale to Indonesian
      symbol: 'IDR ', // Currency symbol
      decimalDigits: 2, // Number of decimal digits
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Barang yang Disukai'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // jumlah kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount:
            favoriteProducts.length, // jumlah barang favorit yang ditampilkan
        itemBuilder: (context, index) {
          Product product = favoriteProducts[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(product
                            .imageUrl), // menggunakan imageUrl dari product
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(
                          currencyFormat.format(product.price)), // Format harga
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}