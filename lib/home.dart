import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool card1expended=false;
  bool card1visible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            bannerImage(),
            SizedBox(height: 20,),
            CustomText(text: "Texte Texte Texte Texte Texte Texte", size: 20, color: Colors.black),
            SizedBox(height: 20,),
            imageCard(context),
            SizedBox(height: 20,),
            CustomText(text: "Texte Texte Texte Texte Texte Texte", size: 20, color: Colors.black),
            SizedBox(height: 20,),
            iconsSet(),
            SizedBox(height: 20,),
            cardsSet()
          ],
        ),
      ),
    );
  }

  Row cardsSet() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical:5,horizontal: 5),
                height: 250,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://images.unsplash.com/photo-1569496736555-47c448d556f7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3b3JrZXJzfGVufDB8fHx8MTcwNjU5NzUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
                    CustomText(text: "Texte descriptif", size: 20, color: Colors.white)
                  ],
                ),
              ),
              SizedBox(width: 50,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                height: 250,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1569496736555-47c448d556f7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3b3JrZXJzfGVufDB8fHx8MTcwNjU5NzUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CustomText(text: "Texte descriptif", size: 20, color: Colors.white)
                  ],
                ),
              ),

            ],
          );
  }

  Row iconsSet() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               decoration: BoxDecoration(
                 color: Colors.black45,
                 borderRadius: BorderRadius.circular(15)
               ),
               child: Icon(Icons.abc,size: 50,),
             ),
             SizedBox(width: 30,),
             Container(
               decoration: BoxDecoration(
                   color: Colors.black45,
                   borderRadius: BorderRadius.circular(15)
               ),
               child: Icon(Icons.abc,size: 50,),
             ),
             SizedBox(width: 30,),
             Container(
               decoration: BoxDecoration(
                   color: Colors.black45,
                   borderRadius: BorderRadius.circular(15)
               ),
               child: Icon(Icons.abc,size: 50,),
             ),
           ],
        );
  }

  InkWell imageCard(BuildContext context) {
    return InkWell(
          onTap: (){
            setState(() {
              card1expended=!card1expended;
              card1visible=false;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(5),
            onEnd:(){
              setState(() {
                card1visible=card1expended;
              });
            } ,
            width: card1expended?MediaQuery.of(context).size.width:220,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(30)
            ),
            duration: Duration(milliseconds:500),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1569496736555-47c448d556f7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3b3JrZXJzfGVufDB8fHx8MTcwNjU5NzUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
                    width: 200,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Visibility(
                  visible:card1visible,
                    child:CustomText(text: "Description", size: 20, color: Colors.black),)
                  ],
            ),
          ),
        );
  }

  ClipRRect bannerImage() {
    return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://images.unsplash.com/photo-1569496736555-47c448d556f7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3b3JrZXJzfGVufDB8fHx8MTcwNjU5NzUyMXww&ixlib=rb-4.0.3&q=80&w=1080',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
        );
  }
}
class CustomText extends StatefulWidget {
  final String text;
  final double size;
  final Color color;
  const CustomText({super.key, required this.text, required this.size, required this.color});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: widget.size,
      color: widget.color
    ),);
  }
}

