class SourceModal {
  String landscape;
  String large;
  String large2x;
  String medium;
  String original;
  String portrait;
  String small;
  String tiny;

  SourceModal({
    required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny,
  });

  factory SourceModal.fromJson(Map<String, dynamic> json) {
    return SourceModal(
      landscape: json['landscape'],
      large: json['large'],
      large2x: json['large2x'],
      medium: json['medium'],
      original: json['original'],
      portrait: json['portrait'],
      small: json['small'],
      tiny: json['tiny'],
    );
  }
}
