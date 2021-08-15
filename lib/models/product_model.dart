import 'package:app_shamo/models/category_model.dart';
import 'package:app_shamo/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  CategoryModel category;
  DateTime createdAt;
  DateTime upatedAt;
  List<GalleryModel> galleries;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.category,
      this.createdAt,
      this.upatedAt,
      this.galleries});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    upatedAt =
        json['upated_at'] != null ? DateTime.parse(json['upated_at']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'upated_at': upatedAt.toString(),
    };
  }
}
