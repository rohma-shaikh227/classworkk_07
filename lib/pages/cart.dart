import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart with ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void toggleItem(String item) {
    if (_items.contains(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  double get total => _items.length * 42.0;
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart.items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeItem(cart.items[index]);
                    },
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
