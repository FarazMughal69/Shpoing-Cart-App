part of 'whishlist_bloc_bloc.dart';

@immutable
sealed class WhishlistBlocState {}

abstract class WishListActoinState extends WhishlistBlocState {}

final class WhishlistBlocInitial extends WhishlistBlocState {}

class WishListSuccessState extends WhishlistBlocState {
  final List<ProductDataModel> wishListItems;
  WishListSuccessState({required this.wishListItems});
}
