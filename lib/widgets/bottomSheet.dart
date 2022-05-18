// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class bottomSheet extends StatefulWidget {
  String title;
  bottomSheet({required this.title});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final items = ['Individual', 'A team ', 'Two Teams'];
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'http://www.jihatnews.ma/news_img/news_1547730226.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://gate.ahram.org.eg/Media/News/2016/6/1/2016-636004030627088922-708_main.jpg'),
                          fit: BoxFit.cover)),
                ),
              )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Choose members :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              DropdownButton(
                hint: const Text('Click to Choose'),
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (dynamic val) {
                  setState(() {
                    value = val.toString();
                  });
                },
                items: items.map((e) => dropdownItems(e)).toList(),
              )
            ],
          ),
          (value == '')
              ? Text('')
              : (value == 'Individual')
                  ? const Text(
                      '5DH',
                      style: TextStyle(
                          color: Color.fromARGB(255, 160, 120, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )
                  : (value == 'A team ')
                      ? const Text('25Dh',
                          style: TextStyle(
                              color: Color.fromARGB(255, 160, 120, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.w500))
                      : const Text('50Dh',
                          style: TextStyle(
                              color: Color.fromARGB(255, 160, 120, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
          TextButton(
            onPressed: () {},
            child: Text(
              'Reserve Place',
              style: TextStyle(color: Colors.grey),
            ),
            style: TextButton.styleFrom(side: BorderSide(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  DropdownMenuItem dropdownItems(String item) {
    return DropdownMenuItem(
      child: Text(item),
      value: item,
    );
  }
}
