import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';


class ShoeSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ShoeSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap:() {
          if (!this.fullScreen)
          Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext context) => ShoeDescPage())
            );
        },
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
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({super.key});

  @override
  Widget build(BuildContext context) {

    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: EdgeInsets.all(40),
      child: Stack(
        children: <Widget>[

          Positioned(
            bottom: 20,
            right: 0,
            child: _Shadow()
            ),

          Image( image: AssetImage(shoeModel.assetImage))
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

    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: (){
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.size = this.numSize;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${numSize.toString().replaceAll('.0', '')}',
         style: TextStyle(
            color: (this.numSize == shoeModel.size) ? Colors.white :   Color(0xffF1A23A),
            fontSize: 15,
            fontWeight: FontWeight.bold
        )),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: (this.numSize == shoeModel.size) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if(this.numSize == shoeModel.size)
            BoxShadow(
              color: Color(0xffF1A23A),
              blurRadius: 10,
              offset: Offset(0,5)
            ),
          ]
        ),
      ),
    );
  }
}