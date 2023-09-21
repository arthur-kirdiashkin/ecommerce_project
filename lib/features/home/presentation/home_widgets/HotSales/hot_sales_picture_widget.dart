import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/themes/app_colors.dart';
import '../../../domain/entities/phone_entity.dart';
import '../../bloc/home_bloc.dart';

class HotSalesPictureWidget extends StatelessWidget {
  const HotSalesPictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<PhoneEntity> phonesList = [];
        if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoadedState) {
          phonesList = state.phones;
          return CarouselSlider.builder(
            itemCount: phonesList.length,
            options: CarouselOptions(
                height: 200,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1),
            itemBuilder: (context, index, _) {
              return HotSalesPhoneWidget(
                  picture: phonesList[index].picture,
                  isNew: phonesList[index].isNew,
                  title: phonesList[index].title,
                  subtitle: phonesList[index].subtitle,
                  isBuy: phonesList[index].isBuy);
            },
          );
        } else if (state is HomeFailureState) {
          return const Center(
            child: Text('Error getting HotSales'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class HotSalesPhoneWidget extends StatelessWidget {
  const HotSalesPhoneWidget(
      {super.key,
      required this.picture,
      required this.isNew,
      required this.title,
      required this.subtitle,
      required this.isBuy});
  final String? picture;
  final bool? isNew;
  final String? title;
  final String? subtitle;
  final bool? isBuy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: picture ?? '',
              width: 378,
              height: 182,
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
        ),
        Positioned(
          top: 5,
          left: 15,
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isNew == true
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.selectedColor,
                            shape: CircleBorder(),
                            minimumSize: Size(27, 27)),
                        onPressed: () {},
                        child: const Text(
                          'New',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.w700),
                        ))
                    : const SizedBox(
                        height: 48,
                      ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$title',
                  style: const TextStyle(
                      fontFamily: 'SFPro',
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$subtitle',
                  style: const TextStyle(
                      fontFamily: 'SFPro',
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minimumSize: const Size(98, 23),
                    ),
                    onPressed: () {},
                    child: isBuy == true
                        ? const Text(
                            'Buy now!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontFamily: 'SFPro',
                                fontWeight: FontWeight.w800),
                          )
                        : null),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
