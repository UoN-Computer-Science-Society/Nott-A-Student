import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool showSkipButton = true;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: IntroductionScreen(
        bodyPadding: const EdgeInsets.only(top: 25),
        key: introKey,
        pages: [
          PageViewModel(
            titleWidget: const Text('Welcome to Nott-A-Student',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3F3F),
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                      'lib/src/utils/resources/intro/intro_start.svg'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                        'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.')),
              ],
            ),
          ),
          PageViewModel(
            titleWidget: const Text('News Feature',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3F3F),
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                      'lib/src/utils/resources/intro/intro_news.svg'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                        'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.')),
              ],
            ),
          ),
          PageViewModel(
            titleWidget: const Text('Bus Schedule Feature',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3F3F),
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                      'lib/src/utils/resources/intro/intro_bus.svg'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                        'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.')),
              ],
            ),
          ),
          PageViewModel(
            titleWidget: const Text('Timetable Feature',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3F3F),
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                      'lib/src/utils/resources/intro/intro_timetable.svg'),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                        'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.')),
              ],
            ),
          ),
          PageViewModel(
            image: Center(
              child: SvgPicture.asset(
                  'lib/src/utils/resources/intro/intro_end.svg'),
            ),
            titleWidget: const Text('You are ready to go!',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF3F3F3F),
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            bodyWidget: Column(
              children: [
                const Text(
                    'Now you may create an account if you are a new user or log in to your account if you are existing user. '),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.of(context).pushNamed(
                      '/signup',
                    );
                  }),
                  child: Container(
                    width: 250,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff005697),
                    ),
                    child: const Center(
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (() {
                    Navigator.of(context).pushNamed(
                      '/login',
                    );
                  }),
                  child: Container(
                    width: 250,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "I already have an account",
                        style: TextStyle(
                          color: Color(0xff005697),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        globalHeader: Visibility(
          visible: showSkipButton,
          child: Container(
            padding: const EdgeInsets.only(right: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("Skip >>",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onPressed: () {
                    /* Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Login()),
                  ); */
                    /*       setState(() {
                    showSkipButton = false;
                  }); */
                    introKey.currentState?.skipToEnd();
                  },
                )
              ],
            ),
          ),
        ),
        dotsDecorator: DotsDecorator(
            activeColor: Theme.of(context).primaryColor,
            spacing: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.02)),
        controlsMargin: const EdgeInsets.all(16),
        showNextButton: true,
        showBackButton: true,
        showDoneButton: false,
        back: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
            Text("Back",
                style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        ),
        next: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            Icon(
              Icons.arrow_forward,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
        onChange: (page) {
          setState(() {
            currentPageIndex = page;
          });
          //need to change the below number if the total number of page change
          //the number can be calculate by number = total page - 1
          if (currentPageIndex == 4) {
            showSkipButton = false;
          } else {
            showSkipButton = true;
          }
        },
      ),
    );
  }
}
