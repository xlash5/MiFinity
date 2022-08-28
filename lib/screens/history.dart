import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_finity/theme/my_text_style.dart';
import '../bloc/cubit/dice_cubit.dart';
import '../widgets/my_button.dart';
import '../widgets/history_card.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              onPressed: () {
                context.read<DiceCubit>().reset();
              },
              text: 'Reset',
            ),
          ),
        ],
      ),
      body: BlocBuilder<DiceCubit, List>(
        builder: (context, state) {
          return ListView(
            children: <Widget>[
              Column(
                children: state.isEmpty
                    ? [
                        const SizedBox(height: 20.0),
                        const Text(
                          'No History',
                          style: myTextStyle,
                        )
                      ]
                    : state
                        .map(
                          (e) =>
                              //card with shadow and rounded corners
                              HistoryCard(
                            diceNumberOne: e['diceNumberOne'],
                            diceNumberTwo: e['diceNumberTwo'],
                            date: e['date'],
                          ),
                        )
                        .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
