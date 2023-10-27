class Source {
	dynamic id;
	String? name;

	Source({this.id, this.name});

	factory Source.fromJson(Map<String, dynamic> json) => Source(
				id: json['id'] as dynamic,
				name: json['name'] as String?,
			);
}
