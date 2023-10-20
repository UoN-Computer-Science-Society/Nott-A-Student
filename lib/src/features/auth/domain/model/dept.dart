class DeptItem {
  final String label;
  final String value;

  DeptItem({required this.value, required this.label});

  factory DeptItem.fromJson(Map<String, dynamic> json) {
    return DeptItem(
      value: json['value'] as String,
      label: json['label'] as String,
    );
  }

  
}
