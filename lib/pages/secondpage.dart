import 'package:flutter/material.dart';
import 'package:cobagrid/kelaz/game_store.dart';

class SecondPage extends StatefulWidget {
  final GameStore games2;
  const SecondPage({ Key? key, required this.games2}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // String date = widget.games2.releaseDate;
  bool like = false;
  // final url = 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: (like) ? Colors.red : Colors.blue,
          title: Text(widget.games2.name),
          actions: [
            IconButton(onPressed: () {
              // if(!await laucnhUrl(widget.games2.linkStore)){
              //   throw 
              // }
            }, icon: Icon(Icons.share)),
            IconButton(onPressed: () {
              if(like == false){
                setState(() {
                  like = true;
                });
              }else{
                setState(() {
                  like = false;
                });
              }
            }, icon: Icon(Icons.favorite))
          ],
          //  Icon(Icons.share),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Image.network(widget.games2.imageUrls[index]),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.games2.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: (like) ? Colors.red : Colors.blue
                  ),),
                  Text(widget.games2.price)
                ],
              )
            ),
            Container(
              child: Center(
                child: Text("Release Date : "+widget.games2.releaseDate),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Text("Tags:"),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.games2.tags[0]),
                      SizedBox(width: 10),
                      Text(widget.games2.tags[1])
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.games2.tags[2]),
                      SizedBox(width: 10),
                      Text(widget.games2.tags[3])
                    ]
                  )
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(
              child: Text("About :"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.games2.about),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.grade),
                    Text(widget.games2.reviewAverage)
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.edit),
                    Text(widget.games2.reviewCount)
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
// Future<void> _launchURL(String url) async{
//   if(await canLaunch(url)){
//     await launch(url);
//   }else{
//     throw 'Could not launch $url';
//   }
// }