import 'package:flutter/material.dart';

class TruckRequest extends StatelessWidget {
  const TruckRequest({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 5,
      child: Container(
        padding:
            const EdgeInsets.only(right: 12, top: 12, left: 15, bottom: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Truck Arrival: Pending",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      letterSpacing: 1.2),
                ),
                const Expanded(child: SizedBox()),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: index % 2 == 0 ? Colors.green : Colors.blue,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  index % 2 == 0 ? "Accepted" : "Pending",
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                      letterSpacing: 1.2),
                )
              ],
            ),
            RichText(
                text: const TextSpan(
                    text: "District Office: ",
                    children: [
                      TextSpan(
                          text: " Bono District Office",
                          style: TextStyle(fontSize: 15, color: Colors.black))
                    ],
                    style: TextStyle(fontSize: 11, color: Colors.black38))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "LBC: ",
                        children: [
                          TextSpan(
                              text: " EF Company",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black))
                        ],
                        style: TextStyle(fontSize: 11, color: Colors.black38))),
                const Text(
                  "20th April, 2022",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
