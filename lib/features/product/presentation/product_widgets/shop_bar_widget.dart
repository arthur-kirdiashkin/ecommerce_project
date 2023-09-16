import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/product_details_phone_widget.dart';
import 'package:ecommerce_project/application/ui/product/presentation/product_widgets/select_property_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../common/svg_icons.dart';

class ShopBarWidget extends StatefulWidget {
  const ShopBarWidget({super.key});

  @override
  State<ShopBarWidget> createState() => _ShopBarWidgetState();
}

class _ShopBarWidgetState extends State<ShopBarWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModelInherited = context.watch<ProductModelInherited>();
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        SizedBox(
          child: groupCharacteristicsIcon,
        ),
        SizedBox(
          height: 29,
        ),
        SelectPropertiesWidget()
      ],
    );
  }
}
