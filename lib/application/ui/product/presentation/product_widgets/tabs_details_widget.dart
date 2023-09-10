import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/shop_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class TabsDetailsWidget extends StatefulWidget {
  const TabsDetailsWidget({super.key});

  @override
  State<TabsDetailsWidget> createState() => _TabsDetailsWidgetState();
}

class _TabsDetailsWidgetState extends State<TabsDetailsWidget>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Shop',
    ),
    Tab(
      text: 'Details',
    ),
    Tab(
      text: 'Features',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {}
        });

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                child: TabBar(
                  indicatorWeight: 3,
                  indicatorColor: AppColors.selectedColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                  tabs: myTabs,
                  unselectedLabelColor: AppColors.unselectedDetailsColor,
                  labelColor: AppColors.buttonBarColor,
                  labelStyle: TextStyle(
                      fontFamily: 'MarkPronormal700',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
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
