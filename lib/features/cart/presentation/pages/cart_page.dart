import 'package:flutter/material.dart';
import '../../../../common/themes/app_colors.dart';
import '../cart_widgets/AddAdress/add_adress.dart';
import '../cart_widgets/CartProduct/cart_product.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            AddAdressWidget(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(left: 42),
              child: Text(
                'My Cart',
                style: TextStyle(
                    fontFamily: 'MarkPronormal800',
                    color: AppColors.buttonBarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            CartProductWidget()
          ],
        ),
      ),
    );
  }
}
