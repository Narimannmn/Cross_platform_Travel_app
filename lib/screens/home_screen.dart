import 'package:flutter/material.dart';
import 'package:mid/controllers/TourController.dart';
import 'package:mid/models/Tour.dart';
import 'package:mid/screens/post_screen.dart';
import 'package:mid/widgets/drawer.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  var category = [
    'Best places',
    'Most visited',
    'Favorites',
    'New added',
    'Hotels',
    'Restaurants',
  ];
  final TourController tourController = TourController();

  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel agency'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add your notification icon functionality here
            },
          ),
        ],
      ),
      drawer: MainDrawer(),

      body: Column(
        children: [
          const PreferredSize(
            preferredSize: Size.fromHeight(90.0),
            child: HomeAppBar(),
          ),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {},
                              child: Container(
                                width: 240,
                                margin: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/city${index + 1}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: const Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      child: const Text(
                                        "City name",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                for (int i = 0; i < 6; i++)
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 10, 50, 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                        )
                                      ],
                                    ),
                                    child: Text(
                                      category[i],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<List<Tour>>(
                          future: tourController.getAllTours(),
                          builder: (BuildContext context, AsyncSnapshot<List<Tour>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else {
                              List<Tour> tours = snapshot.data!;
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: tours.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Tour tour = tours[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => PostScreen(tour: tour),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(tour.img), // Use NetworkImage for external URLs
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                  Colors.black.withOpacity(0.7),
                                                  BlendMode.dstATop,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tour.city,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.more_vert,
                                                size: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 20,
                                            ),
                                            Text(
                                              '4.5',
                                              style: TextStyle(fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //bottomNavigationBar: HomeBottomBar(),
    );
  }
}
