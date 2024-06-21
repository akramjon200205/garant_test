abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get mode => "$basePath/mode.svg";
  String get message => "$basePath/message.svg";
  String get close => "$basePath/close.svg"; 
  String get timer => "$basePath/timer.svg"; 
  String get home => "$basePath/home.svg"; 
  String get test => "$basePath/test.svg"; 
  String get qoidalar => "$basePath/qoidalar.svg"; 
  String get profile => "$basePath/profile.svg"; 
  String get backIcon => "$basePath/back_icon.svg"; 
  String get nextIcon => "$basePath/next_icon.svg"; 
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  // String get mebel => "$basePath/mebel.png";
  
}
