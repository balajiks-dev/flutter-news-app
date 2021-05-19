import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/home_page.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider<OnBoardState>(
      create: (_) => OnBoardState(),
      child: Scaffold(
        body: OnBoard(
          pageController: _pageController,
          onSkip: () {
            Navigator.pushAndRemoveUntil(
    context,   
    MaterialPageRoute(builder: (BuildContext context) => HomePage()), 
    ModalRoute.withName('/')
);
          },
          onDone: () {
            Navigator.pushAndRemoveUntil(
    context,   
    MaterialPageRoute(builder: (BuildContext context) => HomePage()), 
    ModalRoute.withName('/')
);
          },
          onBoardData: onBoardData,
          titleStyles: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade300,
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: Colors.deepOrangeAccent,
            activeColor: Colors.deepOrange,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          skipButton: TextButton(
            onPressed: () {
                Navigator.pushAndRemoveUntil(
    context,   
    MaterialPageRoute(builder: (BuildContext context) => HomePage()), 
    ModalRoute.withName('/')
);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          nextButton: Consumer<OnBoardState>(
            builder: (BuildContext context, OnBoardState state, Widget? child) {
              return InkWell(
                onTap: () => _onNextTap(state, context),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.redAccent, Colors.deepOrangeAccent],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Done" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState, BuildContext context) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
       Navigator.pushAndRemoveUntil(
    context,   
    MaterialPageRoute(builder: (BuildContext context) => HomePage()), 
    ModalRoute.withName('/')
);
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Flutter News Application",
    description: "User can browse news articles and videos through various categories. ... Users can also bookmark any news article/video for future use. The application will have three type of user's at backend one will be admin manager with having full access to backend features including user and content management.",
    imgUrl: "assets/images/news_api.png",
  ),
  const OnBoardModel(
    title: "Let know the current situation of your surroundings!",
    description:
        "The Internet has changed the way that we view news. Instead of having a TV producer or a newspaper editor determine the most important stuff for us and then buying into their product, we are now free to roam the waves of the Web to find the news that matters most to us.",
    imgUrl: 'assets/images/news_api.png',
  ),
];