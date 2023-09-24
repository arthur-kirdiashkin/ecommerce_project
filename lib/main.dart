import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_project/locator_service.dart' as di;
import 'core/blocs/bloc_observer.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/cart/presentation/bloc/cart_event.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/home_widgets/BottomBar/home_bottom_bar_widget.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';
import 'common/themes/app_theme.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
            create: (context) => sl<CartBloc>()..add(CartLoadEvent())),
        BlocProvider<ProductBloc>(
          create: (context) => sl<ProductBloc>()..add(ProductLoadEvent())),
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>()..add(HomeLoadEvent())),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        home: const HomeBottomBarWidget(),
      ),
    );
  }
}
