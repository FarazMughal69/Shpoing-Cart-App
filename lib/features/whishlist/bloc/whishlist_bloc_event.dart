part of 'whishlist_bloc_bloc.dart';

@immutable
sealed class WhishlistBlocEvent {}

class WishListInitialEvent extends WhishlistBlocEvent {}

class RemoveWishListEvent extends WhishlistBlocEvent {
  final ProductDataModel clickedProduct;
  RemoveWishListEvent({required this.clickedProduct});
}
