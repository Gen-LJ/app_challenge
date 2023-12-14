import 'package:app_challenge/screen/home_screen.dart';
import 'package:app_challenge/screen/widget/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
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
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                      , icon: Icon(Icons.arrow_back_ios_rounded,size: 20,),color: Colors.brown,
                    ),
                  ),
                  Text('Report',style: TextStyle(
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
              SizedBox(height: 20,),

              Expanded(
                child: ListView.builder(
                    itemCount : 8,
                    itemBuilder: (context,index){
                      return Column(
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
                                      Text('John'),
                                      Text(' \$ ${14.99}')
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Text('${12313131}'),
                                  SizedBox(height: 5,),
                                  Text('Mandalay')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      );
                    }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
