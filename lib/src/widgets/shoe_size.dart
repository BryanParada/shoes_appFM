import 'package:flutter/material.dart';


class ShoeSizePreview extends StatelessWidget {
  const ShoeSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Column(
          children: <Widget>[

        //Zapato con sombra
        _ShoeShadow(),

        //TODO: Tallas

          ],
          )
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Stack(
        children: <Widget>[
          Image( image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}