
import 'package:app_challenge/screen/home_screen.dart';
import 'package:app_challenge/screen/widget/app_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../api/firestore/firestore.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final FireStoreService fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.brown.withOpacity(0.3)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: IconButton(
                      disabledColor: Colors.brown,
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                      }
                      , icon: const Icon(Icons.arrow_back_ios_rounded,size: 20,),color: Colors.brown,
                    ),
                  ),
                  const Text('Report',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                  ),),
                  Container(
                    width: 40,height: 40,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.brown.withOpacity(0.3)),
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(8)
                    // ),
                    // child: IconButton(onPressed: (){
                    //
                    // }, icon: Icon(Icons.shopping_cart_outlined,size: 20,),color: Colors.brown,),
                  )
                ],
              ),
              const SizedBox(height: 20,),

              Expanded(
                child: StreamBuilder(
                  stream: fireStoreService.getProductStream(),
                  builder: ( context,  snapshot) {
                    if(snapshot.hasData){
                      List productList = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount : productList.length,
                          itemBuilder: (context,index){
                            DocumentSnapshot document = productList[index];
                            String docID = document.id;
                            Map<String,dynamic> data =
                                document.data() as Map<String,dynamic>;
                            String name = data['name'];
                            String price =data['price'];
                            String address =data['address'];
                            String phNo = data['phNo'];

                            return
                            //   ListTile(
                            //   title: Text(name),
                            // );

                              Column(
                              children: [
                                Card(
                                  elevation: 0,
                                  color: Colors.pink.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(name,style: const TextStyle(
                                              fontWeight: FontWeight.bold
                                            ),),
                                            Text(' \$ ${price}',style: const TextStyle(fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(phNo,style: const TextStyle(color: Colors.grey),),
                                        const SizedBox(height: 5,),
                                        Text(address,style: const TextStyle(color: Colors.grey))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,)
                              ],
                            );
                          });
                    }
                    return const Center(child: Text('Error'),);
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
