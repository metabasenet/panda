part of invest_domain_module;

abstract class ProfitRecordItem
    implements Built<ProfitRecordItem, ProfitRecordItemBuilder> {
// Constructors
  factory ProfitRecordItem([Function(ProfitRecordItemBuilder) updates]) =
      _$ProfitRecordItem;
  ProfitRecordItem._();

  static Serializer<ProfitRecordItem> get serializer =>
      _$profitRecordItemSerializer;

  ///
  @BuiltValueField(wireName: 'vote')
  String get vote;

  ///
  @BuiltValueField(wireName: 'extend')
  String get extend;

  @BuiltValueField(wireName: 'balance')
  String get balance;

  // Fields
  @BuiltValueField(wireName: 'height')
  String get height;

  ///
  @BuiltValueField(wireName: 'txid')
  String get txid;

  ///
  @BuiltValueField(wireName: 'time')
  String get time;

  @nullable
  String get totalReward;

  // String get totalReward =>
  //     NumberUtil.plus<String>(stakeReward ?? 0, promotionReward ?? 0);
}
