import 'package:app_challenge/api/model/ProductModel.dart';
import 'package:app_challenge/provider/get_all_product/all_product_notifier.dart';
import 'package:app_challenge/provider/get_all_product/all_product_state.dart';
import 'package:app_challenge/screen/details_screen.dart';
import 'package:app_challenge/screen/report_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     Provider.of<ProductNotifer>(context,listen: false).getAllProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
          child: Column(
            children: [
              AppbarWidget(title: 'Maybelline',icon: Icons.assignment,
                function: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportScreen()));
                },),
              SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: CupertinoColors.lightBackgroundGray,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(

                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                        ),
                        hintText: 'Search the products...',
                        hintStyle: TextStyle(
                            fontSize: 14
                        ),
                        suffixIcon: Icon(Icons.search)
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1/1.5,
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
                                  borderRadius: BorderRadius.only(
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
                                      Positioned(
                                        top: 10,
                                        right : 10,
                                          child: Icon(Icons.favorite,color: Colors.red,size: 20,))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height:80,
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)
                                  )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${getFirstWords(allProducts[index].name ?? '', 2)} ...',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,color: Colors.brown
                                  ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(allProducts[index].productType ?? '',style:
                                      TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(' \$ ${allProducts[index].price}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),)
                                  ],
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
                    return Center(child: Text('Loading....'),);
  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




String getFirstWords(String sentence, int wordCounts) {
  return sentence.split(" ").sublist(0, wordCounts).join(" ");
}


