import 'dart:convert';

import 'package:app_shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print('service');

    JsonDecoder decoder = JsonDecoder();
    JsonEncoder encoder = JsonEncoder.withIndent('  ');

    void prettyPrintJson(String input) {
      var object = decoder.convert(input);
      var prettyString = encoder.convert(object);
      prettyString.split('\n').forEach((element) => print(element));
    }

    prettyPrintJson(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products =
          data.map((product) => ProductModel.fromJson(product)).toList();

      return products;
    } else {
      throw Exception('Gagal get products');
    }
  }
}
