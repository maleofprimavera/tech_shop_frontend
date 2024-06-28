import 'package:ecommerce_responsive/models/product_request_model.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/utils/enum/product_category_enum.dart';

import '../api/product_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class TestApi {
  final ProductApi productApi;
  TestApi(this.productApi);
}

void main() async {
  Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  // List<ProductResponse> productList = List.of( [
  //   ProductResponse(
  //     productId: "54321",
  //     name: "Sample Laptop",
  //     imageUrl: "https://example.com/images/product54321.jpg",
  //     price: 1050.0,
  //     salePrice: 1000.0,
  //     dateCreated: DateTime.parse("2024-07-01T12:00:00"),
  //     type: CategoryEnum.laptop,
  //     description: "High performance laptop with 16GB RAM.",
  //     images: List.of([
  //       ProductImage(src: "https://example.com/images/product54321_1.jpg"),
  //       ProductImage(src: "https://example.com/images/product54321_2.jpg"),
  //     ]),
  //   ),
  //   ProductResponse(
  //     productId: "98765",
  //     name: "Sample Smartphone",
  //     imageUrl: "https://example.com/images/product98765.jpg",
  //     price: 700.0,
  //     salePrice: 650.0,
  //     dateCreated: DateTime.parse("2024-07-01T13:00:00"),
  //     type: CategoryEnum.smartphone,
  //     description: "Latest smartphone with excellent camera.",
  //     images: List.of([
  //       ProductImage(src: "https://example.com/images/product98765_1.jpg"),
  //       ProductImage(src: "https://example.com/images/product98765_2.jpg"),
  //     ]),
  //   ),
  //   ProductResponse(
  //     productId: "22334",
  //     name: "Sample Camera",
  //     imageUrl: "https://example.com/images/product22334.jpg",
  //     price: 480.0,
  //     salePrice: 450.0,
  //     dateCreated: DateTime.parse("2024-07-01T14:00:00"),
  //     type: CategoryEnum.camera,
  //     description: "Compact camera with 4K recording.",
  //     images: List.of([
  //       ProductImage(src: "https://example.com/images/product22334_1.jpg"),
  //       ProductImage(src: "https://example.com/images/product22334_2.jpg"),
  //     ]),
  //   ),
  //   ProductResponse(
  //     productId: "55678",
  //     name: "Sample Tablet",
  //     imageUrl: "https://example.com/images/product55678.jpg",
  //     price: 320.0,
  //     salePrice: 300.0,
  //     dateCreated: DateTime.parse("2024-07-01T15:00:00"),
  //     type: CategoryEnum.tablet,
  //     description: "Tablet with high-resolution screen.",
  //     images: List.of([
  //       ProductImage(src: "https://example.com/images/product55678_1.jpg"),
  //       ProductImage(src: "https://example.com/images/product55678_2.jpg"),
  //     ]),
  //   ),
  // ]);
  ProductApi api = ProductApi(dio, baseUrl: "http://localhost:8080");
  TestApi test = TestApi(api);
  final result_1 = await test.productApi.getAllProducts();
  final result_2 = await test.productApi.getProductById("prod02");
  // final request_01 = await test.productApi.addNewProducts(productList);
  final request_02 = await test.productApi.deleteById("54321");
  // final rquesrt_03 = await test.productApi.updateProduct(
  //     "55678",
  //     ProductRequestModel(
  //       name: "Updated Sample Tablet",
  //       imageUrl: "https://example.com/images/product55678-updated.jpg",
  //       price: 320.0,
  //       salePrice: null,
  //       type: CategoryEnum.tablet,
  //       description: "",
  //       images: List.of([]),
  //     ));
  print(result_2.toString());
}
