import 'package:flutter/material.dart';
import 'package:mvvm_ecommerce/app/app.dart';
import 'package:mvvm_ecommerce/app/di.dart';


import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}