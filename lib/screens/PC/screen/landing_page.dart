import 'dart:convert';
import 'package:cocoa/my_functions.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}


class _LandingPageState extends State<LandingPage> {
  int index = 1;
  final TextEditingController _userId = TextEditingController();
  bool _visible = false;


  void _logInPC(index)async{
    EasyLoading.show(status: "Processing...",);
  http.Response? response =  await MyFunc.login(type: index ==1?'pc':index ==2?'fm':"tr", userId: _userId.text, context: context);
  EasyLoading.dismiss();

  if(response!.statusCode ==404){
    MyFunc.showSnack(context: context, message: "Account not found");
  }
  else if(response.statusCode == 200){
    MyFunc.showSnack(context: context, message: "Login Successful");
    final data = json.decode(response.body);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('loggedIn', true);
    print(data);
    sharedPreferences.setStringList('data', [data['pc']['id'].toString(), data['pc']['pcId']]);
    Navigator.pushNamed(context, "/pchome");
  }
  }

  void setVisibility(){
    Future.delayed(const Duration(milliseconds: 1600)).then((value){
      setState(() {
        _visible = true;
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setVisibility();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[70],
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/img/login_back.jpg"), fit: BoxFit.cover)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  SizedBox(
                    height: _size.height * 0.05,
                  ),
                  const Center(
                      child: Text(
                        "Welcome To CDS APP",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
                      )),
                  SizedBox(
                    height: _size.height * 0.04,
                  ),
                  Center(
                    child: Container(
                        width: _size.width > 500 ? 500 : 320,
                        child: const Text(
                          "Lorem Ipsum has been the industry's standard galley of type and scrambled it to make a type specimen book.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w600, color: Colors.white),
                        )),
                  ),
                ],),

                SizedBox(height: _size.height * 0.3,),

                Column(children: [
                  AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                    width: _size.width > 500 ? 500 : 300,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _userId,
                      cursorColor: Colors.white,
                      style: const TextStyle(fontSize: 18, letterSpacing: 2, color: Colors.white),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),

                        labelText: "Enter your ID",
                        labelStyle: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                ),
                  ),

                  SizedBox(height: _size.height * 0.03,),

                  AnimatedOpacity(
                    // curve: Curves.easeInCubic,
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: InkWell(
                      onTap: ()=>_logInPC(index),
                      child: Card(
                        elevation: 10,
                        color: appColor,
                        child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Container(
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("Login", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                                  Icon(Icons.login, color: Colors.white,),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                  )],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class LoginOptionWidget extends StatelessWidget {
  final Size size;
  final String text;
  final String img;
  final Color color;
  final bool selected;

  LoginOptionWidget(
      {required this.size,
      required this.text,
      required this.img,
      required this.color,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Card(
        elevation: 7,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    const Text(
                      "I am a",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                img,
                height: size.height * 0.15,
                width: size.width * 0.3,
              ),
              if (selected)
                SizedBox(
                  height: size.height * 0.045,
                )
            ],
          ),
        ),
      ),
    );
  }
}
