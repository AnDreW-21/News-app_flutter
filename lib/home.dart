import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled7/News%20Model/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navBarIndex = 0;
  addNews(String input){
    setState(() {
      News.homeNews.add(input);
    });
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      Center(
        child: ListView.builder(
            itemCount: News.homeNews.length,
            itemBuilder: (context, index) => NewContainer(
                  index: index,
                )),
      ),
      Center(
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            icon: Icon(Icons.input,color: Colors.white,),
            hintText: "Add your News",
          ),
        onSubmitted: (input)=>addNews(input),
        )
      )
    ];
    return SafeArea(
      child: Scaffold(
        body: bodyWidgets[navBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          iconSize: 20,
          onTap: (index) {
            setState(() {
              navBarIndex = index;
            });
          },
          currentIndex: navBarIndex,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: "Home News"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "add New"),
          ],
        ),
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Center(
            child: Text(
              "Here you can ask",
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(
            Icons.account_tree,
            color: Colors.brown,
            size: 20,
          ),
          title: Text(
            "Local News",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class NewContainer extends StatelessWidget {
  final int index;
  NewContainer({
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(15)),
      child: Text(
        News.homeNews[index],
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );
  }
}
