import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/svg_icons.dart';
import '../../../../product/presentation/pages/product_page.dart';
import '../../../../../common/themes/app_colors.dart';
import '../../../domain/entities/best_seller_entity.dart';
import '../../bloc/home_bloc.dart';

class BestSellerPhoneWidget extends StatelessWidget {
  const BestSellerPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<BestSellerEntity> bestSellers = [];
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoadedState) {
          bestSellers = state.bestSellers;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              itemCount: bestSellers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / 1.24),
              ),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductPage())),
                    child: OneBestSellerCardWidget(
                        id: bestSellers[index].id,
                        pictureOne: bestSellers[0].picture,
                        pictureTwo: bestSellers[1].picture,
                        isFavorites: bestSellers[index].isFavorites,
                        priceWithoutDiscount:
                            bestSellers[index].priceWithoutDiscount,
                        discountPrice: bestSellers[index].discountPrice,
                        title: bestSellers[index].title),
                  ),
                );
              },
            ),
          );
        } else if (state is HomeFailureState) {
          return const Center(
            child: Text('Error getting BestSellers'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class OneBestSellerCardWidget extends StatelessWidget {
  const OneBestSellerCardWidget({
    super.key,
    required this.id,
    required this.pictureOne,
    required this.pictureTwo,
    required this.isFavorites,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.title,
  });
  final int? id;
  final String? pictureOne;
  final String? pictureTwo;
  final bool? isFavorites;
  final int? priceWithoutDiscount;
  final int? discountPrice;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 190,
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: (id! % 2 == 0 ? pictureOne : pictureTwo) ?? '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 140),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(25, 25),
                  shape: const CircleBorder(side: BorderSide.none),
                  backgroundColor: Colors.white),
              child: isFavorites == true
                  ? bestSellerFavouriteIcon
                  : bestSellerNotFavouriteIcon,
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 14,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$$priceWithoutDiscount',
                        style: const TextStyle(
                            fontFamily: 'MarkProbold',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.buttonBarColor),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        '\$$discountPrice',
                        style: const TextStyle(
                            fontFamily: 'MarkPronormal500',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.discountPriceColor,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '$title',
                    style: const TextStyle(
                      fontFamily: 'MarkPronormal400',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonBarColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
