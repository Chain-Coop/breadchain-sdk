import 'package:breadchain_sdk/models/event_config.dart';

class InitConfig {
  final num? walletBalance;
  final String primaryFiatCurrency;
  final bool walletBalanceVisible;
  final EventConfig? eventConfig;

  const InitConfig({
    this.walletBalance,
    this.eventConfig,
    this.walletBalanceVisible = true,
    this.primaryFiatCurrency = 'N',
  });
}
