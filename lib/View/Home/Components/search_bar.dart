import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double len = screenSize.height;
    double wid = screenSize.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: wid * 0.7,
            height: len * 0.06,
            decoration: BoxDecoration(
              color: const Color(
                0xFFebfffc,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search City',
                hintStyle: TextStyle(
                  color: Color(0xFF626262),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.only(left: 40),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: wid * 0.005,
          ),
          GestureDetector(
            onTap: () async {
              searchCity = searchController.text;
              await Restart.restartApp();
            },
            child: Container(
              width: len * 0.06,
              height: len * 0.06,
              decoration: BoxDecoration(
                color: const Color(0xFFebfffc),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/images/search.png'),
            ),
          ),
          // child: Image.asset('assets/images/search.png'),
        ],
      ),
    );
  }
}

String searchCity = "kolkata";
