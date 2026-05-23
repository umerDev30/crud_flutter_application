import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get baseUrl {
    final rawUrl = dotenv.env['CRUD_API_URL']?.trim() ?? '';
    if (rawUrl.isEmpty) {
      throw Exception('CRUD_API_URL is missing from the .env file.');
    }
    return rawUrl;
  }

  static String get productsEndpoint => '$baseUrl/products';
}
