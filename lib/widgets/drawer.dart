import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 80,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Welcome to travel agency', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_outline, size: 30),
            title: Text('Person'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline, size: 30),
            title: Text('Favourites'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.home, size: 30, color: Colors.redAccent),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.location_city_outlined, size: 30),
            title: Text('City'),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            leading: Icon(Icons.list, size: 30),
            title: Text('List'),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
    );
  }
}
