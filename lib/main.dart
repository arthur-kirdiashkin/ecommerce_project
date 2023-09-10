import 'package:ecommerce_project/application/ui/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_project/application/ui/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/ui/cart/domain/repositories/cart_repository.dart';
import 'application/ui/cart/presentation/bloc/cart_event.dart';
import 'application/ui/home/domain/repositories/home_repository.dart';
import 'application/ui/home/presentation/bloc/phone_bloc.dart';
import 'application/ui/home/presentation/home_widgets/home_bottom_bar_widget.dart';
import 'package:ecommerce_project/locator_service.dart' as di;

import 'application/ui/product/domain/repositories/one_phone_repository.dart';
import 'application/ui/product/presentation/bloc/product_bloc.dart';
import 'application/ui/product/presentation/bloc/product_event.dart';
// C:\vovan_arthur\ecommerce_project\ecommerce_project\lib\locator_service.dart;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _cartRepository = CartRepository();
    final _onePhoneRepository = OnePhoneRepository();
    final _phoneRepository = PhoneRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(_cartRepository)..add(CartLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(_onePhoneRepository)..add(ProductLoadEvent()),
        ),
        BlocProvider(
          create: (context) =>
              PhoneBloc(_phoneRepository)..add(LoadPhoneEvent()),
        )
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        home: HomeBottomBarWidget(),
      ),
    );
  }
}
