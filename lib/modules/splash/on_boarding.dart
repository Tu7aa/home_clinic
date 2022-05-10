import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:homeclinic/modules/auth/login/login_screen.dart';
import 'package:homeclinic/shared/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardModel
{
  final String image;
  final String title;
  final String body;

  BoardModel(this.image, this.title, this.body);
}

class OnBoardScreen extends StatefulWidget
{
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
{
  List<BoardModel>? list;

  @override
  void initState()
  {
    super.initState();

    list =
    [
      BoardModel(
        'assets/image/onboard 1.png',
        'Quality reputation',
        'The team of reputable doctors has many years \n of professional experience.',
      ),
      BoardModel(
        'assets/image/onboard 2.png',
        'Online health check',
        'Easy and convenient online check-ups right from your home.',
      ),
      BoardModel(
        'assets/image/onboard 3.png',
        'Accurate Diagnosis',
        'Ensure the most accurate results for the health of you and your family.',
      ),
    ];
  }

  var isLast = false;
  final controller = PageController();

  void submit()
  {
    defaultFinishNavigate(screen: LoginScreen(),
        context: context
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (i)
                {
                  if (i == (list!.length - 1) && !isLast)
                    setState(() => isLast = true);
                  else if (isLast) setState(() => isLast = false);
                },
                controller: controller,
                itemCount: list!.length,
                itemBuilder: (ctx, i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                        image: AssetImage(
                          list![i].image,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      list![i].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: HexColor('#262c3d'),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      list![i].body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: HexColor('#747f9e'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmoothPageIndicator(
                  controller: controller,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: HexColor('#23b2ff'),
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: list!.length,
                ),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if (isLast)
                    {
                      submit();
                    } else
                      controller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}