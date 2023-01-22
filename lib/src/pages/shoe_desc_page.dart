import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          Stack(
            children: [
              Hero(
                tag: 'shoe-1',
                child: ShoeSizePreview( fullScreen: true)
                ),

              Positioned(
                top: 80,
                child: FloatingActionButton(
                    child: Icon(Icons.chevron_left, color: Colors.white, size: 60),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                     elevation: 0,
                     backgroundColor: Colors.transparent,
                     highlightElevation: 0,
                  ),
                 
                )
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                    ShoeDescription( 
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  
                  _PriceBuyNow(),

                  _ColorsAndMore(),

                  _ButtonsLikeCart(),


                ],
              )
            )
          )

        ],
      )
    );
  }
}

class _ButtonsLikeCart extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          _ShadowedButton( Icon(Icons.star, color: Colors.red, size: 25,)),
          _ShadowedButton( Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _ShadowedButton( Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,)),
        ],
      ),
    );
  }
}

class _ShadowedButton extends StatelessWidget { 

  final Icon icon;

  const _ShadowedButton( this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow( color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0,10))
        ]
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
    
          Expanded(
            child: Stack(
              children: [
                      Positioned(left: 60, child: _ColorButton( Color(0xff364D56),4 )),
                      Positioned(left: 40, child: _ColorButton( Color(0Xff2099F1),3 )),
                      Positioned(left: 20, child: _ColorButton( Color(0xffFFAD29),2 )),
                      _ColorButton( Color(0xffC6D642),2 ),
              ],
            ),
          ),
     
    
          OrangeButton(text: 'More related items', myHeight: 30, myWidth: 140, color: Color(0xffFFC675),)
    
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget { 

  final Color color;
  final int index;

  const _ColorButton(this.color, this.index);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration( milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}

class _PriceBuyNow extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: OrangeButton(text: 'Buy now', myWidth: 120, myHeight: 40,)
              )
          ],
        ),
      ),
    );
  }
}