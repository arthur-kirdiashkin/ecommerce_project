import 'package:ecommerce_project/features/product/presentation/product_widgets/TabsDetails/tabs_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../../common/svg_icons.dart';
import '../../../../../common/themes/app_colors.dart';
import '../../../domain/entities/product_entity.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_state.dart';

class ProductCharacteristicsWidget extends StatelessWidget {
  const ProductCharacteristicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductLoadedState) {
          products = state.product;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final productDetails = products[index];
              return RatingProductWidget(
                title: '${productDetails.title}',
                rating: productDetails.rating,
              );
            },
          );
        } else if (state is ProductFailureState) {
          return const Center(
            child: Text('Error getting rating'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class RatingProductWidget extends StatelessWidget {
  const RatingProductWidget({
    super.key,
    required this.title,
    required this.rating,
  });
  final String? title;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$title',
              style: const TextStyle(
                  fontFamily: 'MarkPronormal500',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.buttonBarColor),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    minimumSize: Size(37, 37),
                    backgroundColor: AppColors.buttonBarColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: vectorHeartIcon),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            children: [
              RatingBar(
                itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                itemSize: 22,
                initialRating: rating ?? 0.0,
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: AppColors.startsColor,
                    ),
                    half: const Icon(
                      Icons.star_half,
                      color: AppColors.startsColor,
                    ),
                    empty: const Icon(
                      Icons.star_outline,
                      color: AppColors.startsColor,
                    )),
                onRatingUpdate: (value) {
                  value = rating ?? 0.0;
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const SizedBox(
          height: 323,
          child: TabsDetailsWidget(),
        ),
      ],
    );
  }
}
