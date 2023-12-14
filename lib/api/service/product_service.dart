

import 'package:app_challenge/api/model/ProductModel.dart';
import 'package:app_challenge/const/api_const.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'product_service.g.dart';
@RestApi(baseUrl: ApiConst.baseUrl)
abstract class ProductApiService {

  factory ProductApiService(Dio dio) => _ProductApiService(dio);


  @GET(ApiConst.all)
  Future<List<ProductModel>> getAllProduct();
}