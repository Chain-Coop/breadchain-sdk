import 'package:breadchain_sdk/models/event_config.dart';

class InitConfig {
  num? walletBalance;
  EventConfig? eventConfig;
  int? totalGroupsCount;

  InitConfig({
    this.walletBalance,
    this.eventConfig,
  });
}
