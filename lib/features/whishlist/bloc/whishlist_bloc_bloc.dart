import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_project/shared/Models/ProductDataModel.dart';
import 'package:meta/meta.dart';

import '../../../Data/whishLsitItems.dart';

part 'whishlist_bloc_event.dart';
part 'whishlist_bloc_state.dart';

class WhishlistBlocBloc extends Bloc<WhishlistBlocEvent, WhishlistBlocState> {
  WhishlistBlocBloc() : super(WhishlistBlocInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<RemoveWishListEvent>(removeWishListEvent);
  }

  FutureOr<void> wishListInitialEvent(
      WishListInitialEvent event, Emitter<WhishlistBlocState> emit) {
    emit(
      WishListSuccessState(wishListItems: wishlist),
    );
  }

  FutureOr<void> removeWishListEvent(
      RemoveWishListEvent event, Emitter<WhishlistBlocState> emit) {
    wishlist.remove(event.clickedProduct);
    emit(
      WishListSuccessState(wishListItems: wishlist),
    );
  }
}
