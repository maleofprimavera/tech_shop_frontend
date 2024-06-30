// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

enum LoadStatus { loading, failed, success, pure }

class CartState extends Equatable {
  List<ProductResponse> cartProducts;
  LoadStatus loadStatus;
  CartState({required this.cartProducts, required this.loadStatus});

  CartState copyWith(
      {List<ProductResponse>? cartProducts, LoadStatus? loadStatus}) {
    return CartState(
        cartProducts: cartProducts ?? this.cartProducts,
        loadStatus: loadStatus ?? this.loadStatus);
  }

  @override
  List<Object> get props => [cartProducts, loadStatus];
}
