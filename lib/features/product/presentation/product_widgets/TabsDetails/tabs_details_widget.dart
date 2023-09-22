import 'package:ecommerce_project/features/product/presentation/product_widgets/TabsDetails/shop_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../common/themes/app_colors.dart';

class TabsDetailsWidget extends StatefulWidget {
  const TabsDetailsWidget({super.key});

  @override
  State<TabsDetailsWidget> createState() => _TabsDetailsWidgetState();
}

class _TabsDetailsWidgetState extends State<TabsDetailsWidget>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Shop',
    ),
    const Tab(
      text: 'Details',
    ),
    const Tab(
      text: 'Features',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Builder(builder: (BuildContext context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: TabBar(
                indicatorWeight: 3,
                indicatorColor: AppColors.selectedColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 22),
                tabs: myTabs,
                unselectedLabelColor: AppColors.unselectedDetailsColor,
                labelColor: AppColors.buttonBarColor,
                labelStyle: const TextStyle(
                    fontFamily: 'MarkPronormal700',
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ShopBarWidget(),
                  Center(child: Text('Details')),
                  Center(child: Text('Features')),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
