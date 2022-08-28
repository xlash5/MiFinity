import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../theme/my_text_style.dart';

class HistoryCard extends StatelessWidget {
  final int diceNumberOne;
  final int diceNumberTwo;
  final int date;
  const HistoryCard({
    Key? key,
    required this.diceNumberOne,
    required this.diceNumberTwo,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Card(
        color: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Dice 1: $diceNumberOne',
                      style: myTextStyle,
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Text(
                      'Dice 2: $diceNumberTwo',
                      style: myTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
                width: double.infinity,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Text(
                'Date: ${DateFormat.yMEd().add_jms().format(DateTime.fromMillisecondsSinceEpoch(date))}',
                style: myTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
