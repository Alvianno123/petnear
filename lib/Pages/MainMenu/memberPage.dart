import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MemberPage extends StatelessWidget {
  MemberPage({required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Member : $username",
          style: TextStyle(fontSize: 24.0),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/MyHomePage');
            },
          ),
        ],
      ),

      /////////////BODY/////////////
      body: Column(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/finansialku_media/wordpress_media/2019/10/736225d1-pet-shop-01-finansialku.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/finansialku_media/wordpress_media/2019/10/bd96067d-pet-shop-02-finansialku.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/finansialku_media/wordpress_media/2019/10/8712a563-pet-shop-04-finansialku.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/finansialku_media/wordpress_media/2019/10/e4f35ee4-pet-shop-03-finansialku.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://storage.googleapis.com/finansialku_media/wordpress_media/2019/10/ba7ad039-pet-shop-05-finansialku.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.black,
                    ),
                    splashColor: Colors.blue,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Lelang'),
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.grey,
                    ),
                    splashColor: Colors.grey,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Petshop'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.blue,
                    ),
                    splashColor: Colors.blue,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Pet Hotel'),
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.orange,
                    ),
                    splashColor: Colors.orange,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Doctor'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.purple,
                    ),
                    splashColor: Colors.purple,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Grooming'),
                  IconButton(
                    tooltip: 'Silahkan Klik',
                    iconSize: 50,
                    icon: const Icon(
                      Icons.pets,
                      color: Colors.green,
                    ),
                    splashColor: Colors.green,
                    onPressed: () {
                      print('IconButton is pressed');
                    },
                  ),
                  Text('Petshop'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
