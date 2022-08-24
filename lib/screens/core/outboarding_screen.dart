import 'package:flutter/material.dart';
import 'package:smart_store/widgets/OnBordaingContent.dart';
import 'package:smart_store/widgets/pageView.dart';

class onbressd_screen extends StatefulWidget {
  const onbressd_screen({Key? key}) : super(key: key);

  @override
  State<onbressd_screen> createState() => _onbressd_screenState();
}
class _onbressd_screenState extends State<onbressd_screen> {
  late PageController _page;
  int _pages = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _page = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _page.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C7580),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _pages < 2,
                replacement: TextButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: const Text('START'),
                ),
                child: TextButton(
                  onPressed: () {
                    _page.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: const Text('SKIP'),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),

                controller: _page,
                onPageChanged: (int pages) {
                  setState(() => {
                    _pages = pages,
                  });
                },
                children: const [
                  OnBordaingContent(
                    image: 'image_4',
                    title: 'Welcome !',
                    subtitle:
                    'Now were up in the big leageuse gettingour turn at bat. The Brady Bunch that\'s the we Bardy Bunch',

                  ),
                  OnBordaingContent(
                    image: 'image_2',
                    subtitle:
                    'Now were up in the big leageuse gettingour turn at bat. The Brady Bunch that\'s the we Bardy Bunch',
                    title: 'Add to cart',
                  ),
                  OnBordaingContent(
                    image: 'image_3',
                    title: 'Enjoy Purchase !',
                    subtitle:
                    'Now were up in the big leageuse gettingour turn at bat. The Brady Bunch that\'s the we Bardy Bunch',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageView(marginEnd: 15, colors: _pages == 0),
                pageView(marginEnd: 15, colors: _pages == 1),
                pageView(colors: _pages == 2),
              ],
            ),
            const SizedBox(
                height: 30
            ),
            const SizedBox(height: 25,),
            Visibility(
              visible: _pages == 2,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const[
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0,3),
                          blurRadius: 6
                      )
                    ],
                    gradient: const LinearGradient(
                        colors:[
                          Color(0xFFA6D1E6),
                          Color(0xFF003865),
                        ]
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/homelogin_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text('START'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

          ],
        ),
      ),
    );
  }
}


