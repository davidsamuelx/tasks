import 'dart:io';

void main() {
  //1

  int degree = 90;

  String grade;
  if (degree >= 90 && degree <= 100) {
    grade = 'A+';
  } else if (degree >= 80 && degree < 90) {
    grade = 'A';
  } else if (degree >= 70 && degree < 80) {
    grade = 'B';
  } else if (degree >= 60 && degree < 70) {
    grade = 'C';
  } else if (degree >= 50 && degree < 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  print('Your grade is: $grade');

  //2
  print('-----------------------------------------');

  print('Enter three numbers:');
  double num1 = double.parse(stdin.readLineSync()!);
  double num2 = double.parse(stdin.readLineSync()!);
  double num3 = double.parse(stdin.readLineSync()!);

  double average = (num1 + num2 + num3) / 3;

  print('The average is: $average');

  //3
  print('-----------------------------------------');

  print('Enter the first number:');
  int number1 = int.parse(stdin.readLineSync()!);
  print('Enter the second number:');
  int number2 = int.parse(stdin.readLineSync()!);

  if (number1 > number2) {
    print('$number1 is greater than $number2');
  } else if (number1 < number2) {
    print('$number1 is less than $number2');
  } else {
    print('Both numbers are equal');
  }

}
