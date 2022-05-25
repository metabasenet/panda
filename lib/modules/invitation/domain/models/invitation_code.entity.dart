part of invitation_domain_module;

@HiveType(typeId: kHiveTypeInvitationCode)
class InvitationCode extends HiveObject {
  InvitationCode() {
    //
  }

  factory InvitationCode.create({
    required String chain,
    required String symbol,
    required String fork,
    required String address,
    required String subSign,
    required String sharePrvKey,
  }) =>
      InvitationCode()
        ..chain = chain
        ..symbol = symbol
        ..fork = fork
        ..address = address
        ..subSign = subSign
        ..sharePrvKey = sharePrvKey
        ..createdAt = SystemDate.getTime();

  @HiveField(0)
  late String chain;
  @HiveField(1)
  late String symbol;
  @HiveField(2)
  late String fork;
  @HiveField(4)
  late String address;

  @HiveField(5)
  late String subSign;
  @HiveField(6)
  late String sharePrvKey;

  @HiveField(7)
  late int createdAt;
}
