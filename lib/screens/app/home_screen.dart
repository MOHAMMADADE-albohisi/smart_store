// ignore_for_file: camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/api/home_controller.dart';
import 'package:smart_store/api/home_getx_controoler.dart';
import 'package:smart_store/model_api/ImagePath.dart';
import 'package:smart_store/widgets/seel_all.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  late PageController pageController;
  bool _likes = false;
  late bool _likeproduct = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageViewController = PageController(initialPage: 5);
    ProductsApiController().getHomeData();
    pageController = PageController(viewportFraction: 0.7, initialPage: 2);
  }

  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    _pageViewController.dispose();

    super.dispose();
  }

  late PageController _pageViewController;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBCBDBF),
      body: GetBuilder<HomeGetController>(
        init: HomeGetController(),
        builder: (controller) {
          var home = controller.home;
          if (home != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 150),
                          child: CarouselSlider(
                            options: CarouselOptions(height: 400.0),
                            items: [home.slider.length].map((index) {
                              print('sliders count ${home.slider.length}');
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFFEBF0F7),
                                      ),
                                      child: Image.network(
                                        home.slider[index].imageUrl,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          width: 327.w,
                          height: 260.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 13.h),
                                child: Text(
                                  AppLocalizations.of(context)!.category,
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: const Color(0xFF36596A),
                                  ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 158),
                                child: GridView.builder(
                                  itemCount: home.latestProducts.length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 17.8,
                                    crossAxisCount: 1,
                                    childAspectRatio: 158 / 158,
                                  ),
                                  itemBuilder: (context, index) {
                                    // var category = data.elementAt(index);
                                    return TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/subcategories_screen');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xFFEBF0F7),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 28.4),
                                            child: Column(
                                              children: [
                                                const SizedBox(height: 10),
                                                Image.network(home
                                                    .categories[index]
                                                    .imageUrl),
                                                const SizedBox(height: 8),
                                                Text(
                                                  home.categories[index].nameAr,
                                                  style: GoogleFonts.nunitoSans(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        const Color(0xFF192F39),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/categories_screen');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize: const Size(
                                    double.infinity,
                                    25,
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.see_all,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF192F39)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 327.w,
                          height: 338.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  see_all(
                                      title: AppLocalizations.of(context)!
                                          .latestproducts,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/categories_screen');
                                      }),
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: home.latestProducts.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEBF0F7),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              height: 80,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      '/categories_screen');
                                                },
                                                child: Image.network(
                                                  home.latestProducts[index]
                                                      .imageUrl,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    home.latestProducts[index]
                                                        .price,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color: const Color(
                                                          0xFF5882F2),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() =>
                                                          {_likes = !_likes});
                                                    },
                                                    icon: Icon(
                                                      color: Colors.red,
                                                      _likes
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              home.latestProducts[index].nameAr,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF140F26),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 327.w,
                          height: 260.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13.w, vertical: 13.h),
                                child: Text(
                                  AppLocalizations.of(context)!.maylike,
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: const Color(0xFF36596A),
                                  ),
                                ),
                              ),
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxHeight: 158),
                                child: GridView.builder(
                                  itemCount: home.latestProducts.length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 17.8,
                                    crossAxisCount: 1,
                                    childAspectRatio: 158 / 158,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEBF0F7),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 80,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    '/favorite_screen');
                                              },
                                              child: Image.network(
                                                home.latestProducts[index]
                                                    .imageUrl,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${home.latestProducts[index].price}\$',
                                                  style: GoogleFonts.montserrat(
                                                    color:
                                                        const Color(0xFF5882F2),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() => {
                                                          _likeproduct =
                                                              !_likeproduct
                                                        });
                                                  },
                                                  icon: Icon(
                                                    color: Colors.red,
                                                    _likeproduct
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            home.latestProducts[index].nameAr,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF140F26),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/favorite_screen');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize: const Size(
                                    double.infinity,
                                    25,
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.see_all,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF192F39)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
                child: Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ));
          }
        },
      ),
    );
  }
}
