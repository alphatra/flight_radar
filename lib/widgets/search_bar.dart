import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class FlightSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  FlightSearchBar({required this.onSearch});

  @override
  _FlightSearchBarState createState() => _FlightSearchBarState();
}

class _FlightSearchBarState extends State<FlightSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Wyszukaj loty z miasta',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => widget.onSearch(_controller.text),
          ),
        ),
        onSubmitted: (value) => widget.onSearch(value),
      ),
    );
  }
}
