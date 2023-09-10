import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/product_remote_data_source.dart';
import '../../data/models/product_store_model.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class ProductDetailsPhoneWidget extends StatefulWidget {
  const ProductDetailsPhoneWidget({super.key});

  @override
  State<ProductDetailsPhoneWidget> createState() =>
      _ProductDetailsPhoneWidgetState();
}

class _ProductDetailsPhoneWidgetState extends State<ProductDetailsPhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        if (state is ProductLoadingState) {
          return CircularProgressIndicator();
        } else if (state is ProductLoadedState) {
          products = state.product;
          return CarouselSlider.builder(
            itemCount: products[0].images.length,
            options: CarouselOptions(
              height: 300,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.7,
            ),
            itemBuilder: (context, index, _) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Image.network(
                      '${products[0].images[0]}',
                    ),
                  ));
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}





// class ProductModelInherited extends ChangeNotifier {
//   final _apiClient = ApiClient();
//   var _productsList = <ProductModel>[];
//   final _imagesList = <String>[];

//   List<ProductModel> get productsList => _productsList;

//   List<String> get imagesList => _imagesList;

//   Future<void> loadProduct() async {
//     _productsList = await _apiClient.getProduct();
//     notifyListeners();
//   }
// }
