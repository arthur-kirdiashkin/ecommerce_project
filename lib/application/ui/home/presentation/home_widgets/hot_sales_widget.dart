import 'package:ecommerce_project/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/repositories/home_repository.dart';
import '../bloc/phone_bloc.dart';
import 'hot_sales_example_provider_widget.dart';

class HotSalesWidget extends StatefulWidget {
  const HotSalesWidget({super.key});
  @override
  State<HotSalesWidget> createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  // final _phoneRepository = PhoneRepository();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  'Hot Sales',
                  style: TextStyle(
                      fontFamily: 'MarkProbold',
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: AppColors.buttonBarColor),
                ),
              ),
              SizedBox(
                width: 180,
              ),
              Text(
                'see more',
                style: TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.selectedColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),

        // Consumer<PhoneModelInherited>(
        //   builder: (BuildContext context, phoneModelInherited, _) {
        //     context.read<PhoneModelInherited>().loadPhone();
        //     return HotSalesExampleWidget();
        //    }
        // ),
        HotSalesExampleWidget()
      ],
    );
  }
}
