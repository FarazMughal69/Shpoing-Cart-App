import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/shared/Models/ProductDataModel.dart';

import '../../../main.dart';
import '../bloc/home_bloc.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductDataModel pDataModel;
  final HomeBloc homeBloc;
  final bool isAddedWishlst;
  final bool isAddedCart;

  const ProductCardWidget({
    super.key,
    required this.pDataModel,
    required this.homeBloc,
    required this.isAddedWishlst,
    required this.isAddedCart,
  });

  @override
  Widget build(BuildContext context) {
    Icon wishIcon = const Icon(CupertinoIcons.heart);
    Icon selectedwishIcon = const Icon(CupertinoIcons.heart_fill);
    Icon cartIcon = const Icon(CupertinoIcons.cart);
    Icon selectedcartIcon = const Icon(CupertinoIcons.cart_fill);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.3,
              width: mq.width,
              child: Image.asset(
                pDataModel.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mq.height * 0.01,
                left: mq.width * 0.04,
              ),
              child: Text(pDataModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: mq.height * 0.01,
                    left: mq.width * 0.04,
                    bottom: mq.height * 0.01,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'Price ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        style: const TextStyle(color: Colors.black54),
                        text: '\$${pDataModel.price.toString()}',
                      ),
                    ]),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductWishlistBtnClickedEvent(
                              clickedProduct: pDataModel),
                        );
                      },
                      icon: isAddedWishlst ? selectedwishIcon : wishIcon,
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductCartBtnClickedEvent(
                              clickedProduct: pDataModel),
                        );
                      },
                      icon: isAddedCart ? selectedcartIcon : cartIcon,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
