List<dynamic> bmi_calc (weight, height){
  height = height / 100;
  double bmi = weight/ (height* height);

  String bmiResult = '';

  if ( bmi < 18.5 ){
    bmiResult = 'Underweight';
  } else if ( bmi >= 18.5 && bmi < 24.9 ){
    bmiResult = 'Normal';
  }
  else if ( bmi >= 24.9 && bmi < 29.9 ){
    bmiResult = 'Overweight';
  }
  else if ( bmi >= 29.9 ){
    bmiResult = 'Obese';
  }

  else if ( bmi.isNaN ){
    bmiResult = 'Invalid Input';
  }

  List<dynamic> bmiResultList = [bmi, bmiResult];

  return bmiResultList;
}