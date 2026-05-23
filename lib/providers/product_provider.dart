import 'package:flutter/foundation.dart';

import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  final ProductService _service = ProductService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => List.unmodifiable(_products);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;
  bool get isEmpty => !_isLoading && _products.isEmpty;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _service.fetchProducts();
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Exception: ', '');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    _errorMessage = null;

    try {
      final createdProduct = await _service.createProduct(product);
      _products = [..._products, createdProduct];
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Exception: ', '');
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    _errorMessage = null;

    try {
      await _service.updateProduct(product);
      final index = _products.indexWhere((item) => item.id == product.id);

      if (index != -1) {
        _products[index] = product;
      }

      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Exception: ', '');
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    _errorMessage = null;

    try {
      await _service.deleteProduct(id);
      _products.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Exception: ', '');
      notifyListeners();
    }
  }
}
