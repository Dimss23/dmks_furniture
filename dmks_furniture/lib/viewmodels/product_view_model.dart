import 'package:dmks_furniture/models/product_model.dart';

class ProductViewModel {
  List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'Kursi Kantor',
        imageUrl: 'assets/images/kursi/kursi_kantor_1.png',
        price: 2347000.00,
        description: 'Kursi Kantor yang Stylish.',
      ),
      Product(
        id: '2',
        name: 'Kursi Rotan Cassadela',
        imageUrl: 'assets/images/kursi/kursi_rotan_cassadela.png',
        price: 1396000.00,
        description:
            'Kursi Rotan yang kokoh terbuat dari rotan yang sudah dikeringkan dengan lama.',
      ),
      Product(
        id: '3',
        name: 'Meja Makan Kayu',
        imageUrl: 'assets/images/meja/meja_makan1.png',
        price: 350000.00,
        description: 'Stylish tuxedo chair.',
      ),
      Product(
        id: '4',
        name: 'Lampu Belajar',
        imageUrl: 'assets/images/lampu/lampu_belajar1.png',
        price: 20000.00,
        description: 'Comfortable Lamp.',
      ),
      Product(
        id: '5',
        name: 'Kursi Kayu',
        imageUrl: 'assets/images/kursi/kursi1.png',
        price: 30000.00,
        description: 'Stylish tuxedo chair.',
      ),
      Product(
        id: '6',
        name: 'Lampu Kipas Plafon',
        imageUrl: 'assets/images/lampu/lampu_kipas1.png',
        price: 95000.00,
        description: 'Stylish tuxedo chair.',
      ),
      Product(
        id: '7',
        name: 'Sofa Seater Marina',
        imageUrl: 'assets/images/Sofa/sofa1.png',
        price: 2790000.00,
        description: 'Stylish sofa.',
      ),
      Product(
        id: '8',
        name: 'Sofa L Lethicia',
        imageUrl: 'assets/images/Sofa/sofa2.png',
        price: 5616000.00,
        description: 'Stylish sofa.',
      ),
      Product(
        id: '9',
        name: 'Meja Donati',
        imageUrl: 'assets/images/meja/meja_donati.png',
        price: 2000000.00,
        description: 'Stylish meja.',
      ),
      Product(
        id: '10',
        name: 'Tempat Tidur Klasik Anak Spuma',
        imageUrl: 'assets/images/kasur/kasur1.png',
        price: 2750000.00,
        description: 'Stylish kasur.',
      ),
      Product(
        id: '11',
        name: 'Tempat Tidur Vedeni',
        imageUrl: 'assets/images/kasur/kasur2.png',
        price: 8450000.00,
        description: 'Stylish vedeni.',
      ),
    ];
  }

  Product getProductById(String id) {
    return getProducts().firstWhere((product) => product.id == id);
  }
}
