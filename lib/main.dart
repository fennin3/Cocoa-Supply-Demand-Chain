import 'package:cocoa/screens/PC/Provider/app_state.dart';
import 'package:cocoa/screens/PC/screen/landing_page.dart';
import 'package:cocoa/screens/PC/screen/pc_home.dart';
import 'package:cocoa/screens/PC/screen/create_truck_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool loggedIn;


  if(pref.getBool('loggedIn') != null) {
    loggedIn = true;
  } else {
    loggedIn = false;
  }

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<appState>(
            create: (_) => appState())
      ],
      child: MyApp(loggedIn: loggedIn)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.loggedIn}) : super(key: key);

  final bool loggedIn;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Roboto'
      ),
      initialRoute: !loggedIn ? '/': "/pchome",
      routes: {
        '/': (context) => const LandingPage(),
        '/pchome' : (context) => const PCHome(),
        '/createtruckreq': (context) => const CreateTruckRequest()
      },
      builder: EasyLoading.init(),
    );
  }
}

