import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  late double _deviceHeight, _devicewidth;

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: Container(
      height: _deviceHeight,
      width: _devicewidth,
      padding: EdgeInsets.symmetric(horizontal: _devicewidth * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _pageTitle(),
          _dropdownwediget(),
        ],
      ),
    )));
  }

  Widget _pageTitle() {
    return const Text(
      "Gomoon",
      style: TextStyle(
          color: Colors.white, fontSize: 70, fontWeight: FontWeight.w800),
    );
  }

  Widget _austroimagewidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }

  Widget _dropdownwediget() {
    List<String> _items = [
      'Zain Web station',
      'Abdullah Station'
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _devicewidth * 0.05),
      width: _devicewidth,
      decoration: BoxDecoration(
        color: Color.fromRGBO(53, 53, 53, 1.0),
            borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton(

        value: _items.first,
        onChanged: (_){},
        items: _items.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,

          );
        }).toList(),
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        style: TextStyle(color: Colors.white,
        ),

      ),
    );
  }


}
