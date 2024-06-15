import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //Remove From Cart
  void removeFromCart(BuildContext context, Product product) {
    //Confirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove This From Cart ??"),
        actions: [
          //Cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //Yes Accept
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  //Payment
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text("Payment Page Under Development"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //Get Cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Cart'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //Cart List
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your Cart is Empty!"))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get individual Item For Cart
                      final item = cart[index];
                      // Cart UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => removeFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),
          //Pay Btn
          Padding(
            padding: const EdgeInsets.all(75.0),
            child: MyButton(
                child: Text("PAY NOW"), onTap: () => payButtonPressed(context)),
          ),
        ],
      ),
    );
  }
}
