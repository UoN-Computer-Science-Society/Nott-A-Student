import 'dart:async';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:intl/intl.dart';

import 'package:Nott_A_Student/src/features/dashboard/domain/models/news_model.dart';
import 'package:Nott_A_Student/src/features/dashboard/domain/models/sa_events.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/sa_events_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/header.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/newsTypeButton.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/news_card.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/widgets/scrollBehaviour.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:logging/logging.dart';

import '../widgets/FeaturedNews.dart';

List newsType = ["ALL", "SA", "FOSE", "FASS", "CAREERS"];
var logger = Logger("NAS Dashboard");

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<NewsModel> news = [];
  List<NewsModel> featuredNews = [];
  String chosenType = "ALL";
  double linePositionAnimation = 0;
  double lineWidthAnimation = 65;
  int pageCounter = 0;
  bool isSwiping = false;

  Map<String, GlobalKey> _newsTypeKeys = {};

  RenderBox _getWidgetRenderBox(GlobalKey key) {
    Offset position = Offset.zero;
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;

    // setState(() {});
    return renderBox;
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < newsType.length; i++) {
      final key = GlobalKey();
      logger.info(newsType[i] + key.toString());
      _newsTypeKeys[newsType[i]] = key;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    // Load the news when the widget is initialized
    // context.read<DashboardCubit>().updateNews(news);

    final bloc = SAEventsRequestBloc();
    bloc.retrieveSAEvents().then((saEvents) {
      DateFormat format = DateFormat("MMM d", "en_MY");
      List<NewsModel> _news = List.generate(
          saEvents.length,
          (index) => NewsModel(
                author: saEvents[index].club!,
                cat: NewsCategory.sa,
                title: saEvents[index].title!,
                description: saEvents[index].description!,
                url: saEvents[index].signupLink!,
                urlToImage: saEvents[index].image!,
                eventDate: format.parse(saEvents[index].date!),
                startTime: saEvents[index].startTime!,
                endTime: saEvents[index].endTime!,
                eventVenue: saEvents[index].venue!,
              ));

      // await Future.delayed(const Duration(seconds: 1));
      context.read<DashboardCubit>().clearNews();
      context.read<DashboardCubit>().updateNews(_news);
    });
  }

  @override
  Widget build(BuildContext context) {
    news = context.read<DashboardCubit>().state.news;
    chosenType = context.read<NewsTypeCubit>().state.type;
    // logger.info(chosenType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          children: [
            const Header(),
            const Gap(8),
            if (featuredNews.isNotEmpty) const FeaturedNews(),
            const Gap(8),
            Row(children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ]),
            const Gap(8),
            Stack(
              children: [
                BlocListener<NewsTypeCubit, NewsTypeState>(
                  listener: (context, state) {
                    final newsTypebtnRenderBox =
                        _getWidgetRenderBox(_newsTypeKeys[state.type]!);
                    final _lineWidthAnimation = newsTypebtnRenderBox.size.width;

                    Offset position =
                        newsTypebtnRenderBox.localToGlobal(Offset.zero);
                    logger.info(position.dx.toString());
                    setState(() {
                      chosenType = state.type;
                      linePositionAnimation = position.dx - 16;
                      lineWidthAnimation = _lineWidthAnimation;
                    });
                  },
                  child: AnimatedPositioned(
                      bottom: 0,
                      left: chosenType == "ALL" ? 0 : linePositionAnimation,
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        width: lineWidthAnimation,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff005697), width: 3))),
                        padding: const EdgeInsets.only(bottom: 12),
                      )),
                ),
                Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black87, width: 0.5))),
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SizedBox(
                      height: 40,
                      child: ScrollConfiguration(
                        behavior: scrollBehaviour(),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // logger.info(newsType[index]);
                              var button = newsTypeButton(
                                  _newsTypeKeys[newsType[index]]!,
                                  context,
                                  newsType[index]);
                              return button;
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 12.0);
                            },
                            itemCount: newsType.length),
                      ),
                    ))
              ],
            ),
            const Gap(8),
            Expanded(
                child: ScrollConfiguration(
                    behavior: scrollBehaviour(), child: _generateNews())),
          ],
        ),
      ),
      bottomNavigationBar: const SafeArea(bottom: false, child: BottomNavBar()),
    );
  }

  Widget _generateNews() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      dragStartBehavior: DragStartBehavior.down,
      onHorizontalDragUpdate: (details) {
        switch (chosenType) {
          case "ALL":
            pageCounter = 0;
            break;
          case "SA":
            pageCounter = 1;
            break;
          case "FOSE":
            pageCounter = 2;
            break;
          case "FASS":
            pageCounter = 3;
            break;
          case "CAREERS":
            pageCounter = 4;
            break;
          default:
            pageCounter = 0;
        }

        if (!isSwiping) {
          isSwiping = true;
          logger.info("Swiping");
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            // Right Swipe
            if (pageCounter > 0) {
              logger.info('Right Swipe on Dashbooard');
              pageCounter--;
              if (pageCounter >= 0 && pageCounter < newsType.length) {
                final text = newsType[pageCounter];
                context.read<NewsTypeCubit>().setState(text);
                context.read<NewsTypeCubit>().onNewsTypeChanged(text);
              }
            }
          } else if (details.delta.dx < -sensitivity) {
            //Left Swipe
            if (pageCounter >= 0 && pageCounter < newsType.length - 1) {
              logger.info('Left Swipe on Dashbooard');
              pageCounter++;
              if (pageCounter >= 0 && pageCounter < newsType.length) {
                final text = newsType[pageCounter];
                context.read<NewsTypeCubit>().setState(text);
                context.read<NewsTypeCubit>().onNewsTypeChanged(text);
              }
            }
          }
          Timer(Duration(milliseconds: 200), () {
            isSwiping = false;
          });
        }
      },
      child: BlocBuilder<DashboardCubit, DashboardState>(
        // key: ValueKey(context.read<DashboardCubit>().state.news.length),
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () {
              // TODO: Need to fix up not just SA events
              // Retrieve the SA events information from the web
              final bloc = SAEventsRequestBloc();
              bloc.retrieveSAEvents().then((saEvents) {
                DateFormat format = DateFormat("MMM d", "en_MY");
                List<NewsModel> _news = List.generate(
                    saEvents.length,
                    (index) => NewsModel(
                          author: saEvents[index].club!,
                          cat: NewsCategory.sa,
                          title: saEvents[index].title!,
                          description: saEvents[index].description!,
                          url: saEvents[index].signupLink!,
                          urlToImage: saEvents[index].image!,
                          eventDate: format.parse(saEvents[index].date!),
                          startTime: saEvents[index].startTime!,
                          endTime: saEvents[index].endTime!,
                          eventVenue: saEvents[index].venue!,
                        ));

                // await Future.delayed(const Duration(seconds: 1));
                context.read<DashboardCubit>().clearNews();
                context.read<DashboardCubit>().updateNews(_news);
                logger.info('Refreshed');
                print('refreshed ${_news.length}');
              });
              return Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: context.read<DashboardCubit>().state.news.isNotEmpty
                  ? context.read<DashboardCubit>().state.news.length
                  : 1,
              // Scroll the NewsCard widgets vertically
              itemBuilder: (context, index) {
                if (context.read<DashboardCubit>().state.news.isNotEmpty) {
                  return BlocListener<NewsTypeCubit, NewsTypeState>(
                    key: ValueKey(
                        context.read<DashboardCubit>().state.news.length),
                    listener: (context, state) {
                      logger.info(state.type);
                      setState(() {
                        chosenType = state.type;
                      });
                    },
                    child: Visibility(
                        visible: chosenType == "ALL"
                            ? true
                            : (chosenType ==
                                context
                                    .read<DashboardCubit>()
                                    .state
                                    .news[index]
                                    .GetCategoryString()),
                        child: NewsCard(
                            news: context
                                .read<DashboardCubit>()
                                .state
                                .news[index])),
                  );
                } else {
                  return noNewsShowing();
                }
              },
            ),
          );
        },
      ),
    );
  }

  SizedBox noNewsShowing() {
    return
        //TODO: NOTE THAT IT SHOULD BE MORE FLEX
        SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            //TODO: Update to use sv
            'lib/src/utils/resources/NoNewsVector.png',
            height: 225,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "There are no updates right now. Check back later.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
