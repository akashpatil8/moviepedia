import 'package:movieapp/constants/constants.dart';

class ProfileListTileModel {
  final String iconPath, title, subtitle;

  ProfileListTileModel(this.title, this.subtitle, this.iconPath);
}

List<ProfileListTileModel> profileListTile = [
  ProfileListTileModel(
      'Account', 'Privacy, security, change number', MyIcons.key),
  ProfileListTileModel('Notifications', 'Message, group, sounds', MyIcons.bell),
  ProfileListTileModel(
      'Data & Storage', 'Network usage, auto download', MyIcons.data),
  ProfileListTileModel('Payments', 'History, bank accounts', MyIcons.wallet),
  ProfileListTileModel(
      'App Language', 'English (phone\'s language)', MyIcons.earth),
  ProfileListTileModel(
      'Help', 'FAQ, contact us, privacy policy', MyIcons.questionMark),
  ProfileListTileModel('Invite', '', MyIcons.invite),
];
