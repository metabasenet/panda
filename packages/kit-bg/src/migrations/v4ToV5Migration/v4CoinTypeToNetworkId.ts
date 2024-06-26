import type { INetworkShortCode } from '@onekeyhq/shared/src/config/networkIds';
import { getNetworkIdsMap } from '@onekeyhq/shared/src/config/networkIds';
import {
  COINTYPE_ADA,
  COINTYPE_ALGO,
  COINTYPE_APTOS,
  COINTYPE_BCH,
  COINTYPE_BTC,
  COINTYPE_CFX,
  COINTYPE_CKB,
  COINTYPE_COSMOS,
  COINTYPE_DNX,
  COINTYPE_DOGE,
  COINTYPE_DOT,
  COINTYPE_ETH,
  COINTYPE_FIL,
  COINTYPE_KASPA,
  COINTYPE_LIGHTNING,
  COINTYPE_LIGHTNING_TESTNET,
  COINTYPE_LTC,
  COINTYPE_NEAR,
  COINTYPE_NEURAI,
  COINTYPE_NEXA,
  COINTYPE_NOSTR,
  COINTYPE_SOL,
  COINTYPE_STC,
  COINTYPE_SUI,
  COINTYPE_TBTC,
  COINTYPE_TRON,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  COINTYPE_XMR,
  COINTYPE_XRP,
} from '@onekeyhq/shared/src/engine/engineConsts';

const networkIdsMap = getNetworkIdsMap();
export const v4CoinTypeToNetworkId: Partial<
  Record<INetworkShortCode | string, string>
> = {
  [COINTYPE_ETH]: networkIdsMap.eth,
  //   [COINTYPE_ETC]: networkIdsMap.etc,

  [COINTYPE_SOL]: networkIdsMap.sol,
  [COINTYPE_ALGO]: networkIdsMap.algo,
  [COINTYPE_NEAR]: networkIdsMap.near,
  [COINTYPE_STC]: 'stc--1', // 'logoURI': 'https://uni.onekey-asset.com/static/chain/stc.png',
  [COINTYPE_CFX]: networkIdsMap.cfx,
  [COINTYPE_BTC]: networkIdsMap.btc,
  [COINTYPE_TBTC]: networkIdsMap.tbtc,
  [COINTYPE_TRON]: networkIdsMap.trx,
  [COINTYPE_APTOS]: networkIdsMap.apt,
  [COINTYPE_DOGE]: networkIdsMap.doge,
  [COINTYPE_LTC]: networkIdsMap.ltc,
  [COINTYPE_NEURAI]: networkIdsMap.xna,
  [COINTYPE_BCH]: networkIdsMap.bch,
  [COINTYPE_XRP]: networkIdsMap.xrp,
  [COINTYPE_COSMOS]: networkIdsMap.cosmoshub,
  [COINTYPE_ADA]: networkIdsMap.ada,
  [COINTYPE_SUI]: networkIdsMap.sui,
  [COINTYPE_FIL]: networkIdsMap.fil,
  [COINTYPE_DOT]: networkIdsMap.dot,
  [COINTYPE_XMR]: 'xmr--0', // 'logoURI': 'https://common.onekey-asset.com/chain/monero.png'
  [COINTYPE_KASPA]: networkIdsMap.kaspa,
  [COINTYPE_NEXA]: networkIdsMap.nexa,
  [COINTYPE_LIGHTNING]: networkIdsMap.lightning,
  [COINTYPE_LIGHTNING_TESTNET]: networkIdsMap.tlightning,
  [COINTYPE_NOSTR]: networkIdsMap.nostr,
  [COINTYPE_DNX]: networkIdsMap.dnx,
  [COINTYPE_CKB]: networkIdsMap.ckb,
};
