part of 'home_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeintialEvent extends HomeBlocEvent {}

class ToggleIconEvent extends HomeBlocEvent {}

class HomeProductWishlistBtnClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishlistBtnClickedEvent({required this.clickedProduct});
}

class HomeProductCartBtnClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;
  HomeProductCartBtnClickedEvent({required this.clickedProduct});
}

class HomeProductWishListBtnNavigatorEvent extends HomeBlocEvent {
  HomeProductWishListBtnNavigatorEvent();
}

class HomeProductCartBtnNavigatorEvent extends HomeBlocEvent {}
