import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/model/ProductModel.dart';
import '../../provider/get_all_product/all_product_notifier.dart';
import '../../provider/get_all_product/all_product_state.dart';
import '../details_screen.dart';
import '../home_screen.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ProductNotifer>(
          builder: (_,productProvider,__) {
            AllProductState allProductState = productProvider.allProductState;
            if(allProductState is SuccessState) {
              List<ProductModel> allProducts = allProductState.allProducts;
              return RefreshIndicator(
                onRefresh: () {
                  return Provider.of<ProductNotifer>(context,listen: false).getAllProduct();
                },
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1/1.6,
                        crossAxisCount: 2),
                    itemCount: allProducts.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> DetailScreen(productModel: allProducts[index])));
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                  ),
                                  border: Border.all(color: Colors.pink.withOpacity(0.1))
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top :10,
                                    right: 10,
                                    left: 10,
                                    bottom: 1,
                                    child: Image.network(allProducts[index].imageLink ?? '',
                                      width: 150,

                                    ),
                                  ),
                                  const Positioned(
                                      top: 10,
                                      right : 10,
                                      child: Icon(Icons.favorite,color: Colors.red,size: 20,))
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              height:100,
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('${getFirstWords(allProducts[index].name ?? '', 2)} ...',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,color: Colors.brown
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(allProducts[index].productType ?? '',style:
                                    const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12
                                    ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(' \$ ${allProducts[index].price}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),)

                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                      );
                    }),
              );
            }
            else if(allProductState is FailState){
              return Center(child: Text(allProductState.error),);
            }
            return const Center(child: Text('Loading....'),);
          }
      ),
    );
  }
}
