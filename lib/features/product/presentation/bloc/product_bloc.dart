import 'package:ecommerce_project/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_project/features/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_all_products.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  ProductBloc({required this.getAllProducts}) : super(ProductInitialState()) {
    on<ProductEvent>(
      (event, emit) async {
        emit(ProductLoadingState());

        List<ProductEntity> _productList = [];

        final _failureOrProductList = await getAllProducts.call();
        _failureOrProductList.fold(
            (failure) => const ProductFailureState(message: 'Error'),
            (products) => _productList.addAll(products));
        emit(ProductLoadedState(product: _productList));
      },
    );
  }
}
