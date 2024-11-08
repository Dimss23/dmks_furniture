import 'package:flutter/material.dart';

class PromoView extends StatelessWidget {
  const PromoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo Terbaru'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 5, // jumlah promo yang ingin ditampilkan
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              leading:
                  const Icon(Icons.local_offer, color: Colors.blue, size: 40),
              title: Text('Promo Spesial ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text(
                'Diskon besar-besaran untuk produk pilihan!',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman detail promo jika diperlukan
              },
            ),
          );
        },
      ),
    );
  }
}
