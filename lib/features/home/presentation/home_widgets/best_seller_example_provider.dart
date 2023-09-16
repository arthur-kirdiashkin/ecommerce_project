import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/svg_icons.dart';
import '../../../product/presentation/pages/product_page.dart';
import '../../../themes/app_colors.dart';
import '../../domain/entities/best_seller_entity.dart';
import '../bloc/home_bloc.dart';

class BestSellerProvierWidget extends StatelessWidget {
  const BestSellerProvierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 300) / 2.3;
    final double itemWidth = size.width / 2.2;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<BestSellerEntity> bestSellers = [];
        if (state is HomeLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeLoadedState) {
          bestSellers = state.bestSellers;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GridView.builder(
              itemCount: bestSellers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Material(
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage())),
                    child: Card(
                      margin: EdgeInsets.all(7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            child: PersonCacheImage(
                              imageUrl: bestSellers[index].id! % 2 == 0
                                  ? bestSellers[0].picture!
                                  : bestSellers[1].picture!,
                              height: 187,
                            ),
                          ),
                          Positioned(
                            left: 145,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(25, 25),
                                  shape: CircleBorder(side: BorderSide.none),
                                  backgroundColor: Colors.white),
                              child: bestSellers[index].isFavorites == true
                                  ? bestSellerFavouriteIcon
                                  : bestSellerNotFavouriteIcon,
                              onPressed: () {},
                            ),
                          ),
                          Positioned(
                            left: 21,
                            top: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${bestSellers[index].priceWithoutDiscount}',
                                      style: TextStyle(
                                          fontFamily: 'MarkProbold',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.buttonBarColor),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      '\$${bestSellers[index].discountPrice}',
                                      style: TextStyle(
                                          fontFamily: 'MarkPronormal500',
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.discountPriceColor,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${bestSellers[index].title}',
                                  style: TextStyle(
                                    fontFamily: 'MarkPronormal400',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonBarColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class PersonCacheImage extends StatelessWidget {
  PersonCacheImage(
      {super.key, required this.imageUrl, this.width, this.height});

  final String imageUrl;
  final double? width;
  final double? height;

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
