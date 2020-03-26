class Dog {
  int id;
  String name;
  String age;
  String breed;
  Dog({this.name, this.age, this.breed, id});
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Age': age,
      'Breed': breed,
    };
  }
}
