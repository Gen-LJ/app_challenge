import 'package:app_challenge/api/model/ProductModel.dart';
import 'package:app_challenge/screen/home_screen.dart';
import 'package:app_challenge/screen/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widget/details_box_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppbarWidget(
                    title: '${getFirstWords(productModel.name ?? '', 3)} ...',
                  function: (){Navigator.pop(context);},
                  icon: Icons.arrow_back_ios_rounded,
                ),
                SizedBox(height: 20,),
                Image.network(productModel.imageLink ?? '',height: 300,
                fit: BoxFit.fill,),
                SizedBox(height: 10,),
                DetailsBoxWidget(productModel: productModel)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


