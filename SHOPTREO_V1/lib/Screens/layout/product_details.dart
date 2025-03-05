import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoptreo_v1/components/colors/app_colors.dart';
import '../../provider/product_provider.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductsDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context).getProductById(productId);

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Overview", style: TextStyle(
                      fontFamily: "Filson.Pro",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryOrange
                    ),),
                    Text("Review", style: TextStyle(
                      fontFamily: "Filson.Pro",
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),)
                  ],
                ),
              ),
              Center(
                child: Image(
                  image: AssetImage(product.image),
                  height: 300, width: double.infinity, fit: BoxFit.cover,
                ),
              ),
              Divider(
                color: AppColors.primaryOrange,
                thickness: 6,
                height: 0,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          product.name,
                          style: TextStyle(
                              fontFamily: "Filson.Pro",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                          ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("N${product.price} / Piece", style: TextStyle(
                            fontFamily: "Filson.Pro",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),),
                          Icon(Icons.favorite_outline, color: AppColors.yellowHeart, size: 18)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${product.quantity} Pieces (MOQ)", style: TextStyle(
                            fontFamily: "Filson.Pro",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),

                          Icon(Icons.shopping_cart_outlined, size: 18)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // column 1
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryOrange,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Icon(Icons.keyboard_arrow_down_outlined, size: 15,)
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text("N3500", style: TextStyle(
                                    fontFamily: "Filson.Pro",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Text("5-20 Products", style: TextStyle(
                                    fontFamily: "Filson.Pro",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyTxt
                                  ),),
                                ],
                              ),

                              //column2
                              Column(
                                children: [
                                  Text("XXL", style: TextStyle(
                                    fontFamily: "Filson.Pro",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("N2800", style: TextStyle(
                                        fontFamily: "Filson.Pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Text("20-80 Products", style: TextStyle(
                                          fontFamily: "Filson.Pro",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTxt
                                      ),),
                                    ],
                                  )
                                ],
                              ),

                              //column3
                              Column(
                                children: [
                                  Text("250Kg", style: TextStyle(
                                    fontFamily: "Filson.Pro",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("N2000", style: TextStyle(
                                        fontFamily: "Filson.Pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      Text("80 & Above", style: TextStyle(
                                          fontFamily: "Filson.Pro",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyTxt
                                      ),),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Company", style:  TextStyle(
                            fontFamily: "Filson.Pro",
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),),
                          Icon(Icons.arrow_forward_ios_sharp, size: 18, color: Colors.black,)
                        ],
                      ),
                      Text("Ghian Apparels & Couture", style: TextStyle(
                        fontFamily: "Filson.Pro",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),),
                      Row(
                        children: [
                          SvgPicture.asset("assets/location-outline.svg"),
                          Text("Maryland Cresent, Ikeja, Lagos.", style: TextStyle(
                            fontFamily: "Filson.Pro",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                width:  screenWidth,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Text("Delivery", style: TextStyle(
                        fontFamily: "Filson.Pro",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text("Delivery time is estimated by manufacturers.", style: TextStyle(
                        fontFamily: "Filson.Pro",
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
                color: Colors.white,
                child: Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttnLightBg,
                              fixedSize: Size(screenWidth / 2, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onPressed: (){
                          },
                          child: Text(
                            "SEND INQUIRY",
                            style: TextStyle(
                              color: AppColors.primaryOrange
                            ),
                      ),),
                    ),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryOrange,
                            fixedSize: Size(screenWidth / 2, 50),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: (){
                        },
                        child: Text(
                          "BUY NOW",
                        ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
