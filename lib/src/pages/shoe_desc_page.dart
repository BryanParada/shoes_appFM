import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          ShoeSizePreview( fullScreen: true),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                    ShoeDescription( 
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  
                  _PriceBuyNow()


                ],
              )
            )
          )

        ],
      )
    );
  }
}

class _PriceBuyNow extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            OrangeButton(text: 'Buy now', myWidth: 120, myHeight: 40,)
          ],
        ),
      ),
    );
  }
}