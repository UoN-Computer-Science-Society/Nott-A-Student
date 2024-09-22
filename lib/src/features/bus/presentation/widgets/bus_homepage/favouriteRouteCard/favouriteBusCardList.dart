import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/local/favourite_route.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCarddetails.dart';

class FavouriteBusCardList extends StatefulWidget {
  final GlobalKey<FavouriteBusCardListState>? globalKey; // Change the type

  const FavouriteBusCardList({
    Key? key,
    this.globalKey,
  }) : super(key: key);
  @override
  FavouriteBusCardListState createState() => FavouriteBusCardListState();
}

class FavouriteBusCardListState extends State<FavouriteBusCardList> {
  Future<List<String>> _fetchFavouriteRoute() async {
    return await getFavouriteRoute();
  }

  // Function to trigger a rebuild
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
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
            print(favouriteRouteList);
            if (favouriteRouteList.isEmpty) {
              return Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("No favourite route. Go add some"),
              );
            } else {
              return Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favouriteRouteList.length,
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 16 : 8,
                        right: index == favouriteRouteList.length - 1 ? 16 : 8,
                      ),
                      child: FavouriteBusCardDetails(
                        route: favouriteRouteList[index],
                      ),
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }
}
