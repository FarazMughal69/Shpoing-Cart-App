import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_bloc_project/shared/Models/ProductDataModel.dart';

import '../../../main.dart';

class CartListProductWidget extends StatelessWidget {
  final ProductDataModel pDataModel;
  final CartBlocBloc cartListBloc;
  const CartListProductWidget(
      {super.key, required this.pDataModel, required this.cartListBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Card(
        child: Column(
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

                    // left: mq.width * 0.04,
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
                        // cartListBloc.add(
                        //   RemoveCartListEvent(clickedProduct: pDataModel),
                        // );
                      },
                      icon: const Icon(CupertinoIcons.heart),
                    ),
                    IconButton(
                      onPressed: () {
                        cartListBloc.add(
                          RemoveCartListEvent(clickedProduct: pDataModel),
                        );
                      },
                      icon: const Icon(CupertinoIcons.cart_fill),
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
