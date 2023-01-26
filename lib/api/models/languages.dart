class Languages {
  final String code;
  final String name;


  const Languages({
    required this.code,
    required this.name,
  });

  

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        code: json['code'] as String? ?? "",
        name: json['name'] as String? ?? "",
      );
}