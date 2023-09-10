import 'package:ecommerce_project/application/ui/home/data/repositories/phone_repository_impl.dart';
import 'package:ecommerce_project/application/ui/home/domain/repositories/home_repository.dart';
import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/home_location_widget.dart';
import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/hot_sales_example_provider_widget.dart';
import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/hot_sales_widget.dart';
import 'package:ecommerce_project/application/ui/home/presentation/home_widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../locator_service.dart';
import '../../data/datasources/phone_remote_data_source.dart';
import '../../data/models/phone_store_model.dart';
import '../bloc/phone_bloc.dart';
import '../home_widgets/best_seller_example_provider.dart';
import '../home_widgets/best_seller_widget.dart';
import '../home_widgets/select_category_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _phoneRepository = PhoneRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          HomeLocationWidget(),
          SizedBox(
            height: 18,
          ),
          SelectCategoryWidget(),
          SizedBox(
            height: 35,
          ),
          SearchWidget(),
          SizedBox(
            height: 24,
          ),
          // ChangeNotifierProvider.value(
          //     value: PhoneModelInherited(), child: HotSalesWidget()),
          // ChangeNotifierProvider.value(
          //     value: BestSellerModelInherited(), child: BestSellerWidget()),
          // BlocProvider(
          //   create: (context) => PhoneBloc(_phoneRepository)..add(LoadPhoneEvent()),
          //   child: Column(
          //     children: [
          //       HotSalesWidget(),
          //       BestSellerWidget(),
          //     ],
          //   ),
          // )
          Column(
            children: [
              HotSalesWidget(),
              BestSellerWidget()
            ],
          )
        ],
      ),
    ));
  }
}
