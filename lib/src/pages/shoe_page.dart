import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';


class shoePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: CustomAppBar('For you'),
      //body: ShoeSizePreview()
      body: Column(
        children: <Widget>[
          CustomAppBar('For you'),
          SizedBox(height: 20,),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: const <Widget>[

            ShoeSizePreview(),

           ShoeDescription( 
              title: 'Nike Air Max 720',
              description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",

            ),



                ],
              )
            )
             ),


          
        ],
      ),
   );
  }
}