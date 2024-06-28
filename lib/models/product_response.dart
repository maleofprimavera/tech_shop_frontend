import 'package:ecommerce_responsive/utils/enum/product_category_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponse extends Equatable {
  final String? productId;
  final String? name;
  final String? imageUrl;
  final double? price;
  final double? salePrice;
  final DateTime? dateCreated;
  @JsonKey(name:"productTypeEnum")
  final CategoryEnum type;
  final String? description;
  @JsonKey(name:"productImages")
  final List<ProductImage>? images;
  final bool? newArrival;
  final bool? featured;

  const ProductResponse({this.salePrice, this.dateCreated, this.type = CategoryEnum.none, this.description, this.images,
      this.productId, this.name, this.imageUrl, this.price, this.newArrival, this.featured});

  @override
  List<Object?> get props => [productId, name, imageUrl, price,salePrice, dateCreated,type, description,images, newArrival, featured];

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ProductImage {
  @JsonKey(name: "source")
  String? src;

  ProductImage({this.src,});

  factory ProductImage.fromJson(Map<String, dynamic> json) => _$ProductImageFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImageToJson(this);

}