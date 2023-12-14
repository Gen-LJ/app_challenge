
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key, required this.title, this.function, this.icon,
  });
  final String title;
  final function;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: function
          , icon: Icon(icon,size: 20,),color: Colors.brown,
          ),
        ),
        Text(title,style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          fontSize: 17
        ),),
        Container(
          width: 40,height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.brown.withOpacity(0.3)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ),
          child: IconButton(onPressed: (){

          }, icon: const Icon(Icons.shopping_cart_outlined,size: 20,),color: Colors.brown,),
        )
      ],
    );
  }}