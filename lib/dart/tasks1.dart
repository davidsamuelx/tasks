import 'dart:math';

void main() {
  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  double fahrenheit = 95;
  double celsius = fahrenheitToCelsius(fahrenheit);
  print('$fahrenheit degrees Fahrenheit is equal to $celsius degrees Celsius.');

  double calculateCircleArea(double radius) {
    return 3.14159 * radius * radius;
  }

  double radius = 5.0;
  double area = calculateCircleArea(radius);
  print("area of the circle with radius  $radius is $area");

}