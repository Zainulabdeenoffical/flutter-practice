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
      child: _pageTitle(),
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
    List <DropdownMenuItem<String>> _items = [
      'My  name is',
      'Zain Ul Abideen'
    ].map((e) {
      return DropdownMenuItem(child: Text(e), value: e,);
    }).toList();
  }


    return Container(

  child: DropdownButton(
     onChanged: (_){},
     items: items,

      ),
    );
  }
}
