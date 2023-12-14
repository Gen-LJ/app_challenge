
import 'package:app_challenge/provider/get_all_product/all_product_notifier.dart';

import 'package:app_challenge/screen/report_screen.dart';
import 'package:app_challenge/screen/widget/product_grid_widget.dart';
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
     Future((){
       Provider.of<ProductNotifer>(context,listen: false).getAllProduct();
     });
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReportScreen()));
                },),
              const SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
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
                        hintStyle: const TextStyle(
                            fontSize: 14
                        ),
                        suffixIcon: const Icon(Icons.search)
                    ),

                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const ProductGridWidget()
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


