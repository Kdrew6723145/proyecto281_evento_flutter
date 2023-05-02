import 'dart:convert';

import 'package:eventos_flutter/widget/login_widget/content_title.dart';
import 'package:eventos_flutter/widget/login_widget/header.dart';
import 'package:eventos_flutter/widget/login_widget/trending_games.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../models/response_category_model.dart';
import '../../models/response_games_model.dart';
import '../../models/response_new_game_model.dart';

class VistaPrincipalPartic extends StatefulWidget {
  const VistaPrincipalPartic({super.key});

  @override
  State<VistaPrincipalPartic> createState() => _VistaPrincipalParticState();
}

class _VistaPrincipalParticState extends State<VistaPrincipalPartic> {
  List<Game> games = [];
  List<NewGame> newgames = [];
  List<Category> categories = [];

  @override
  void initState() {
    loadCategory();
    loadTrendingGame();
    loadNewGames();
    super.initState();
  }

  loadTrendingGame() async {
    final response = await loadJsonAssets("assets/json/game.json");
    final result = ResponseGamesModel.fromJson(response);
    games.addAll(result.game);
    setState(() {});
  }

  loadNewGames() async {
    final response = await loadJsonAssets("assets/json/new_games.json");
    final result = ResponseNewGameModel.fromJson(response);
    newgames.addAll(result.newGame);
    setState(() {});
  }

  loadCategory() async {
    final response = await loadJsonAssets("assets/json/category.json");
    final result = ResponseCategoryModel.fromJson(response);
    categories.addAll(result.category);
    setState(() {});
  }

  Future<dynamic> loadJsonAssets(String path) async {
    final response = await rootBundle.loadString(path);
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Header(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  backgroundColor: HexColor("#283B71")),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("SALIR"),
            ),
            const ContentTitle(title: "TICS en la Sociedad"),
            const SizedBox(
              height: 20,
            ),
            TrendingGames(games: games)
          ],
        ))
      ],
    );
  }
}
