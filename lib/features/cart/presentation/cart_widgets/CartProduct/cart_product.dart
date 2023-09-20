import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/svg_icons.dart';
import '../../../../../common/themes/app_colors.dart';
import '../../../domain/entities/cart_entity.dart';
import '../../bloc/cart_bloc.dart';
import '../../bloc/cart_state.dart';

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<CartEntity> cartList = [];
        if (state is CartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoadedState) {
          cartList = state.cartProducts;
          return Container(
              height: 658,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: AppColors.buttonBarColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 51),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartList[0].basket!.length,
                      itemBuilder: (context, index) {
                        return CartItemsWidget(
                          images: '${cartList[0].basket![index].images}',
                          price: cartList[0].basket![index].price,
                          title: '${cartList[0].basket![index].title}',
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 113,
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 4,
                    endIndent: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55, right: 35, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          '\$${state.cartProducts[0].total} us',
                          style: const TextStyle(
                              fontFamily: 'MarkPronormal700',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 55,
                      right: 70,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          '${state.cartProducts[0].delivery}',
                          style: const TextStyle(
                              fontFamily: 'MarkPronormal700',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.1,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(326, 54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.selectedColor),
                      onPressed: () {},
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                            fontFamily: 'MarkPronormal700',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ],
              ));
        } else if (state is CartErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({
    super.key,
    required this.images,
    required this.title,
    required this.price,
  });

  final String? images;
  final String? title;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 32.25),
      child: Card(
        margin: const EdgeInsets.only(bottom: 42),
        color: AppColors.buttonBarColor,
        shadowColor: AppColors.buttonBarColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  width: 88,
                  height: 88,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                  imageUrl: '$images'),
            ),
            const SizedBox(
              width: 17,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 153,
                  child: Text(
                    '$title',
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'MarkPronormal500',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  '\$$price.00',
                  style: const TextStyle(
                    color: AppColors.selectedColor,
                    fontFamily: 'MarkPronormal500',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 33,
            ),
            Container(
              width: 26,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: AppColors.myCartCounterColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: cartMinusIcon,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      '2',
                      style: TextStyle(
                          fontFamily: 'MarkPronormal500',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: cartPlusIcon,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            cartBasketIcon
          ],
        ),
      ),
    );
  }
}
