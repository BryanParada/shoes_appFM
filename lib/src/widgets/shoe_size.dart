import 'package:flutter/material.dart';


class ShoeSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (this.fullScreen) ? 5 : 25,
          vertical: (this.fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (this.fullScreen) ? 400 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: 
            (!this.fullScreen)
            ? BorderRadius.circular(50)
            : BorderRadius.only(bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),)
            
          ),
          child: Column(
            children: <Widget>[
    
          //Zapato con sombra
          _ShoeShadow(),
    
          //tallas
          if (!this.fullScreen)
          _ShoeSizes(),
    
            ],
            )
        ),
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

          Positioned(
            bottom: 20,
            right: 0,
            child: _Shadow()
            ),

          Image( image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _SizesShoeBox( 7 ),
          _SizesShoeBox( 7.5 ),
          _SizesShoeBox( 8 ),
          _SizesShoeBox( 8.5 ),
          _SizesShoeBox( 9 ),
          _SizesShoeBox( 9.5 ),
        ],
      ),
    );
  }
}

class _SizesShoeBox extends StatelessWidget { 

  final double numSize;

  const _SizesShoeBox( this.numSize);


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('${numSize.toString().replaceAll('.0', '')}',
       style: TextStyle(
          color: (this.numSize == 9) ? Colors.white :   Color(0xffF1A23A),
          fontSize: 15,
          fontWeight: FontWeight.bold
      )),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: (this.numSize == 9) ? Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if(this.numSize == 9)
          BoxShadow(
            color: Color(0xffF1A23A),
            blurRadius: 10,
            offset: Offset(0,5)
          ),
        ]
      ),
    );
  }
}