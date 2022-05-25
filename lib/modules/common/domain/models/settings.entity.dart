part of common_domain_module;

@HiveType(typeId: kHiveTypeSettings)
class Settings extends HiveObject {
  Settings({
    this.language,
    this.languageIsSet = false,
    this.fiatCurrency,
    this.activeWalletId,
  });

  @HiveField(0)
  String? language;
  @HiveField(1)
  bool languageIsSet;
  @HiveField(2)
  String? fiatCurrency;
  @HiveField(3)
  String? activeWalletId;

  @HiveField(5)
  late Map<String, dynamic> imageSignature;
  @HiveField(6)
  late int imageSignatureLastUpdate;

  @HiveField(7)
  late String installId;
}
