import 'package:e_commerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Drawer Icon
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    size: 75,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //Shop Tile
              MyListTile(
                icon: Icons.home,
                text: "Shop",
                onTap: () => Navigator.pop(context),
              ),

              //Cart tile
              MyListTile(
                icon: Icons.shopping_cart,
                text: "Cart",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              icon: Icons.exit_to_app,
              text: "Exit",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
