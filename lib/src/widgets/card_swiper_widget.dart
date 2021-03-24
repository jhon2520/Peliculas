import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  //Constructor que va a pedir la lista de cards que tendrá el swiper
  //@required indica que se debe forzar la petición del atributo en el constructor
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      //width: _screenSize.width * 0.7,
      height: _screenSize.height * 0.50,
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.45,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(image: 
            NetworkImage(peliculas[index].getPosterIMG()),
            placeholder: AssetImage("assets/img/no-image.jpg"),
            fit: BoxFit.cover,)
          );
        },
        itemCount: peliculas.length,
        //pagiination Son los puntos que muestan en que parte está el swiper
        pagination: new SwiperPagination(),
        //control son las flechas que se muestran
        //control: new SwiperControl(),
        //tipo de cambio entre imágenes
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
