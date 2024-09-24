import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1C3064),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 84,
          vertical: 42,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 124),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/src/utils/resources/nas_logo.png',
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                )),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 138,
                width: 163,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Made with ❤️",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Image.asset('lib/src/utils/resources/CSS_dark.png',
                        height: 130,
                        width: 163,
                        alignment: Alignment.bottomCenter)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
