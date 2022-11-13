// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_home_ui/utilis/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizantalPadding = 40;
  final double verticalPadding = 25;
  List myDevices = [
    // device name ,iconpath,power ststus
    ["Smart Light", "lib/Icons/light-bulb.png", true],
    ["Smart Ac", "lib/Icons/air-conditioner.png", false],
    ["Smart TV", "lib/Icons/smart-tv.png", false],
    ["Smart Fan", "lib/Icons/fan.png", false]
  ];
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizantalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //menu icon
                children: [
                  Image.asset(
                    'lib/Icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                  ),
                ],

                //profile icon
              ),
            ),
            //  SizedBox(
            //  height: 20,
            //),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizantalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome home'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ' Battula Akshay',
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: horizantalPadding),
                child: Text(
                  'Smart Devices',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )),
            Expanded(
                child: GridView.builder(
              itemCount: myDevices.length,
              padding: EdgeInsets.all(25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  smartDeviceName: myDevices[index][0],
                  iconPath: myDevices[index][1],
                  powerOn: myDevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ))

            //welCcome home

            //smart devices + grid
          ],
        ),
      ),
    );
  }
}
