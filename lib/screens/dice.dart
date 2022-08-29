import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cubit/dice_cubit.dart';
import '../theme/my_text_style.dart';
import '../theme/white_text_style.dart';
import 'dart:async';
import 'dart:math';
import '../widgets/dice_widget.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> with TickerProviderStateMixin {
  int _diceNumberOne = 1;
  int _diceNumberTwo = 1;
  String _lastResultText = "Press Roll to Start";
  bool _buttonDisabled = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rollDice() async {
    setState(() {
      _buttonDisabled = true;
    });

    _controller.repeat();

    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (timer.tick == 10) {
        timer.cancel();
        _controller.stop();
      } else {
        setState(() {
          _diceNumberOne = Random().nextInt(6) + 1;
          _diceNumberTwo = Random().nextInt(6) + 1;
        });
      }
    });
    //waiting for animation to finish
    await Future.delayed(const Duration(seconds: 2));

    Map<String, dynamic> result = {
      'diceNumberOne': _diceNumberOne,
      'diceNumberTwo': _diceNumberTwo,
      'date': DateTime.now().millisecondsSinceEpoch
    };

    setState(() {
      _lastResultText = "Last Result: $_diceNumberOne + $_diceNumberTwo";
      _buttonDisabled = false;
    });
    context.read<DiceCubit>().add(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice')),
      body: BlocBuilder<DiceCubit, List>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    DiceWidget(
                      animation: _animation,
                      diceNumber: _diceNumberOne,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const SizedBox(height: 70),
                    DiceWidget(
                      animation: _animation,
                      diceNumber: _diceNumberTwo,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Text(
                _lastResultText,
                style: myTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Roll',
        key: const Key('Roll Dice'),
        child: const Text(
          'Roll',
          style: whiteTextStyle,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        disabledElevation: 0,
        elevation: 20,
        onPressed: _buttonDisabled
            ? null
            : () {
                rollDice();
              },
      ),
    );
  }
}
