part of asset_domain_module;

class AssetBalanceInfo {
  AssetBalanceInfo({
    required this.symbol,
    required this.address,
    this.balance = 0,
    this.unconfirmed = 0,
    this.locked = 0,
  });

  final String symbol;
  final String address;
  final double balance;
  final double unconfirmed;
  final double locked;

  bool get hasUnconfirmed => unconfirmed > 0;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is AssetBalanceInfo &&
        o.symbol == symbol &&
        o.address == address &&
        o.balance == balance &&
        o.unconfirmed == unconfirmed &&
        o.locked == locked;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        address.hashCode ^
        balance.hashCode ^
        unconfirmed.hashCode ^
        locked.hashCode;
  }
}
