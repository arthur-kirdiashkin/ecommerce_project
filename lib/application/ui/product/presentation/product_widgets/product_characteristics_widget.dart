import 'package:ecommerce_project/application/ui/product/domain/entities/product_entity.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_details_phone_widget.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/tabs_details_widget.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../common/svg_icons.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class ProductCharacteristicsWidget extends StatefulWidget {
  const ProductCharacteristicsWidget({super.key});

  @override
  State<ProductCharacteristicsWidget> createState() =>
      _ProductCharacteristicsWidgetState();
}

class _ProductCharacteristicsWidgetState
    extends State<ProductCharacteristicsWidget> {
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    // final productModelInherited = context.watch<ProductModelInherited>();
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<ProductEntity> products = [];
        if (state is ProductLoadedState) {
          products = state.product;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final productDetails = products[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${productDetails.title}',
                        style: TextStyle(
                            fontFamily: 'MarkPronormal500',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.buttonBarColor),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              minimumSize: Size(37, 37),
                              backgroundColor: AppColors.buttonBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: vectorHeartIcon),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        RatingBar(
                          itemPadding: EdgeInsets.symmetric(horizontal: 3),
                          itemSize: 22,
                          initialRating: productDetails.rating,
                          allowHalfRating: true,
                          ratingWidget: RatingWidget(
                              full: Icon(
                                Icons.star,
                                color: AppColors.startsColor,
                              ),
                              half: Icon(
                                Icons.star_half,
                                color: AppColors.startsColor,
                              ),
                              empty: Icon(
                                Icons.star_outline,
                                color: AppColors.startsColor,
                              )),
                          onRatingUpdate: (value) {
                            value = productDetails.rating;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 323,
                    child: TabsDetailsWidget(),
                  ),
                ],
              );
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
