import 'package:cocoa/screens/PC/Components/my_progress_indicator.dart';
import 'package:cocoa/screens/PC/Provider/app_state.dart';
import 'package:cocoa/screens/PC/navbar/dashboard.dart';
import 'package:cocoa/screens/PC/navbar/pc_truck_request.dart';
import 'package:cocoa/screens/PC/navbar/purchase_request.dart';
import 'package:cocoa/screens/PC/navbar/waybills.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PCHome extends StatefulWidget {
  const PCHome({Key? key}) : super(key: key);

  @override
  _PCHomeState createState() => _PCHomeState();
}

class _PCHomeState extends State<PCHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void initData(){
    final _pro = Provider.of<appState>(context, listen: false);
    _pro.getPCDetail();
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screens = [
      PCDashBoard(
        scaKey: _scaffoldKey,
      ),
      const PCPurchaseRequest(),
      const PCTruckRequest(),
      const WayBillNav(),
      Profile()
    ];

    final _pro = Provider.of<appState>(context, listen: true);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedFontSize: 12,
        selectedFontSize: 15,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/img/home.png",
              height: 20,
              width: 20,
              color: _selectedIndex == 0 ? Colors.blue : Colors.black54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/img/purchase.png",
              height: 20,
              width: 20,
              color: _selectedIndex == 1 ? Colors.blue : Colors.black54,
            ),
            label: 'Purchase',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/img/truck.png",
              height: 20,
              width: 20,
              color: _selectedIndex == 2 ? Colors.blue : Colors.black54,
            ),
            label: 'Truck',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/img/truck.png",
              height: 20,
              width: 20,
              color: _selectedIndex == 3 ? Colors.blue : Colors.black54,
            ),
            label: 'Waybill',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/img/user.png",
              height: 20,
              width: 20,
              color: _selectedIndex == 4 ? Colors.blue : Colors.black54,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: appColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: _pro.pcdetail == null ? const Center(child: MyProgressIndicator(),)  :  _screens[_selectedIndex],
      ),
      floatingActionButton: _selectedIndex == 2
          ? FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, "/createtruckreq"),
              child: const Icon(Icons.add),
              backgroundColor: appColor)
          : null,
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children:  [
          SizedBox(height: _size.height * 0.03,),
           Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Material(
                    shadowColor: appColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                    elevation: 5,
                    child: const CircleAvatar(radius: 45, backgroundColor: appColor, child: Center(child: Text("EF", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),),),)),
               const SizedBox(height: 20,),
                Card(
                  color: Colors.teal,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100),
                  child: Column(
                    children: const [
                      Text("Balance", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 3,),
                      Text("GHc 120.00", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 38),
                      child: Column(children: const [
                        Text("GHc 120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text("Withdrawal", style: TextStyle(fontSize: 11, ),),
                        ),
                      ],),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 38),
                      child: Column(children: const [
                        Text("GHc 120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Text("Withdrawal", style: TextStyle(fontSize: 11, ),),
                        ),
                      ],),
                    ),
                  ),
                ],),

                const SizedBox(height: 30,),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    width: _size.width * 0.8,
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
                    child: Column(
                      children: const [
                      ProfileWidget(icon: Icons.tag_outlined ,text: "12324432",),
                      ProfileWidget(icon: Icons.mail,text: "enninfrancis47@gmail.com",),
                      ProfileWidget(icon: Icons.phone,text: "0541752049",),
                      ProfileWidget(icon: Icons.location_on,text: "Sunyani, Fiapre",),
                      ProfileWidget(icon: Icons.business,text: "EF Company, Randy Company, PBC Limited",),
                      ProfileWidget(icon: Icons.inventory,text: "200 Bags (Purchasing Limit)",),

                      ],),
                  ),
                ),

                const SizedBox(height: 30),

                const Text("Ennin Francis",style: TextStyle(fontSize: 12, color: Colors.black38),),
                // const SizedBox(height: 20),

                TextButton(onPressed: (){}, child: Text("Log Out"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.text
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children:  [
              Icon(icon),
              const SizedBox(width: 15,),
              Expanded(
                  child: Text(text, style: const TextStyle(fontSize: 16),))
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/img/login_back.jpg"), fit: BoxFit.cover)
                ),
                  child: const Center(
                    child: Text("PC"),
                  ))),
           ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Log Out"),
            onTap: ()async{
              SharedPreferences pref = await SharedPreferences.getInstance();

              pref.clear();

              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            },
          )
        ],
      ),
    );
  }
}
