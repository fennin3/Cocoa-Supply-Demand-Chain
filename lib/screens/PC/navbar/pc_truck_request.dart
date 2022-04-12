import 'package:cocoa/screens/PC/Components/truck_request.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';

class PCTruckRequest extends StatelessWidget {
  const PCTruckRequest({Key? key}) : super(key: key);

  void viewRequestDetail(context){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
      return Dialog(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 10),
              child: Text("Truck Request Detail", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            ),

            Expanded(child:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children:  [


                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Status", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                        Card(
                          color: Colors.green,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Approved", style: TextStyle(color: Colors.white),),
                          ),)
                      ],),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Date Requested", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          Text("21st April 2022", style: TextStyle(fontSize: 14),),
                        ],),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("District Office", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          SizedBox(width: 10,),
                          Expanded(child: Text("Bono District Office", textAlign: TextAlign.end, style: TextStyle(fontSize: 14),)),
                        ],),
                    ),
                    const Divider(),

                    // const Padding(padding: EdgeInsets.symmetric(vertical: 20),
                    // child: Text("Pending Approval"),
                    // )

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Date Approved", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          Text("21st April 2022", style: TextStyle(fontSize: 14),),
                        ],),
                    ),
                    const Divider(),

                    SizedBox(height: 20,),

                    const Text("Driver & Truck Info", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Pickup Date", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          Text("21st April 2022", style: TextStyle(fontSize: 14),),
                        ],),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Driver Name", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          SizedBox(width: 10,),
                          Expanded(child: Text("Kwasi Mensah Jnr", textAlign: TextAlign.end, style: TextStyle(fontSize: 14),)),
                        ],),
                    ),
                    const Divider(),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Truck", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          SizedBox(width: 10,),
                          Expanded(child: Text("Mercedes Benz", textAlign: TextAlign.end, style: TextStyle(fontSize: 14),)),
                        ],),
                    ),
                    const Divider(),


                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  const [
                          Text("Truck Number", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                          SizedBox(width: 10,),
                          Expanded(child: Text("GW-12343", textAlign: TextAlign.end, style: TextStyle(fontSize: 14),)),
                        ],),
                    ),
                    const Divider(),


                    const Padding(
                      padding:  EdgeInsets.only(top: 10.0, bottom: 10),
                      child:  Text("Note from District Office", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),),
                    ),

                    const Padding(
                      padding:  EdgeInsets.only(bottom: 30.0),
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15),),
                    )

                  ],
                ),
              ),
            ),

            ),
             Padding(
               padding: const EdgeInsets.only(bottom: 10.0),
               child: TextButton(
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(appColor)),
                   onPressed: ()=>Navigator.of(context).pop(), child: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                     child: Text("OK", style: TextStyle(color: Colors.white),),
                   )),
             )
          ],
        ),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: double.infinity,
              height: _size.height * 0.1,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: _size.height < 800 ? 20 : _size.height * 0.025,
                  right: _size.width * paddingHorizontal,
                  left: _size.width * paddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Truck Request",
                    style: pcDashBoardtext,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 3),
                      child: Icon(Icons.menu, color: Colors.white,),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
        Expanded(child: GridView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
              right: _size.width * 0.04, left: _size.width * 0.04, bottom: 20, top: 20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 100,
              // childAspectRatio: 2.5 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: ()=>viewRequestDetail(context),
                child: TruckRequest(index: index));
          },
        ))
      ],
    );
  }
}
