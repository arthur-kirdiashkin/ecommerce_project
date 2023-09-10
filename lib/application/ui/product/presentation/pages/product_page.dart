import 'package:ecommerce_project/application/ui/product/domain/repositories/one_phone_repository.dart';
import 'package:ecommerce_project/application/ui/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/product_bloc.dart';
import '../product_widgets/product_characteristics_widget.dart';
import '../product_widgets/product_details_phone_widget.dart';
import '../product_widgets/tabs_details_widget.dart';

class ProductPage extends StatefulWidget {
   ProductPage({super.key});
  

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final onePhoneRepository = OnePhoneRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            // BlocProvider(
            //   create: (context) => ProductBloc(onePhoneRepository)..add(ProductLoadEvent()),
            //   child: ProductDetailsWidget(),
            // )
            ProductDetailsWidget()
            // ChangeNotifierProvider.value(
            //   value: ProductModelInherited(),
            //   child: ProductDetailsWidget(),
            // ),
            // ChangeNotifierProvider.value(
            //   value: ProductModelInherited(),
            //   child: ProductCharacteristicsWidget(),
            // ),
            // SizedBox(
            //   height: 323,
            //   child: TabsDetailsWidget(),
            // ),
          ],
        ),
      ),
    );
  }
}
