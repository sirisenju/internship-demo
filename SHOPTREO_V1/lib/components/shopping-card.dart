import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;
  final VoidCallback onPressed;
  const ShoppingCard({super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Material(
        color: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: screenWidth / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth,
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image(
                      image: AssetImage(imagePath), fit: BoxFit.cover,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(name, style: TextStyle(
                  fontFamily: "Filson.Pro",
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10,),
                child: Text("N$price / Piece", style: TextStyle(
                  fontFamily: "Filson.Pro",
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right:10, top: 5,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("100 Pieces (MOQ)", style: TextStyle(
                      fontFamily: "Filson.Pro",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),),
                    SvgPicture.asset("assets/cart-mini.svg")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
