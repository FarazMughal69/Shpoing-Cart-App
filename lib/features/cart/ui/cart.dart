import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/features/cart/bloc/cart_bloc_bloc.dart';
import 'package:flutter_bloc_project/features/cart/ui/cartProductListWidget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBlocBloc cartBloc = CartBlocBloc();

  @override
  void initState() {
    cartBloc.add(CartListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Items"),
        centerTitle: false,
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: ((previous, current) => current is CartListActoinState),
        buildWhen: ((previous, current) => current is! CartListActoinState),
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartListSuccessState:
              final succesState = state as CartListSuccessState;
              return ListView.builder(
                itemCount: succesState.cartListItems.length,
                itemBuilder: ((context, index) {
                  return CartListProductWidget(
                      pDataModel: succesState.cartListItems[index],
                      cartListBloc: cartBloc);
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
