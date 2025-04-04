import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<void> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print('Erreur de récupération des produits');
    }
  }

  Future<void> addProduct(String name, double price) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"name": name, "price": price}),
    );

    if (response.statusCode == 201) {
      print('Produit ajouté');
    } else {
      print('Erreur');
    }
  }
}
