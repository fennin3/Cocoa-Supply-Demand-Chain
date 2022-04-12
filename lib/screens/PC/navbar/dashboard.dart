import 'package:cocoa/models/abc.dart';
import 'package:cocoa/screens/PC/Components/chart_data.dart';
import 'package:cocoa/screens/PC/Provider/app_state.dart';
import 'package:cocoa/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';



class PCDashBoard extends StatelessWidget {
  const PCDashBoard({Key? key, required this.scaKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaKey;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final pro = Provider.of<appState>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, right: _size.width * paddingHorizontal, left: _size.width * paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dashboard", style: pcDashBoardtext.copyWith(color: Colors.black),),
              GestureDetector(
                onTap: ()=> scaKey.currentState!.openDrawer(),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
                    child: Text("${pro.pcdetail!.firstName}", style: pcMenuname,),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: _size.height < 800 ? 30 : _size.height * 0.04,),
          DashBoardGrid(size: _size),
          SizedBox(height: _size.height < 800 ? 30 : _size.height * 0.04,),
          const Text("Sale Records", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
          SizedBox(height: _size.height < 800 ? 13 : _size.height * 0.018,),
          Expanded(
            child: charts.LineChart(_getSeriesData(), animate: true,),
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
  _getSeriesData() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesData series, _) => series.year,
          measureFn: (SalesData series, _) => series.sales,
          colorFn: (SalesData series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }
}

class DashBoardGrid extends StatelessWidget {
  const DashBoardGrid({
    Key? key,
    required Size size,
  }) : _size = size, super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: _size.width > 700 ? 4: _size.width > 600 ? 3:2,
    childAspectRatio: 3/2.2,
    shrinkWrap: true,
    crossAxisSpacing: 14,
    mainAxisSpacing: 14,
    children: const [
       DashBoardWidget(image: "assets/img/sales.png",text: "Total Purchases",),
       DashBoardWidget(image: "assets/img/sales.png",text: "Total Purchases",),
       DashBoardWidget(image: "assets/img/sales.png",text: "Total Purchases",),
       DashBoardWidget(image: "assets/img/sales.png",text: "Total Purchases",),
    ],

    );
  }
}

class DashBoardWidget extends StatelessWidget {
  const DashBoardWidget({
    Key? key,
    this.image,
    this.text
  }) : super(key: key);
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:   [
           CircleAvatar(radius: 17,backgroundColor: Colors.white,
          backgroundImage: AssetImage(image!),

          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text("Ghc 123434", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Text(text!, style: const TextStyle(fontSize: 10),),
            ],
          ),
          const Text("Tap view", style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }
}


