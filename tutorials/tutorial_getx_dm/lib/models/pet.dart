import 'package:get/get.dart';

class RxPet {
  final RxString name;
  final RxInt age;

  RxPet({
    this.name,
    this.age,
  });
}

class Pet {
  RxPet rx;
  Pet({
    String name,
    int age,
  }) {
    rx = RxPet(name: name.obs, age: age.obs);
  }

  String get name => rx.name.value;
  int get age => rx.age.value;

  set name(String value) {
    rx.name.value = value;
  }

  set age(int value) {
    rx.age.value = value;
  }

  /*Pet copyWith({String name, int age}) {
    return Pet(name: name ?? this.name, age: age ?? this.age);
  }*/
}
