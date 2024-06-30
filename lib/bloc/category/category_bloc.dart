import 'package:bloc/bloc.dart';
import 'package:ecommerce_responsive/api/product_api_impl.dart';
import 'package:ecommerce_responsive/bloc/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_responsive/models/product_response.dart';
import 'package:ecommerce_responsive/utils/enum/product_category_enum.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc()
      : super(CategoryState(
          categoryProducts: const [],
          loadStatus: LoadStatus.pure,
        )) {
    on<GetProductsByCategoryEvent>((event, emit) async {
      emit(state.copyWith(loadStatus: LoadStatus.loading));
      try {
        List<ProductResponse>? categoryProducts =
            await ApiIpml.productApi.getProductsByCategory(event.category.name.toUpperCase());
        emit(state.copyWith(
            categoryProducts: categoryProducts,
            loadStatus: LoadStatus.success));
      } catch (e) {
        emit(state.copyWith(loadStatus: LoadStatus.failed));
      }
    });
  }
}
