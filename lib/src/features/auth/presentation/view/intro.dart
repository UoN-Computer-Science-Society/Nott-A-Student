import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/login.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/signup.dart';

/* var pagemodel = [
  PageViewModel(
    image: Center(
      child: Image.network(
          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
          height: 175.0),
    ),
    title: 'Welcome to Nott A student (NAS)',
    bodyWidget: const Column(
      children: [
        Text(
            'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
      ],
    ),
  ),
  PageViewModel(
    image: Center(
      child: Image.network(
          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
          height: 175.0),
    ),
    title: 'Dashboard Feature',
    bodyWidget: const Column(
      children: [
        Text(
            'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
      ],
    ),
  ),
  PageViewModel(
    image: Center(
      child: Image.network(
          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
          height: 175.0),
    ),
    title: 'Bus Schedule Feature',
    bodyWidget: const Column(
      children: [
        Text(
            'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
      ],
    ),
  ),
  PageViewModel(
    image: Center(
      child: Image.network(
          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
          height: 175.0),
    ),
    title: 'Timetable feature',
    bodyWidget: const Column(
      children: [
        Text(
            'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
      ],
    ),
  ),
  PageViewModel(
    image: Center(
      child: Image.network(
          "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
          height: 175.0),
    ),
    title: 'You are ready to go!',
    bodyWidget: Column(
      children: [
        const Text(
            'Now you may create an account if you are a new user or log in to your account if you are existing user. '),
        const SizedBox(
          height: 24,
        ),
        InkWell(
          onTap: (() {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Login()),
            );
          }),
          child: Container(
            width: 250,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff005697),
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
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Signup()),
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
]; */

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
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          image: Center(
            child: Image.network(
                "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                height: 175.0),
          ),
          title: 'Welcome to Nott A student (NAS)',
          bodyWidget: const Column(
            children: [
              Text(
                  'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
            ],
          ),
        ),
        PageViewModel(
          image: Center(
            child: Image.network(
                "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                height: 175.0),
          ),
          title: 'Dashboard Feature',
          bodyWidget: const Column(
            children: [
              Text(
                  'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
            ],
          ),
        ),
        PageViewModel(
          image: Center(
            child: Image.network(
                "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                height: 175.0),
          ),
          title: 'Bus Schedule Feature',
          bodyWidget: const Column(
            children: [
              Text(
                  'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
            ],
          ),
        ),
        PageViewModel(
          image: Center(
            child: Image.network(
                "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                height: 175.0),
          ),
          title: 'Timetable feature',
          bodyWidget: const Column(
            children: [
              Text(
                  'This is an all in one application that serve to solve problems of student in University of Nottingham Malaysia. This app is developed by a group of enthusiastic computer science student which come from Computer Science Society.'),
            ],
          ),
        ),
        PageViewModel(
          image: Center(
            child: Image.network(
                "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                height: 175.0),
          ),
          title: 'You are ready to go!',
          bodyWidget: Column(
            children: [
              const Text(
                  'Now you may create an account if you are a new user or log in to your account if you are existing user. '),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                }),
                child: Container(
                  width: 250,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff005697),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => RepositoryProvider(
                              create: (context) => AuthRepository(),
                              child: BlocProvider(
                                create: (context) => LoginCubit(
                                    authRepo: context.read<AuthRepository>()),
                                child: Login(),
                              ),
                            )),
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
                child: Text("Skip",
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
      ),
      controlsMargin: EdgeInsets.all(16),
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
          Text("Back", style: TextStyle(color: Theme.of(context).primaryColor))
        ],
      ),
      next: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Next", style: TextStyle(color: Theme.of(context).primaryColor)),
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
    );
  }
}
