// ignore_for_file: equal_keys_in_map

class Student {
  final int? id;
  final String name;
  final String lastName;
  final String course;
  final String age;
  final String phone;
  final String imagePath;

  Student({
    this.id,
    required this.name,
    required this.lastName,
    required this.course,
    required this.age,
    required this.phone,
    required this.imagePath,
  });
  String getfullname() {
    return '$name $lastName';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'last_name': lastName,
      'course': course,
      'age': age,
      'phone': phone,
      'imagePath': imagePath,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      lastName: map['last_name'],
      course: map['course'],
      age: map['age'],
      phone: map['phone'],
      imagePath: map['imagePath'],
    );
  }
}
