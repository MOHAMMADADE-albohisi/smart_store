// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:smart_store/widgets/seel_all.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  late PageController _mohammad;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mohammad = PageController(viewportFraction: 0.7, initialPage: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mohammad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Smart Stor'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 150),
              child: PageView.builder(
                controller: _mohammad,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int pageIndex) {},
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                    color:
                        index % 2 == 0 ? Colors.black38 : Colors.green.shade200,
                    child: Text('Contaner #$index'),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  // see_all(title: 'Categories', onPressed: () {}),
                  // ConstrainedBox(
                  //   constraints: const BoxConstraints(maxHeight: 140),
                  //   child: GridView.builder(
                  //       itemCount: 10,
                  //       scrollDirection: Axis.horizontal,
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //               mainAxisSpacing: 10,
                  //               crossAxisCount: 1,
                  //               // mainAxisExtent: 100
                  //               childAspectRatio: 140 / 90),
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           color: Colors.black45,
                  //         );
                  //       }),
                  // ),
                  // const SizedBox(height: 20),
                  see_all(title: 'Categories', onPressed: () {}),
                  //رسم شكل شبكي بشكل عمودي
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  see_all(title: 'Offers', onPressed: () {}),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsetsDirectional.only(
                              bottom: index == 5 ? 0 : 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  color: Colors.black38,
                                  blurRadius: 4,
                                )
                              ]),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
