class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    this.id,
    this.name,
    this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return '{ id: $id, name: "$name", age: $age }';
  }
}
