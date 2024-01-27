import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FlightSearchBar extends StatefulWidget {
  final Function(Map<String, dynamic>) onSearch;

  FlightSearchBar({required this.onSearch});

  @override
  _FlightSearchBarState createState() => _FlightSearchBarState();
}

class _FlightSearchBarState extends State<FlightSearchBar> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  DateTime? _departureDate;
  DateTime? _returnDate;
  int _adultCount = 1;

  void _presentDatePicker(bool isDeparture) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        if (isDeparture) {
          _departureDate = pickedDate;
        } else {
          _returnDate = pickedDate;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _fromController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Skąd lecisz?',
              suffixIcon: Icon(Icons.flight_takeoff),
            ),
          ),
          Gap(15),
          TextField(
            controller: _toController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Dokąd lecisz?',
              suffixIcon: Icon(Icons.flight_land),
            ),
          ),
          Gap(15),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(_departureDate == null
                    ? 'Wybierz datę wylotu'
                    : 'Wylot: ${DateFormat.yMd().format(_departureDate!)}'),
              ),
              TextButton(
                onPressed: () => _presentDatePicker(true),
                child: Text('Wybierz'),
              ),
              if (_departureDate != null)
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _departureDate = null;
                    });
                  },
                ),
            ],
          ),

          // Data powrotu
          if (_departureDate != null)
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_returnDate == null
                      ? 'Wybierz datę powrotu'
                      : 'Powrót: ${DateFormat.yMd().format(_returnDate!)}'),
                ),
                TextButton(
                  onPressed: () => _presentDatePicker(false),
                  child: Text('Wybierz'),
                ),
                if (_returnDate != null)
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _returnDate = null;
                      });
                    },
                  ),
              ],
            ),
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> searchParams = {
                'from': _fromController.text,
                'to': _toController.text,
                'departureDate': _departureDate?.toIso8601String(),
                'returnDate': _returnDate?.toIso8601String(),
                'adultCount': _adultCount,
              };
              widget.onSearch(searchParams);
            },
            child: Text('Szukaj Lotów'),
          ),
        ],
      ),
    );
  }
}
