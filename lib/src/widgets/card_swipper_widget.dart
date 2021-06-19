import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) => _swiper(context, peliculas[index]),
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }

  Widget _swiper(BuildContext context, Pelicula pelicula){

    pelicula.uniqueId = '${pelicula.id}-tarjeta';

    final card = Hero(
      tag: pelicula.uniqueId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          image: NetworkImage(pelicula.getPosterImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicula),
    );
  }

}
