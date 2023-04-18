import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Catalog extends StatelessWidget {
  final List<String> items = [    "shoes",    "necklace",    "sunglasses",    "clothes"  ];
  final List<Color> img = [    Colors.orange,    Colors.redAccent,    Colors.blue,    Colors.yellow  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox.square(
              dimension: 50,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: img[index],
                ),
              ),
            ),
            title: Text(items[index]),
            trailing: Consumer<Cart>(
              builder: (context, cart, child) {
                return IconButton(
                  icon: cart.items.contains(items[index])
                      ? Icon(Icons.check)
                      : Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    cart.toggleItem(items[index]);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
