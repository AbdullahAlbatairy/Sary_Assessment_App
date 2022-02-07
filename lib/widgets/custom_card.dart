import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  //General Variables (all screens)
  final String screenCard; // t = transaction, i = item, d = details
  final String name;
  final String sku;
  final String desc;
  final double price;

  //Special variables

  //Transaction and detail Screens
  final bool? isStock;

  //Item Screen
  final bool? isDisc;

  //detail Screen
  final int? qt; //quantity

  const CustomCard(
    Key? key,
    this.screenCard,
    this.name,
    this.sku,
    this.desc,
    this.price, {
    this.isStock,
    this.isDisc,
    this.qt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenCard == "t"
        ? transactionCard()
        : screenCard == "i"
            ? itemCard()
            : detailCard(context);
  }

  Widget transactionCard() {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    sku,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$price SR",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      isStock == true
                          ? const Text(
                              "Stock in",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              "Stock out",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                      isStock == true
                          ? const Icon(
                              CommunityMaterialIcons
                                  .arrow_down_thin_circle_outline,
                              color: Colors.green,
                            )
                          : const Icon(
                              CommunityMaterialIcons
                                  .arrow_up_thin_circle_outline,
                              color: Colors.red,
                            )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                ],
              ),
            )
          ],
        ));
  }

  Widget itemCard() {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const Image(
              image: NetworkImage(
                  "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    sku,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    desc,
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$price SR",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget detailCard(context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3),
      child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Image(
                      image: NetworkImage(
                          "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            sku,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            desc,
                            style: const TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("25",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Quantity")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$price SR",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price"),
                      ],
                    ),
                    // isStock == true
                    //     ? const Text(
                    //         "Stock in",
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       )
                    //     : const Text(
                    //         "Stock out",
                    //         style: TextStyle(fontWeight: FontWeight.bold),
                    //       ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // isStock == true
                    //     ? const Icon(
                    //         CommunityMaterialIcons.arrow_down_thin_circle_outline,
                    //         color: Colors.green,
                    //       )
                    //     : const Icon(
                    //         CommunityMaterialIcons.arrow_up_thin_circle_outline,
                    //         color: Colors.red,
                    //       ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Stock in  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      WidgetSpan(
                          child: Icon(
                        CommunityMaterialIcons.arrow_down_thin_circle_outline,
                        color: Colors.green,
                      ))
                    ]))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Inbound"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("20/01/2022",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Date"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Inbound",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("7:00 AM",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Time"),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Outbound"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("20/01/2022",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Date"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Outbound",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("7:00 AM",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Time"),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
