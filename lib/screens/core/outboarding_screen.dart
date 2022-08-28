import 'package:flutter/material.dart';
import 'package:smart_store/widgets/OnBordaingContent.dart';

class onbressd_screen extends StatefulWidget {
  const onbressd_screen({Key? key}) : super(key: key);

  @override
  State<onbressd_screen> createState() => _onbressd_screenState();
}

class _onbressd_screenState extends State<onbressd_screen> {
  late PageController _page;
  int _pages = 0;
  int _pageskip = 0;

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _page,
                onPageChanged: (int _pagekip) {
                  setState(() => {
                        _pageskip = _pagekip,
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
                TabPageSelectorIndicator(
                  backgroundColor: _pageskip == 0 ? Colors.blue : Colors.grey,
                  borderColor: _pageskip == 0 ? Colors.orange : Colors.transparent,
                  size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor: _pageskip == 1 ? Colors.blue : Colors.grey,
                  borderColor: _pageskip == 1 ?  Colors.orange  : Colors.transparent,
                  size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor: _pageskip == 2 ? Colors.blue : Colors.grey,
                  borderColor: _pageskip == 2 ?  Colors.orange  : Colors.transparent,
                  size: 10,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
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
                  Spacer(),
                  Visibility(
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/homelogin_screen');
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
                ],
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
