import 'package:bloc/bloc.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/utils/root_bundle.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartProducts: [], loadStatus: LoadStatus.pure)) {

    on<GetCartProductsEvent>(_onGetCartProductEvent);

    on<AddCartProductEvent>((event, emit) async {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      try {
        await addProductToCard(event.productId);
        List<ProductResponse>? productList = await loadProductFromCart();
        emit(state.copyWith(loadStatus: LoadStatus.success, cartProducts: productList));
      } catch (e) {
        emit(state.copyWith(loadStatus: LoadStatus.failed));
      }
    });
    on<RemoveCartProductEvent>((event, emit) async {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      try {
        await removeProductFromCart(event.productId);
        List<ProductResponse>? productList = await loadProductFromCart();
        emit(state.copyWith(loadStatus: LoadStatus.success, cartProducts: productList));
      } catch (e) {
        emit(state.copyWith(loadStatus: LoadStatus.failed));
      }
    });
  }
  
  void _onGetCartProductEvent(GetCartProductsEvent event, Emitter emit) async {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      try {
        List<ProductResponse>? productList = await loadProductFromCart();
        emit(state.copyWith(loadStatus: LoadStatus.success, cartProducts: productList));
      } catch (e) {
        emit(state.copyWith(loadStatus: LoadStatus.failed));
      }
}
}
