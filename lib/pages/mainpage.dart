import 'package:cobagrid/pages/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:cobagrid/kelaz/game_store.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Game List"),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            childAspectRatio: 4/3,
          ),
          itemCount: gameList.length,
          itemBuilder: (context, index) {
            final GameStore games = gameList[index];
            return GridTile(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => SecondPage(games2: games)
                    )
                  );
                },
                child: Column(
                  children: [
                    Container(
                    //padding: EdgeInsets.all(20),
                    //width: 50, height: 50,
                      child: Image.network(games.imageUrls[0]),
                    ),
                    Container(
                      // height: 50,
                      child: Text(
                        games.name, 
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      // height: 50,
                      child: Text(
                        games.price, 
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              )
            );
          },
        ),
      )
    );
  }
}

