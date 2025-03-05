import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shoptreo_v1/Screens/layout/product_details.dart';
import 'package:shoptreo_v1/components/shopping-card.dart';
import 'package:shoptreo_v1/provider/product_provider.dart';

import '../../components/colors/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    //provider
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello,", style: TextStyle(
                          fontFamily: "Filson.Pro",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        Text("Ekenedilichukwu", style: TextStyle(
                          fontFamily: "Filson.Pro",
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      spacing: 10,
                      children: [
                        SvgPicture.asset("assets/chat-dots.svg"),
                        SvgPicture.asset("assets/Cart.svg"),
                        SvgPicture.asset("assets/alert.svg"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: SvgPicture.asset("assets/search.svg", fit: BoxFit.scaleDown,),
                    suffixIcon: SizedBox(
                      width: 70,
                      child: Row(
                        spacing: 10,
                        children: [
                          SvgPicture.asset("assets/Scan.svg", fit: BoxFit.scaleDown,),
                          SvgPicture.asset("assets/Camera.svg", fit: BoxFit.scaleDown,),
                        ],
                      ),
                    ),
                    hintStyle: TextStyle(color: AppColors.greyTxt,
                      fontFamily: "Filson.Pro",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: "Search products/vendors",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.transparent)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.transparent)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                  ),
                  cursorColor: AppColors.greyTxt,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryOrange
                ),
                height: 110,
                width: screenWidth,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 10,
                              children: [
                                SvgPicture.asset("assets/mini-trophy.svg", fit: BoxFit.scaleDown,),
                                Text("Top Picks", style: TextStyle(
                                    fontFamily: "Filson.Pro",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text("Best Seller | Popular Supplier", style: TextStyle(
                                fontFamily: "Filson.Pro",
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 15,
                        bottom: 20,
                        child: Image(image: AssetImage("assets/trophy.png"))
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("You May Like", style: TextStyle(
                fontFamily: "Filson.Pro",
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              ),
            ),

            //shopping items
            products.isEmpty ?
            Center(
                child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(10),
              child: Expanded(
                child: SizedBox(
                  height: screenHeight * 0.4, // Adjust height as needed
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: products.length,
                    itemBuilder: (ctx, index) {
                      final product = products[index];
                      return ShoppingCard(
                          imagePath: product.image,
                          name: product.name,
                          price: product.price,
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ProductsDetailsScreen(productId: product.id),
                              ),
                            );
                          }
                      );
                    },
                  ),
                ),
              ),
            )
            // products.isEmpty ? Center(
            //     child: CircularProgressIndicator()
            // ) : Expanded(
            //   child: Container(
            //     color: Colors.black38,
            //     height: 500,
            //     width: screenWidth,
            //     child: ListView.builder(
            //       itemCount: products.length,
            //       itemBuilder: (ctx, index) {
            //         final product = products[index];
            //         return Container(
            //           color: Colors.amberAccent,
            //           height: 50,
            //           child: Column(
            //             children: [
            //               Container(
            //                 height: 30,
            //                 width: screenWidth / 2,
            //                 decoration: BoxDecoration(
            //                     color: Colors.red,
            //                   image: DecorationImage(image: AssetImage("assets/shoe.png"))
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //         // return ListTile(
            //         //   // leading: Image.network(product.image, width: 50, height: 50),
            //         //   leading: Image(image: AssetImage(product.image), width: 50, height: 50),
            //         //   title: Text(product.name),
            //         //   subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            //         //   onTap: () {
            //         //     Navigator.push(
            //         //       context,
            //         //       MaterialPageRoute(
            //         //         builder: (ctx) => ProductsDetailsScreen(productId: product.id),
            //         //       ),
            //         //     );
            //         //   },
            //         // );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}
