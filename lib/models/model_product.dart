
import 'package:json_annotation/json_annotation.dart';

import 'model_category.dart';

class ModelProduct {
  int? id;
  String? name;
  // ignore: non_constant_identifier_names
  String? dateCreated;

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  // String? date_modified_gmt;
  String? type;
  String? status;
  // bool? featured;

  // ignore: non_constant_identifier_names
  // String? catalog_visibility;
  String? description;

  // ignore: non_constant_identifier_names
  // String? short_description;
  // String? sku;
  String? price;

  // ignore: non_constant_identifier_names
  String? regular_price;

  // ignore: non_constant_identifier_names
  String? salePrice;

  // ignore: non_constant_identifier_names
  // String? price_html;

  // ignore: non_constant_identifier_names
  // bool? on_sale;
  // bool? purchasable;

  // ignore: non_constant_identifier_names
  // int? total_sales;
  // bool? virtual;
  // bool? downloadable;


  // ignore: non_constant_identifier_names
  // String? external_url;

  // ignore: non_constant_identifier_names
  // String? button_text;

  // ignore: non_constant_identifier_names
  // String? tax_status;

  // ignore: non_constant_identifier_names
  // String? tax_class;

  // ignore: non_constant_identifier_names
  // bool? manage_stock;

  // ignore: non_constant_identifier_names
  int? stockQuantity;

  // ignore: non_constant_identifier_names
  String? stockStatus;
  // String? backorders;

  // ignore: non_constant_identifier_names
  // bool? backorders_allowed;
  // bool? backordered;

  // ignore: non_constant_identifier_names
  // bool? sold_individually;
  // String? weight;
  // Dimensions? dimensions;

  // // ignore: non_constant_identifier_names
  // bool? shipping_required;
  //
  // // ignore: non_constant_identifier_names
  // bool? shipping_taxable;
  //
  // // ignore: non_constant_identifier_names
  // String? shipping_class;
  //
  // // ignore: non_constant_identifier_names
  // int? shipping_class_id;

  // // ignore: non_constant_identifier_names
  // bool? reviews_allowed;
  //
  // // ignore: non_constant_identifier_names
  // String? average_rating;
  //
  // // ignore: non_constant_identifier_names
  // int? rating_count;
  //
  // // ignore: non_constant_identifier_names
  // List<dynamic>? related_ids;
  //
  // // ignore: non_constant_identifier_names
  // List<dynamic>? upsell_ids;
  //
  // // ignore: non_constant_identifier_names
  // List<dynamic>? cross_sell_ids;
  //
  // // ignore: non_constant_identifier_names
  // int? parent_id;
  //
  // // ignore: non_constant_identifier_names
  // String? purchase_note;
  List<ModelCategory>? categories;
  // List<dynamic>? tags;
  List<ShImage>? images;
  // List<Attribute>? attributes;
  //
  // // ignore: non_constant_identifier_names
  // List<dynamic>? default_attributes;

  ModelProduct(
      {this.id,
      this.name,
      // ignore: non_constant_identifier_names
      this.dateCreated,
      // ignore: non_constant_identifier_names
      // ignore: non_constant_identifier_names
      // ignore: non_constant_identifier_names
      this.type,
      this.status,
      // ignore: non_constant_identifier_names

      this.description,
      // ignore: non_constant_identifier_names
      this.price,
      // ignore: non_constant_identifier_names
      this.regular_price,
      // ignore: non_constant_identifier_names
      this.salePrice,
      // ignore: non_constant_identifier_names
      // ignore: non_constant_identifier_names
      // ignore: non_constant_identifier_names
      // this.external_url,
      // ignore: non_constant_identifier_names
      this.stockQuantity,
      // ignore: non_constant_identifier_names
      this.stockStatus,
      this.categories,
      // this.tags,
      this.images,
      });

  factory ModelProduct.fromJson(Map<String, dynamic> json) {
    return ModelProduct(
      id: json['id'],
      name: json['name'],
      dateCreated: json['date_created'],
      type: json['type'],
      status: json['status'],
      description: json['description'],
      price: json['price'],
      regular_price: json['regular_price'],
      salePrice: json['sale_price'],
      // external_url: json['external_url'],
      stockQuantity: json['stock_quantity'],
      stockStatus: json['stock_status'],
      categories: json['categories'] != null ? (json['categories'] as List).map((i) => ModelCategory.fromJson(i)).toList() : null,
      images: json['images'] != null ? (json['images'] as List).map((i) => ShImage.fromJson(i)).toList() : null,
      // attributes: json['attributes'] != null ? (json['attributes'] as List).map((i) => Attribute.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['date_created'] = dateCreated;
    data['type'] = type;
    data['status'] = status;
    data['description'] = description;
    data['price'] = price;
    data['regular_price'] = regular_price;
    data['sale_price'] = salePrice;
    // data['external_url'] = external_url;
    data['stock_quantity'] = stockQuantity;
    data['stock_status'] = stockStatus;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShImage {
  int? id;
  String? src;
  ShImage({this.id, this.src});

  factory ShImage.fromJson(Map<String, dynamic> json) {
    return ShImage(
      id: json['id'],
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['src'] = src;
    return data;
  }
}

class Attribute {
  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  Attribute({this.id, this.name, this.position, this.visible, this.variation, this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'],
      name: json['name'],
      position: json['position'],
      visible: json['visible'],
      variation: json['variation'],
      options: json['options'] != null ? List<String>.from(json['options']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['visible'] = visible;
    data['variation'] = variation;
    if (options != null) {
      data['options'] = options;
    }
    return data;
  }
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({this.length, this.width, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      length: json['length'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
