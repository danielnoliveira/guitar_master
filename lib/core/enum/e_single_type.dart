enum eSingleType {
  Easy,
  Medium,
  Hard,
  Expert;

  @override
  String toString() {
    return name.split('.').last;
  }
}
