import 'package:eventos_flutter/pages/vistas_expositor/expositor_page.dart';
import 'package:eventos_flutter/pages/vistas_participante/vista_comen_opcional.dart';
import 'package:eventos_flutter/pages/vistas_participante/vista_comentarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eventos_flutter/theme/app_colors.dart';
import 'package:eventos_flutter/models/response_games_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TrendingGames extends StatelessWidget {
  const TrendingGames({
    Key? key,
    required this.games,
  }) : super(key: key);

  final List<Game> games;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      width: double.infinity,
      height: 400.0,
      child: ListView.builder(
        itemCount: games.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 15.0),
            width: 280.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(games[index].path),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimary.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        games[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            games[index].inscritos,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            games[index].cupos,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        games[index].subtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            height: 35.0,
                            decoration: BoxDecoration(
                              color:
                                  index == 1 ? AppColors.kBase : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                /*   Icon(                           
                                  index == 1
                                      ? Icons.add_circle_outline
                                      : Icons.check_circle,
                                  color: index == 1
                                      ? Colors.white
                                      : AppColors.kBase,
                                ),  */
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VistaComentarios()),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_circle_right),
                                  alignment: Alignment.centerLeft,
                                ),
                                Text(
                                  "Ingresar",
                                  style: TextStyle(
                                    color: index == 1
                                        ? Colors.white
                                        : AppColors.kPrimary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              String vari = "Fecha del Evento: \n" +
                                  games[index].fecha.toString();
                              Fluttertoast.showToast(
                                  msg: vari,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.SNACKBAR,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor:
                                      Color.fromARGB(255, 3, 48, 100),
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            icon: const Icon(Icons.calendar_month),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
