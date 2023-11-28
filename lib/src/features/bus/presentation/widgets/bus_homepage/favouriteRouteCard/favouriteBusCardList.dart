import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/data/data%20source/local/favouriteRoute.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCarddetails.dart';

class FavouriteBusCardList extends StatefulWidget {
  const FavouriteBusCardList({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouriteBusCardList> createState() => _FavouriteBusCardListState();
}

class _FavouriteBusCardListState extends State<FavouriteBusCardList> {
  late Key _futureBuilderKey; // Add a key for the FutureBuilder

  @override
  void initState() {
    super.initState();
    _futureBuilderKey = UniqueKey(); // Initialize a unique key
  }

  Future<List<String>> _fetchFavouriteRoute() async {
    return await getFavouriteRoute();
  }

  void _removeCard() {
    // Trigger a rebuild of the FutureBuilder with a new key
    setState(() {
      _futureBuilderKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190, // Adjust the height to fit the content of the cards
      child: FutureBuilder<List<String>>(
        key: _futureBuilderKey, // Use the key to force rebuild
        future: _fetchFavouriteRoute(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              final favouriteRouteList = snapshot.data ?? [];

              if (favouriteRouteList.isNotEmpty) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favouriteRouteList.length,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 16 : 8,
                            right: index == favouriteRouteList.length - 1
                                ? 16
                                : 8),
                        child: FavouriteBusCardDetails(
                          route: favouriteRouteList[index],
                          onRemove: _removeCard,
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: Text("No favourite route, Go search for your favourite route and add to your favourite now"),
                );
              }
          }
        },
      ),
    );
  }
}
