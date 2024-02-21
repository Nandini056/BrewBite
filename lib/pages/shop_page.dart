import 'package:brewbite/components/coffee_tile.dart';
import 'package:brewbite/models/coffee.dart';
import 'package:brewbite/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addToCart(Coffee coffee){
    //add to cart
  Provider.of<CoffeeShop>(context,listen:false).addItemToCart(coffee);
  //let the user know it add successfully
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text("Successfully added to the cart"),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading msg
              const Text(
                "How would you like your coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25,),
              //list of coffee
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    //get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];
                    //return the tile for this coffee
                    return CoffeeTile(coffee: eachCoffee,
                    icon: Icon(Icons.add),
                    onPressed: ()=> addToCart(eachCoffee));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
