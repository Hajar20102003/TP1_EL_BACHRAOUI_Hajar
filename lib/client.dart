import 'dart:convert';
import 'dart:developer'; // Import pour utiliser log()
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:3000"; // Remplace par l'URL correcte de ton API

Future<void> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      log('✅ Produits disponibles :');
      for (var product in products) {
        log('📦 Nom: ${product['name']}, 💰 Prix: ${product['price']}');
      }
    } else {
      log('❌ Erreur lors de la récupération des produits. Code: ${response.statusCode}');
    }
  } catch (e) {
    log('🚨 Exception lors de la récupération des produits: $e');
  }
}

/// Fonction pour ajouter un nouveau produit
Future<void> addProduct(Map<String, dynamic> product) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(product),
    );

    if (response.statusCode == 201) {
      log('✅ Produit ajouté avec succès');
    } else {
      log('❌ Erreur lors de l\'ajout du produit. Code: ${response.statusCode}');
    }
  } catch (e) {
    log('🚨 Exception lors de l\'ajout du produit: $e');
  }
}
