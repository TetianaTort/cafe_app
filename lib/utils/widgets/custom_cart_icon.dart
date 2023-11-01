import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartCountProvider = StateProvider<int>((ref) => 0);

class CustomCart extends ConsumerWidget {
  const CustomCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(cartCountProvider);

    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          count != 0
              ? Positioned(
                  top: 0,
                  right: 7,
                  child: CircleAvatar(
                    maxRadius: 10,
                    child: Text(
                      count.toString(),
                    ),
                  ),
                )
              : const SizedBox(),
          const Center(child: Icon(Icons.shopping_cart_outlined)),
          const SizedBox(width: 40)
        ],
      ),
    );
  }
}
