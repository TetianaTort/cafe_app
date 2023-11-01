import 'package:cafe_app/data/data.dart';
import 'package:cafe_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (context, ind) {
              return ProductItem(product: productsList[ind]);
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Make order'),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 70,
          width: 100,
          child: Image.network(product.imgUrl),
        ),
        const SizedBox(width: 20),
        Expanded(child: Text(product.name)),
        const CounterWidget(),
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  increement() {
    setState(() {
      count++;
    });
  }

  decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }
//create a cart
//add items
//send on main screen to draw a counter

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: increement,
          icon: const Icon(Icons.add),
        ),
        Text(count.toString()),
        IconButton(
          onPressed: decrement,
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
