import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sary_assessment_app/functions/crud.dart';
import 'package:sary_assessment_app/model/item.dart';
import 'package:sary_assessment_app/screens/transactions.dart';

late Box itemBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); //init  Hive

  Hive.registerAdapter(ItemAdapter());
  itemBox = await Hive.openBox<Item>('itemBox');
  // Hive.registerAdapter(TransacionsA)
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CRUD())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sary Demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const Transactions());
  }
}
