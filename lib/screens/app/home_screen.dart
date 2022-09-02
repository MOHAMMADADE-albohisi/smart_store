// ignore_for_file: camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
    pageController = PageController(viewportFraction: 0.7, initialPage: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBCBDBF),
      body: Padding(
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
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFEBF0F7),
                                  ),
                                  child: Image.asset(
                                    'images/image_20.png',
                                  ),
                                ));
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
                          constraints: const BoxConstraints(maxHeight: 158),
                          child: GridView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 17.8,
                              crossAxisCount: 1,
                              childAspectRatio: 158 / 158,
                            ),
                            itemBuilder: (context, index) {
                              return TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/subcategories_screen');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFEBF0F7),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28.4),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Image.asset('images/image_20.png'),
                                          const SizedBox(height: 8),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .namecategory,
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF192F39),
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
                            Navigator.pushNamed(context, '/categories_screen');
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
                                                  '/categories_screen');
                                            },
                                            child: Image.asset(
                                              'images/image_20.png',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                '239.96\$',
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
                                                  setState(
                                                      () => {_likes = !_likes});
                                                },
                                                icon: Icon(
                                                  color: Colors.red,
                                                  _likes
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'Samsung Galaxy',
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
                            ],
                          ),
                        ),
                      )),
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
                          constraints: const BoxConstraints(maxHeight: 158),
                          child: GridView.builder(
                            itemCount: 4,
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
                                          Navigator.pushNamed(
                                              context, '/categories_screen');
                                        },
                                        child: Image.asset(
                                          'images/image_20.png',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            '239.96\$',
                                            style: GoogleFonts.montserrat(
                                              color: const Color(0xFF5882F2),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              setState(() => {
                                                    _likeproduct = !_likeproduct
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
                                      'Samsung Galaxy',
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
                            //
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
      ),
    );
  }
}
