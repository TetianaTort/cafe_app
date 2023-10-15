import 'package:flutter/material.dart';

class AccauntScreen extends StatefulWidget {
  const AccauntScreen({super.key});

  static const int discount = 5;
  static const int cardNo = 512213204324;
  static const String name = 'Tetiana';

  @override
  State<AccauntScreen> createState() => _AccauntScreenState();
}

class _AccauntScreenState extends State<AccauntScreen> {
  bool _isLightMode = true;
  String _selectedItem = 'UA';
  final List<String> _items = ['UA', 'EN'];

  void _toggleTheme() {
    setState(() {
      _isLightMode = !_isLightMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 40),
              Column(
                children: [
                  Text(AccauntScreen.name),
                  Text('Discount Amount: ${AccauntScreen.discount}%'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Card №:'),
          Text(AccauntScreen.cardNo.toString()),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: Divider()),
              Text('Settings'),
              Expanded(
                child: Divider(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Light/dark mode'),
              Switch.adaptive(
                value: _isLightMode,
                onChanged: (value) => _toggleTheme(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Language'),
              DropdownButton(
                  value: _selectedItem,
                  items: _items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? selectedItem) {
                    if (selectedItem != null) {
                      setState(() {
                        _selectedItem = selectedItem;
                      });
                    }
                  })
            ],
          )
        ],
      ),
    );
  }
}
