import 'package:flutter/material.dart';
import 'package:safeguard_app/common/color_extension.dart';
import 'package:safeguard_app/common_widget/round_button.dart';
import 'package:safeguard_app/view/login/welcome_view.dart';
import 'package:safeguard_app/view/main_tabview/main_tabview.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with SingleTickerProviderStateMixin {
  int selectPage = 0;
  PageController controller = PageController();
  AnimationController? animationController;

  List<Map<String, String>> pageArr = [
    {
      "title": "Quick Emergency Alerts",
      "subtitle": "Report emergencies instantly with just a tap.",
      "image": "assets/img/on_boarding_1.png",
    },
    {
      "title": "Real-Time Location Sharing",
      "subtitle": "Automatically share your location with authorities.",
      "image": "assets/img/on_boarding_2.png",
    },
    {
      "title": "Stay Connected",
      "subtitle": "Stay in touch with your emergency contacts and responders.",
      "image": "assets/img/on_boarding_3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });

    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: ((context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: animationController!,
                    builder: (context, child) {
                      return ScaleTransition(
                        scale: Tween(begin: 0.8, end: 1.0)
                            .animate(animationController!),
                        child: Container(
                          width: media.width,
                          height: media.width,
                          alignment: Alignment.center,
                          child: Image.asset(
                            pObj["image"].toString(),
                            width: media.width * 0.85,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                ],
              );
            }),
          ),
          Positioned(
            bottom: media.height * 0.1,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageArr.map((e) {
                    var index = pageArr.indexOf(e);

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: index == selectPage
                            ? TColor.primary
                            : TColor.placeholder,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: media.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundButton(
                    title: selectPage == pageArr.length - 1
                        ? "Get Started"
                        : "Next",
                    onPressed: () async {
                      if (selectPage >= pageArr.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeView()),
                        );
                      } else {
                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(
                            selectPage,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeIn,
                          );
                          animationController?.forward(from: 0.0);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
