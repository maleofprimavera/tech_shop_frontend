import 'package:dio/dio.dart';
import 'package:ecommerce_responsive/models/product_request_model.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'product_api.g.dart';

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET('/')
  Future<List<ProductResponse>?> getAllProducts();

  @GET("/filter-by-id/{id}")
  Future<ProductResponse?> getProductById(@Path() String id);
  
  @POST("/add")
  Future addNewProducts(@Body() List<ProductResponse> productList);

  @DELETE("/delete-by-id/{id}")
  Future<String> deleteById(@Path() String id);
  //
  @PATCH("/update-product")
  Future updateProduct(@Query("id") String id, @Body() ProductRequestModel productRecordUpdate);
}
