import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/whishlist/bloc/whishlist_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/whishlist/ui/wishListProductWidget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WhishlistBlocBloc wishListBloc = WhishlistBlocBloc();

  @override
  void initState() {
    wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List Items"),
        centerTitle: false,
      ),
      body: BlocConsumer<WhishlistBlocBloc, WhishlistBlocState>(
        bloc: wishListBloc,
        listener: (context, state) {},
        listenWhen: ((previous, current) => current is WishListActoinState),
        buildWhen: ((previous, current) => current is! WishListActoinState),
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final succesState = state as WishListSuccessState;

              return ListView.builder(
                itemCount: succesState.wishListItems.length,
                itemBuilder: ((context, index) {
                  return WishListProductWidget(
                      pDataModel: succesState.wishListItems[index],
                      wishListBloc: wishListBloc);
                }),
              );
            default:
              return const Text('');
          }
        },
      ),
    );
  }
}
