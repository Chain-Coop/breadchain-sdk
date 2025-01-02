import 'package:breadchain_sdk/models/event_config.dart';
import 'package:breadchain_sdk/models/profile_data.dart';
import 'package:breadchain_sdk/presentation/widgets/active_group.dart';

class InitConfig {
  ProfileData? profileData;
  String? walletAddress;
  bool? hasNotification;
  num? walletBalance;
  EventConfig? eventConfig;
  int? totalGroupsCount;
  List<ActiveGroup>? activeGroups;

  InitConfig({
    this.profileData,
    this.walletAddress,
    this.hasNotification,
    this.walletBalance,
    this.eventConfig,
  });
}
