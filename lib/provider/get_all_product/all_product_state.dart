import 'package:app_challenge/api/model/ProductModel.dart';

abstract class AllProductState{}

class LoadingState extends AllProductState{}
class SuccessState extends AllProductState{
  final List<ProductModel> allProducts;
  SuccessState(this.allProducts);
}
class FailState extends AllProductState{
  final String error;
  FailState(this.error);
}