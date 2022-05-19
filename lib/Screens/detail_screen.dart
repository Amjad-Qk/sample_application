import 'package:flutter/material.dart';
import 'package:sample_application/Widgets/detailscreen_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.image,
      required this.header,
      required this.description})
      : super(key: key);

  final String image, header, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.network(
                      image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    icon: Icon(Icons.navigate_before,
                        color: Colors.white, size: 30)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(header,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.red.withOpacity(0.1),
                      child: Icon(Icons.favorite, color: Colors.red, size: 20),
                    ),
                  ],
                ),
                Row(children: [
                  Icon(Icons.location_on, color: Colors.red, size: 14),
                  SizedBox(width: 5),
                  Text(description),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomDetailButton(
                            icon: Icons.star_border,
                            buttonName: 'Rating',
                            buttonValue: '4.8(3.2k)'),
                        CustomDetailButton(
                            icon: Icons.directions_walk_rounded,
                            buttonName: 'Distance',
                            buttonValue: '3000 km'),
                        CustomDetailButton(
                            icon: Icons.restaurant_menu,
                            buttonName: 'Restaurants',
                            buttonValue: '108 avail'),
                      ]),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  style: TextStyle(color: Colors.grey),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 30),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 20,
                color: Colors.white,
              )
            ]),
        child: Text('Book A Trip',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            )),
      ),
    );
  }
}
