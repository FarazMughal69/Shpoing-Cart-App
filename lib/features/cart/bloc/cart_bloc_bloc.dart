import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/Data/cartItems.dart';
import 'package:flutter_bloc_project/shared/Models/ProductDataModel.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartListInitialEvent>(cartListInitialEvent);
    on<RemoveCartListEvent>(removeCartListEvent);
  }

  FutureOr<void> cartListInitialEvent(
      CartListInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartListSuccessState(cartListItems: cartItems));
  }

  FutureOr<void> removeCartListEvent(
      RemoveCartListEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.clickedProduct);
    emit(
      CartListSuccessState(cartListItems: cartItems),
    );
  }
}
