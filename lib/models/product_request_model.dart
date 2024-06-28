import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../utils/enum/product_category_enum.dart';
part 'product_request_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductRequestModel extends ProductResponse {
  @override
  final CategoryEnum type;
  const ProductRequestModel(
      {super.name,
      super.price,
      @JsonKey(name: "productImages") super.images,
      super.imageUrl,
      super.description,
      super.salePrice,
        @override
      @JsonKey(name: "productTypeEnum") this.type = CategoryEnum.none});

  @override
  List<Object?> get props =>
      [name, imageUrl, price, salePrice, type, description, images];

  Map<String, dynamic> toJson() => _$ProductRequestModelToJson(this);
  factory ProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestModelFromJson(json);
}
