import 'package:flutter/material.dart';
import 'package:sample_application/Widgets/homescreen_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Hi John,',
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Text('Where do you \nwanna go?',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey)),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Where do you want to go?'),
              ),
              SizedBox(height: 30),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       CategoryButton(
              //         isSelected: true,
              //         icon: Icons.flight,
              //         category: 'Trips',
              //       ),
              //       CategoryButton(
              //         icon: Icons.home_outlined,
              //         category: 'Hotels',
              //       ),
              //       CategoryButton(
              //         icon: Icons.landscape_outlined,
              //         category: 'Trips',
              //       ),
              //     ],
              //   ),
              // ),
              CategoryItems(),
              SizedBox(height: 30),
              Text(
                'Top trips',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TopTripCard(
                        header: 'Nusa Pedina',
                        description: 'Bali, Indonesia',
                        image:
                            'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_720/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/gf4rur8p1xq8acqhnsdc/NusaPenidaDayTourfromBali.jpg'),
                    TopTripCard(
                        header: 'Dhdj jdhj',
                        description: 'Dijjrw, Wuhwuey',
                        image:
                            'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/f5/3e/e5/nusa-penida-island.jpg?w=1200&h=-1&s=1'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
