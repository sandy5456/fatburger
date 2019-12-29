
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kyankafe/MODEL/OfferImage.dart';

class Imageswiper extends StatefulWidget {
  List<Products> products;
  Imageswiper({this.products});
  @override
  _ImageswiperState createState() => _ImageswiperState();
}

class _ImageswiperState extends State<Imageswiper> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsetsDirectional.only(start: size.width * 0.01),
      height: size.height * 0.19,
      child: Wrap(
          children: List.generate(widget.products.length, (index) {
        return Container(
          height: size.height * 0.19,
          width: size.width,
          child: Swiper(
            autoplay: true,
            duration: 2000,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                widget.products[index].image,
                fit: BoxFit.fill,
              );
            },
             
      viewportFraction: 0.8,
      scale: 0.9,
            itemCount: widget.products.length,
            //pagination: new SwiperPagination(),
        
          ),
        );
      })),
    );
  }
}
