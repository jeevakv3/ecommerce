import 'allpackages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TrabslationService(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: ProductDetails(),
    );
  }
}
