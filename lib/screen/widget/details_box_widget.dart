
import 'package:app_challenge/screen/dialog_screen.dart';
import 'package:flutter/material.dart';

import '../../api/model/ProductModel.dart';


class DetailsBoxWidget extends StatelessWidget {
  const DetailsBoxWidget({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.1),
          borderRadius: BorderRadius.circular(40)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0,top: 25,right: 25,bottom: 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 22,
                //color: Colors.blue,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 6,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: 22,
                      height: 22,
                    ),
                    const SizedBox(width: 6,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.indigo.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: 22,
                      height: 22,

                    ),
                    const SizedBox(width: 6,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: 22,
                      height: 22,

                    ),
                  ],
                )
            ),
            const SizedBox(
              height: 20,
            ),
            Text(productModel.name ?? '',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productModel.productType  ?? '',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),),
                RatingBar(rating: productModel.rating?.toDouble() ?? 0,
                  //ratingCount: 10
                )
              ],
            ),
            const SizedBox(height: 20,),
            Container(
                height: 85,
                //color: Colors.red,
                child: SingleChildScrollView
                  (child: Text(productModel.description ?? '',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),))),
            const SizedBox(height: 20,),
            Divider(color: Colors.pink.withOpacity(0.5),
              indent: 40,
              endIndent: 40,
              thickness: 1,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${productModel.price}',style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
                ),
                const SizedBox(width: 30,),
                Container(
                  width: 80,height: 25,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.brown.withOpacity(0.3)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 2,),
                      Icon(Icons.remove,size: 10,color: Colors.grey,),
                      Text('1',style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                      ),),
                      Icon(Icons.add,size: 10,color: Colors.grey,),
                      SizedBox(width: 2,)
                    ],
                  ),
                ),

                Container(
                  width: 70,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed:(){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: const Text('            Delivery Info'),
                          content: DialogScreen(price: productModel.price,),
                        );
                      });
                      }, child: const Text('Cart')),
                )

              ],
            )
          ],
        ),
      ),);
  }
}


class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  //final int ratingCount;
  RatingBar({required this.rating,
    //required this.ratingCount,
    this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];

    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(Icons.star, color: Colors.brown, size: size));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star, color: Colors.brown, size: size),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        _starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    // ratingCount != null ? _starList.add(Padding(
    //     padding: EdgeInsets.only(left:10),
    //     child: Text('($ratingCount)', style: TextStyle(
    //         fontSize: size*0.8, color: Theme.of(context).disabledColor)
    //     )),
    // ) : SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
