import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/Data/cartItems.dart';
import 'package:flutter_bloc_project/Data/grocery_data.dart';
import 'package:flutter_bloc_project/Data/whishLsitItems.dart';
import 'package:flutter_bloc_project/shared/Models/ProductDataModel.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeintialEvent>(homeintialEvent);
    on<HomeProductWishListBtnNavigatorEvent>(
        homeProductWishListBtnNavigatorEvent);
    on<HomeProductCartBtnNavigatorEvent>(homeProductCartBtnNavigatorEvent);
    on<HomeProductWishlistBtnClickedEvent>(homeProductWishlistBtnClickedEvent);
    on<HomeProductCartBtnClickedEvent>(homeProductCartBtnClickedEvent);
    // on<ToggleIconEvent>(toggleIconEvent);
  }

  FutureOr<void> homeintialEvent(
      HomeintialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: Grocery.groceryItems
            .map(
              (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  price: e['price'],
                  imageUrl: e['image']),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductWishlistBtnClickedEvent(
      HomeProductWishlistBtnClickedEvent event, Emitter<HomeBlocState> emit) {
    if (wishlist.contains(event.clickedProduct)) {
      wishlist.remove(event.clickedProduct);
      emit(ProductExistWishListtState());
    }
    //  *(!wishlist.contains(event.clickedProduct))
    else {
      wishlist.add(event.clickedProduct);
      emit(ProductAddedtoWishListtState());
    }
  }

  FutureOr<void> homeProductCartBtnClickedEvent(
      HomeProductCartBtnClickedEvent event, Emitter<HomeBlocState> emit) {
    if (cartItems.contains(event.clickedProduct)) {
      cartItems.remove(event.clickedProduct);
      emit(ProductAddedtoCartState());
    }
    // if (!cartItems.contains(event.clickedProduct))
    else {
      cartItems.add(event.clickedProduct);
      emit(ProductAddedtoCartState());
    }
  }

  FutureOr<void> homeProductWishListBtnNavigatorEvent(
      HomeProductWishListBtnNavigatorEvent event, Emitter<HomeBlocState> emit) {
    // print('Navigate to whishList');
    emit(HomeNavigatorWishlstState());
  }

  FutureOr<void> homeProductCartBtnNavigatorEvent(
      HomeProductCartBtnNavigatorEvent event, Emitter<HomeBlocState> emit) {
    // print('Navigation to cart Page');
    emit(HomeNavigatorCartState());
  }
}
