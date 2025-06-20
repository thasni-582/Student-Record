// ignore_for_file: equal_keys_in_map

class Student {
  final int? id;
  final String firstName;
  final String lastName;
  final String course;
  final String age;
  final String phone;
  final String imagePath;

  Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.course,
    required this.age,
    required this.phone,
    required this.imagePath,
  });
  String getfullname() {
    return '$firstName $lastName';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': firstName,
      'name': lastName,
      'course': course,
      'age': age,
      'phone': phone,
      'imagePath': imagePath,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      firstName: map['First name'],
      lastName: map['Last name'],
      course: map['course'],
      age: map['age'],
      phone: map['phone'],
      imagePath: map['imagePath'],
    );
  }
}
