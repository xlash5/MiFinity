import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/my_button.dart';

class Home extends StatefulWidget with AutoRouteAware {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed('/Dice');
                },
                text: 'Dice Page',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed('/History');
                },
                text: 'History Page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
