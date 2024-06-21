import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_garant/future/di/di.dart' as sl;
import 'package:test_garant/future/di/di.dart';
import 'package:test_garant/future/presentation/main/main_menu.dart';
import 'package:test_garant/future/presentation/test_yechish/bloc/test_bloc.dart';
import 'package:test_garant/future/presentation/test_yechish/pages/test_yechish.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<TestBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
