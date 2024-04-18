import 'package:flutter/material.dart';
import 'package:poem/screens/login_page.dart';
import 'package:poem/screens/sign_up_page.dart';
import 'package:poem/widgets/custom_button.dart';
import 'package:poem/widgets/custom_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomWidget(
        child: _welcomeColumn(),
      ),
    );
  }

  Column _welcomeColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller!.view,
                  builder: (_builderContext, _child) {
                    return Transform.rotate(
                      angle: _controller!.value * 2 * 3.14,
                      child: _child,
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Let\'s ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 38, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'know ',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: 'you!',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 4, 213, 250)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text('Sign In'),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
