import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class favorite_screen extends StatefulWidget {
  const favorite_screen({Key? key}) : super(key: key);

  @override
  State<favorite_screen> createState() => _favorite_screenState();
}

class _favorite_screenState extends State<favorite_screen> {
  bool _likeproduct = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite'),),
      body: ListView(
        children: [
          SizedBox(height: 20),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      height: 120,
                      child: Image.asset(
                        'images/image_13.png',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              setState(() => {_likeproduct = !_likeproduct});
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

        ],
      ),
    );
  }
}
