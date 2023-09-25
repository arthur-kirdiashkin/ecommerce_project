import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_state.dart';

class ProductDetailsPhoneWidget extends StatelessWidget {
  const ProductDetailsPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        if (state is ProductLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is ProductLoadedState) {
          products = state.product;
          return CarouselSlider.builder(
            itemCount: products[0].images!.length,
            options: CarouselOptions(
              height: 300,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.7,
              initialPage: 0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, _) {
              return PhoneCarouselSlider(images: products[0].images![index]);
            },
          );
        } else if (state is ProductFailureState) {
          return const Center(
            child: Text('Error getting images'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class PhoneCarouselSlider extends StatelessWidget {
  const PhoneCarouselSlider({super.key, required this.images});
  final String? images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CachedNetworkImage(
          imageUrl: images ?? '',
          fit: BoxFit.fitWidth,
          alignment: Alignment.center),
    );
  }
}
