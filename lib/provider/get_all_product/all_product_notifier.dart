

import 'package:app_challenge/api/model/ProductModel.dart';
import 'package:app_challenge/api/service/product_service.dart';
import 'package:app_challenge/provider/get_all_product/all_product_state.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ProductNotifer extends ChangeNotifier{
  AllProductState allProductState = LoadingState();
  final ProductApiService _productApiService = ProductApiService(Dio());
  Future<void> getAllProduct() async {
    allProductState = LoadingState();
    notifyListeners();
    try{
      List<ProductModel> allProducts = await _productApiService.getAllProduct();
      allProductState = SuccessState(allProducts);
      notifyListeners();
    }
    catch(e){
      allProductState = FailState(e.toString());
      notifyListeners();
    }
  }
}