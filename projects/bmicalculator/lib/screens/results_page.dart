import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResultText;
  final String resultText;
  final String interpretationText;

  const ResultsPage({
    super.key,
    required this.bmiResultText,
    required this.resultText,
    required this.interpretationText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
        centerTitle: true,
        foregroundColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text("Normal BMI Range : 18.5 – 24.9", style: bmiBodyTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase(), style: resultTextStyle),
                  Text(bmiResultText, style: bmiTextStyle),
                  Text(
                    interpretationText,
                    style: bmiBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: bottomContainerHeight,
              color: bottomContainerColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              // padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text("Again Calculate", style: titleTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
