import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveFavouriteRoute(String route) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> favouriteRouteList = await getFavouriteRoute();
  //if the original list does not contain the route
  if (!favouriteRouteList.contains(route)) {
    favouriteRouteList.add(route);
    await prefs.setStringList('favoriteroute', favouriteRouteList);
    //  return true if the route has succesfully added
    return true;
  } else {
    //  return false if the route is already in the list
    return false;
  }
}

Future<bool> removeFavouriteRoute(String route) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> favouriteRouteList = await getFavouriteRoute();
  //if the original list does not contain the route
  if (favouriteRouteList.contains(route)) {
    favouriteRouteList.remove(route);
    await prefs.setStringList('favoriteroute', favouriteRouteList);
    //  return true if the route has succesfully remove
    return true;
  } else {
    //  return false if the route is not in the list
    return false;
  }
}

Future<bool> checkIsRouteExists(String route) async {
  List<String> favouriteRouteList = await getFavouriteRoute();
  //if the original list does not contain the route
  if (favouriteRouteList.contains(route)) {
    return true;
  } else {
    //  return false if the route is not in the list
    return false;
  }
}

Future<List<String>> getFavouriteRoute() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> route = prefs.getStringList('favoriteroute') ?? [];
  print(route);
  return route;
}
