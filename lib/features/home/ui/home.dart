import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cart.dart';
import 'package:flutter_bloc_project/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/features/whishlist/ui/wishlist.dart';
import 'package:flutter_bloc_project/main.dart';

import 'productCardWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeintialEvent());
    super.initState();
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    bool isAddedWishlst = false;
    bool isAddedCart = false;
    return BlocConsumer<HomeBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        print(state.runtimeType);
        if (state is HomeNavigatorCartState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        }
        if (state is HomeNavigatorWishlstState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishList(),
            ),
          );
        }
        if (state is ProductAddedtoCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The product Added to Cart'),
            ),
          );
          // isAddedCart = true;
        } else if (state is ProductexisttoCartState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The product remove to Cart'),
            ),
          );
          // isAddedCart = false;
        }
        if (state is ProductAddedtoWishListtState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The product Added to WishList'),
            ),
          );
          // isAddedWishlst = true;
        } else if (state is ProductExistWishListtState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The product remove to WishList'),
            ),
          );
          // isAddedWishlst = false;
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                elevation: 2,
                centerTitle: false,
                title: const Text(
                  'My Grocery App',
                  style: TextStyle(
                    color: appBarTxtClr,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishListBtnNavigatorEvent());
                    },
                    icon: const Icon(CupertinoIcons.heart_fill,
                        color: appBarTxtClr),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductCartBtnNavigatorEvent(),
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.cart_fill,
                      color: appBarTxtClr,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    pDataModel: successState.products[index],
                    homeBloc: homeBloc,
                    isAddedWishlst: isAddedWishlst,
                    isAddedCart: isAddedCart,
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const Scaffold(
              body: Center(
                child: Text('Default'),
              ),
            );
        }
      },
    );
  }
}
