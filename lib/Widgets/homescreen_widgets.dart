import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sample_application/Screens/Home%20Screen/home_screen.dart';
import 'package:sample_application/Screens/detail_screen.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.isSelected,
    required this.icon,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final IconData icon;
  final String category;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(right: 10),
        height: 50,
        decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            SizedBox(width: 5),
            Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            onTap: () {
              setState(() {
                selectedCategory = 0;
              });
            },
            isSelected: selectedCategory == 0,
            icon: Icons.flight,
            category: 'Trips',
          ),
          CategoryButton(
            onTap: () {
              setState(() {
                selectedCategory = 1;
              });
            },
            isSelected: selectedCategory == 1,
            icon: Icons.home_outlined,
            category: 'Hotels',
          ),
          CategoryButton(
            onTap: () {
              setState(() {
                selectedCategory = 2;
              });
            },
            isSelected: selectedCategory == 2,
            icon: Icons.landscape_outlined,
            category: 'Trips',
          ),
        ],
      ),
    );
  }
}

class TopTripCard extends StatelessWidget {
  const TopTripCard(
      {Key? key,
      required this.header,
      required this.description,
      required this.image})
      : super(key: key);

  final String header, description, image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      header: header,
                      description: description,
                      image: image,
                    )));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(right: 10),
        height: 180,
        width: 220,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
              )
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blueGrey.withOpacity(0.3),
                      child: Icon(Icons.favorite_border_outlined,
                          color: Colors.white, size: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
                child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(children: [
                      Icon(Icons.location_on, color: Colors.red, size: 14),
                      SizedBox(width: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                  ],
                ),
                Spacer(),
                Icon(Icons.star, color: Colors.red, size: 18),
                Text(
                  '4.8',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class TabIcons extends StatelessWidget {
  const TabIcons({
    Key? key,
    required this.icon,
    required this.index,
  }) : super(key: key);

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageIndex.value = index;
        pageIndex.notifyListeners();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            pageIndex.value == index ? '.' : '',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
