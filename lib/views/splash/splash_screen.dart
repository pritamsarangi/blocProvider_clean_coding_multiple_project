import 'package:blocprovider_clean_coding/config/components/loading_widget.dart';
import 'package:blocprovider_clean_coding/config/components/round_button.dart';
import 'package:blocprovider_clean_coding/config/routes/routes_name.dart';
import 'package:blocprovider_clean_coding/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
      ),
    );
  }
}
