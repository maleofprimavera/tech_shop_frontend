import 'package:ecommerce_responsive/api/product_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiIpml {
  final Dio _dioClient = Dio();
  static ProductApi productApi = ProductApi(Dio(), baseUrl: "");

  initializeApi() {
    productApi = _useProductApi();
  }

  ProductApi _useProductApi() {
    _dioClient.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    // _dioClient.options.headers = {
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    // };
    ProductApi productApi =
        ProductApi(_dioClient, baseUrl: "http://localhost:8080");
    return productApi;
  }
}
