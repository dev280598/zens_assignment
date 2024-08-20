import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._();

  static const String votedJokesKey = "votedJokes";

  static Future<List<String>> getListVoted() async {
    List<String> votedJokes = [];
    await SharedPreferences.getInstance().then((value) {
      votedJokes = value.getStringList(votedJokesKey) ?? [];
    });
    return votedJokes;
  }

  static Future<void> setJokeVoted(String idJoke) async {
    await SharedPreferences.getInstance().then((prefs) {
      List<String> votedJokes = prefs.getStringList(votedJokesKey) ?? [];
      votedJokes.add(idJoke);
      prefs.setStringList(votedJokesKey, votedJokes);
    });
  }
}
