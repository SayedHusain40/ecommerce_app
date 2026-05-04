import 'package:ecommerce_app/core/helpers/extensions.dart';
import 'package:ecommerce_app/core/routing/route_names.dart';
import 'package:ecommerce_app/features/onboarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageControllers = PageController();
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Explore a wide range of products',
      description:
          'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Unlock exclusive offers and discounts',
      description:
          'Get access to limited-time deals and special promotions available only to our valued customers.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Safe and secure payments',
      description:
          ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: _pageControllers,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];
            final isFistPage = index == 0;
            final isLastPage = index == pages.length - 1;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 20,
                      ),
                      height: 408,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4FDFA),
                        borderRadius: .circular(32),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              isFistPage
                                  ? SvgPicture.asset('assets/svgs/logo.svg')
                                  : IconButton(
                                      onPressed: () {
                                        _pageControllers.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.linear,
                                        );
                                      },
                                      icon: SvgPicture.asset(
                                        'assets/svgs/arrow-left.svg',
                                      ),
                                    ),

                              TextButton(
                                onPressed: () {
                                  context.pushNamedAndRemoveUntil(
                                    RouteNames.homeScreen,
                                    predicate: (route) => false,
                                  );
                                },
                                child: Text('Skip for now'),
                              ),
                            ],
                          ),
                          // should be the image center
                          Expanded(
                            child: Center(
                              child: Image.asset(
                                page.image,
                                width: 240,
                                height: 240,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(page.title),
                    SizedBox(height: 16),
                    Text(page.description),
                    SizedBox(height: 24),
                    isLastPage
                        ? Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamedAndRemoveUntil(
                                      RouteNames.loginScreen,
                                      predicate: (route) => false,
                                    );
                                  },
                                  child: Text('Login'),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamedAndRemoveUntil(
                                      RouteNames.registerScreen,
                                      predicate: (route) => false,
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: .center,
                                    mainAxisAlignment: .center,
                                    children: [
                                      Text('Get Started'),
                                      SizedBox(width: 8),
                                      SvgPicture.asset(
                                        'assets/svgs/arrow-right.svg',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _pageControllers.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                            child: Text('Next'),
                          ),
                    SizedBox(height: 24),
                    isFistPage
                        ? Text('Explore a wide range of products')
                        : SmoothPageIndicator(
                            controller: _pageControllers, // PageController
                            count: pages.length,
                            effect: SlideEffect(
                              spacing: 4.0,
                              // radius: 4.0,
                              dotWidth: 6.0,
                              dotHeight: 6.0,
                              // paintStyle: PaintingStyle.stroke,
                              // strokeWidth: 1.5,
                              dotColor: Color(0xFFC0C0C0),
                              activeDotColor: Color(0xFF08E488),
                            ),
                            onDotClicked: (index) {
                              _pageControllers.animateToPage(
                                index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
