import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/application/ui/home/data/datasources/phone_remote_data_source.dart';
import 'package:ecommerce_project/application/ui/home/domain/entities/phone_entity.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';
import 'package:ecommerce_project/application/ui/home/domain/usecases/get_all_phones.dart';
import 'package:ecommerce_project/application/ui/home/presentation/bloc/phone_bloc.dart';
import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../data/models/phone_store_model.dart';
import '../pages/home_page.dart';

class HotSalesExampleWidget extends StatefulWidget {
  const HotSalesExampleWidget({super.key});

  @override
  State<HotSalesExampleWidget> createState() => _HotSalesExampleWidgetState();
}

class _HotSalesExampleWidgetState extends State<HotSalesExampleWidget> {
  @override
  Widget build(BuildContext context) {
    // final modelInherited = context.watch<PhoneModelInherited>();
    return BlocBuilder<PhoneBloc, PhoneState>(
      builder: (context, state) {
        List<PhoneEntity> phonesList = [];
        if (state is PhoneLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PhoneLoadedState) {
          phonesList = state.phones;
          return CarouselSlider.builder(
            itemCount: phonesList.length,
            options: CarouselOptions(
                height: 200,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1),
            itemBuilder: (context, index, _) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                      child: PersonCacheImage(
                        imageUrl: phonesList[index].picture,
                        width: 378,
                        height: 182,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 15,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          phonesList[index].isNew == true
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.selectedColor,
                                      shape: CircleBorder(),
                                      minimumSize: Size(27, 27)),
                                  onPressed: () {},
                                  child: Text(
                                    'New',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'SFPro',
                                        fontWeight: FontWeight.w700),
                                  ))
                              : SizedBox(
                                  height: 48,
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${phonesList[index].title}',
                            style: TextStyle(
                                fontFamily: 'SFPro',
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${phonesList[index].subTitle}',
                            style: TextStyle(
                                fontFamily: 'SFPro',
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          Container(
                            height: 23,
                            width: 98,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {},
                                child: phonesList[index].isBuy == true
                                    ? const Text(
                                        'Buy now!',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontFamily: 'SFPro',
                                            fontWeight: FontWeight.w800),
                                      )
                                    : null),
                          ),
                        ],
                      ),
                    ),
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
              alignment: Alignment.topLeft)),
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

// class PhoneModelInherited extends ChangeNotifier {
//   final _apiClient = ApiClient();
//   var _phones = <PhoneModel>[];

//   List<PhoneModel> get phones => _phones;

//   Future<void> loadPhone() async {
//     _phones = await _apiClient.getPhones();

//     //  if(_phonesR != null) {
//     //   _phones.addAll(_phonesR);
//     //  }

//     notifyListeners();
//   }
// }
















