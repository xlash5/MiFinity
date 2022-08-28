import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  const DiceWidget({
    Key? key,
    required Animation<double> animation,
    required int diceNumber,
    this.width,
  })  : _animation = animation,
        _diceNumber = diceNumber,
        super(key: key);

  final Animation<double> _animation;
  final int _diceNumber;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Image.asset(
        width: width,
        './assets/images/dice$_diceNumber.png',
      ),
    );
  }
}
