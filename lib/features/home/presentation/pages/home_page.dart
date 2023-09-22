import 'package:flutter/material.dart';
import '../home_widgets/BestSeller/best_sellers_widget.dart';
import '../home_widgets/SelectCategory/home_location_widget.dart';
import '../home_widgets/HotSales/hot_sales_widget.dart';
import '../home_widgets/Search/search_widget.dart';
import '../home_widgets/SelectCategory/select_category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
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
          Column(
            children: [
              HotSalesWidget(),
              BestSellersWidget(),
            ],
          )
        ],
      ),
    );
  }
}
