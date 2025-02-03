import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'bmi_calc.dart';
import 'result_page.dart';

const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  double height = 180;
  int weight = 60;
  int age = 20;
  String gender = '';

  //1 = male, 2 = female
  void updateColor(int gender) {
    gender == 1 ? maleCardColor = activeColor : maleCardColor = inactiveColor;
    gender == 2
        ? femaleCardColor = activeColor
        : femaleCardColor = inactiveColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                        gender = 'male';
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.mars, size: 80),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(2);
                      gender = 'female';
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.venus, size: 80),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Expanded(
              child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        "${height.toInt()} cm",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      ),
                      SfSlider(
                          value: height.toInt(),
                          min: 120.0,
                          max: 220.0,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          "$weight",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => weight--),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF4C4F5E),
                                radius: 30,
                                child: Icon(Icons.remove),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => setState(() => weight++),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF4C4F5E),
                                radius: 30,
                                child: Icon(Icons.add),
                              ),
                            )
                          ],
                        )
                      ]),
                )),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => setState(() => age--),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  radius: 30,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () => setState(() => age++),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  radius: 30,
                                  child: Icon(Icons.add),
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
            decoration: BoxDecoration(
              color: Colors.red[400], // Red background color
              borderRadius: BorderRadius.circular(30),
            ),
            width: double.infinity, // 100% width
            height: 90, // Height 40
            child: TextButton(
              onPressed: () {
                List<dynamic> bmiResult = bmi_calc(weight, height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => result_page(bmiResult[0].toInt(), bmiResult[1]),
                ),);
              },
              child: Text(
                "Calculate",
                style:
                    TextStyle(color: Colors.white), // White text for contrast
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({Key? key, required this.colour, required this.cardChild})
      : super(key: key);
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: colour,
      ),
      child: cardChild,
    );
  }
}
