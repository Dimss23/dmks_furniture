import 'package:dmks_furniture/models/product_model.dart';
import 'package:dmks_furniture/view/scanner_view.dart';
import 'package:dmks_furniture/view/tombol/kursi.dart';
import 'package:dmks_furniture/view/tombol/lampu.dart';
import 'package:dmks_furniture/view/tombol/meja.dart';
import 'package:dmks_furniture/view/tombol/sofa.dart';
import 'package:dmks_furniture/view/tombol/tempat_tidur.dart';
import 'package:dmks_furniture/viewmodels/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  final ProductViewModel viewModel = ProductViewModel();

  // Define the IDs of the products to display
  final List<String> topProductIds = ['1', '2'];
  final List<String> flashSaleProductIds = ['6', '5'];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch products using their IDs
    List<Product> topProducts =
        topProductIds.map((id) => viewModel.getProductById(id)).toList();

    List<Product> flashSaleProducts =
        flashSaleProductIds.map((id) => viewModel.getProductById(id)).toList();

    // Create a NumberFormat instance for IDR currency
    final NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id_ID', // Set the locale to Indonesian
      symbol: 'IDR ', // Currency symbol
      decimalDigits: 2, // Number of decimal digits
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'BWA Shop',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScannerView()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pencarian
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 24),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari furnitur impian Anda',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Ikon Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(context, Icons.chair, "Kursi", KursiView()),
                _buildCategoryIcon(context, Icons.light, "Lampu", lampuView()),
                _buildCategoryIcon(context, Icons.weekend, "Sofa", SofaView()),
                _buildCategoryIcon(
                    context, Icons.table_bar, "Meja", MejaView()),
                _buildCategoryIcon(
                    context, Icons.bed, "Tempat Tidur", TempatTidurView()),
              ],
            ),

            const SizedBox(height: 24),

            // Bagian Peringkat Teratas
            const Text(
              'Peringkat Teratas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildProductGrid(topProducts, currencyFormat),

            const SizedBox(height: 24),

            // Bagian Flash Sale
            const Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.orange),
                SizedBox(width: 4),
                Text(
                  'Flash Sale',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildProductGrid(flashSaleProducts, currencyFormat),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(
      BuildContext context, IconData icon, String label, Widget view) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => view),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue[100],
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductGrid(
      List<Product> products, NumberFormat currencyFormat) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
            product: products[index], currencyFormat: currencyFormat);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final NumberFormat currencyFormat;

  const ProductCard(
      {super.key, required this.product, required this.currencyFormat});

  @override
  Widget build(BuildContext context) {
    // Format harga
    final formattedPrice = currencyFormat.format(product.price);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(product.imageUrl), // Menggunakan AssetImage
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            formattedPrice,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
