import 'package:educare_erp/core/network/apiHelper/locator.dart';
import 'package:educare_erp/core/services/routeGenerator/route_generator.dart';
import 'package:educare_erp/features/test/screens/test_screen.dart';
import 'package:educare_erp/features/test/testAddressBlock/address_block.dart';
import 'package:educare_erp/features/test/testBlock/testBloc_bloc.dart';
import 'package:educare_erp/features/test/testRepository/test_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestBloc>(create: (context)=>TestBloc(getIt<TestUseCases>())),
        BlocProvider<AddressBloc>(create: (context)=>AddressBloc(getIt<TestUseCases>())),

      ],
      child: MaterialApp(
        title: 'Educare ERP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: RouteGenerator.navigatorKey,
        initialRoute: RouteGenerator.kSplash,
        onGenerateRoute: RouteGenerator.generateRoute,
        //home: const TestScreen(),
      ),
    );
  }
}


