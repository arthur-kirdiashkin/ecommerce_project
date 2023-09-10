import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_project/application/ui/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_project/application/ui/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce_project/application/ui/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_project/application/ui/cart/presentation/bloc/cart_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/svg_icons.dart';
import '../../../themes/app_colors.dart';
import '../bloc/cart_state.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final _cartRepository = CartRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            AddAdressWidget(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42),
              child: Text(
                'My Cart',
                style: TextStyle(
                    fontFamily: 'MarkPronormal800',
                    color: AppColors.buttonBarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            // BlocProvider(
            //   create: (context) =>
            //       CartBloc(_cartRepository)..add(CartLoadEvent()),
            //   child: CartProductWidget(),
            // ),
            CartProductWidget()
          ],
        ),
      ),
    );
  }
}

class AddAdressWidget extends StatelessWidget {
  const AddAdressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 37),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
                minimumSize: Size(37, 37),
                backgroundColor: AppColors.buttonBarColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: productArrowIcon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 140),
          child: Text(
            'Add address',
            style: TextStyle(
                fontFamily: 'MarkPronormal500',
                color: AppColors.buttonBarColor,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: Size(37, 37),
                backgroundColor: AppColors.selectedColor,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: vectorAddressIcon,
          ),
        )
      ],
    );
  }
}

class CartProductWidget extends StatelessWidget {
  const CartProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<CartEntity> cartList = [];
        if (state is CartLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartLoadedState) {
          cartList = state.cartProducts;
          return Container(
              height: 658,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColors.buttonBarColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 51),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartList[0].basket.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 33, right: 32.25),
                          child: Card(
                            margin: EdgeInsets.only(bottom: 42),
                            color: AppColors.buttonBarColor,
                            shadowColor: AppColors.buttonBarColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: PersonCacheImage(
                                    width: 88,
                                    height: 88,
                                    imageUrl:
                                        '${cartList[0].basket[index].images}',
                                  ),
                                ),
                                SizedBox(
                                  width: 17,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 153,
                                      child: Text(
                                        '${cartList[0].basket[index].title}',
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'MarkPronormal500',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      '\$${cartList[0].basket[index].price}.00',
                                      style: TextStyle(
                                        color: AppColors.selectedColor,
                                        fontFamily: 'MarkPronormal500',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {},
                                          child: cartMinusIcon,
                                        ),
                                      ),
                                      Expanded(
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
                                SizedBox(
                                  width: 14,
                                ),
                                cartBasketIcon
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 113,
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 4,
                    endIndent: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 55, right: 35, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          '\$${state.cartProducts[0].total} us',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal700',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 55,
                      right: 70,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          '${state.cartProducts[0].delivery}',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal700',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 4,
                    endIndent: 4,
                    thickness: 0.1,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(326, 54),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.selectedColor),
                      onPressed: () {},
                      child: Text(
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
              '${state.message}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
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
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter),
      ),
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
    );
  }
}

