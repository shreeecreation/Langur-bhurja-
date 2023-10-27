extension StringX on String {
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);

  bool get isNumber => RegExp(r'^\d{10}$').hasMatch(this);

  bool get isName => RegExp(r'\b[a-zA-Z]{3,}\b').hasMatch(this);

  bool get isDOB =>
      RegExp(r'\b\d{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])\b')
          .hasMatch(this);
}
