import 'package:animations/animations.dart';
import 'package:cocoa/screens/PC/Components/p_request_widget.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';

class PCPurchaseRequest extends StatelessWidget {
  const PCPurchaseRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: double.infinity,
                  height: _size.height * 0.15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: _size.height < 800 ? 20 : _size.height * 0.025,
                      right: _size.width * paddingHorizontal,
                      left: _size.width * paddingHorizontal),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Purchase Requests",
                            style: pcDashBoardtext,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 3),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: _size.height < 800 ? 30 : _size.height * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(
                    right: _size.width * 0.04,
                    left: _size.width * 0.04,
                    bottom: 20,
                    top: 40),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisExtent: 100,
                    // childAspectRatio: 2.5 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 40,
                itemBuilder: (BuildContext context, int index) {
                  return OpenContainer(closedBuilder: (context, some) {
                    return PurchaseRequestWidget(
                      index: index,
                    );
                  }, openBuilder: (context, some) {
                    return PRDetailPage(size: _size);
                  });
                },
              ),
            ))
          ],
        ),
        Positioned(
          top: _size.height * 0.1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: _size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    PRStatWidget(
                      text1: "421",
                      text2: "Total",
                    ),
                    PRStatWidget(
                      text1: "200",
                      text2: "Paid",
                    ),
                    PRStatWidget(
                      text1: "10",
                      text2: "Pending",
                    ),
                    PRStatWidget(
                      text1: "50",
                      text2: "Cancelled",
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PRStatWidget extends StatelessWidget {
  const PRStatWidget({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 11, color: Colors.black26),
        )
      ],
    );
  }
}

class PRDetailPage extends StatefulWidget {
  const PRDetailPage({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  _PRDetailPageState createState() => _PRDetailPageState();
}

class _PRDetailPageState extends State<PRDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1.2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.size.width * paddingHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.green.shade400,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
                    child: Text(
                      "Paid",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "200 Bags & 15 kg",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "GHc 1200",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1.1,
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Card(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                        "assets/img/lbc.png",
                        color: appColor,
                      ),
                    ),
                  ),
                  title: const Text(
                    "EF Company",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("District One Name"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.person,
                        color: appColor,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Ennin Francis Farmer",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Location"),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: appColor,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Ennin Francis Farmer",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text("Location"),
                ),
                const Divider(
                  thickness: 1.1,
                ),
                const SizedBox(height: 10,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Cost Of 1 Bag:", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                    SizedBox(width: 10,),
                    Text("Ghc 120", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                      onPressed: () {}, child: const Padding(
                        padding:  EdgeInsets.all(5),
                        child:  Text("Cancel", style: TextStyle(color: Colors.white),),
                      )),
                  const SizedBox(width: 10,),
                  TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appColor)),
                      onPressed: () {},
                      child: const Padding(
                        padding:  EdgeInsets.all(5),
                        child: Text("Process Payment", style: TextStyle(color: Colors.white),),
                      )),
                ],
              ),
              const SizedBox(height: 20,)
            ],
          ))
        ],
      ),
    );
  }
}
