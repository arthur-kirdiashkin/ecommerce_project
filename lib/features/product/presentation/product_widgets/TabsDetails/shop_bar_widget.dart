import 'package:flutter/material.dart';
import '../../../../../../common/svg_icons.dart';
import 'select_property_widget.dart';

class ShopBarWidget extends StatefulWidget {
  const ShopBarWidget({super.key});

  @override
  State<ShopBarWidget> createState() => _ShopBarWidgetState();
}

class _ShopBarWidgetState extends State<ShopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         const SizedBox(
          height: 30,
        ),
        SizedBox(
          child: groupCharacteristicsIcon,
        ),
        const SizedBox(
          height: 29,
        ),
        const SelectPropertiesWidget()
      ],
    );
  }
}
