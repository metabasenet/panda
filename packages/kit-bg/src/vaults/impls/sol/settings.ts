import {
  COINTYPE_SOL,
  IMPL_SOL,
  INDEX_PLACEHOLDER,
} from '@onekeyhq/shared/src/engine/engineConsts';
import { ETranslations } from '@onekeyhq/shared/src/locale';

import { EDBAccountType } from '../../../dbs/local/consts';

import type {
  IAccountDeriveInfo,
  IAccountDeriveInfoMapBase,
  IVaultSettings,
} from '../../types';

export type IAccountDeriveInfoMapSol = IAccountDeriveInfoMapBase & {
  default: IAccountDeriveInfo;
  ledgerLive: IAccountDeriveInfo;
};

const accountDeriveInfo: IAccountDeriveInfoMapSol = {
  default: {
    namePrefix: 'SOL',
    template: `m/44'/${COINTYPE_SOL}'/${INDEX_PLACEHOLDER}'/0'`,
    coinType: COINTYPE_SOL,
    labelKey: ETranslations.bip44__standard,
    desc: 'OneKey, Phantom, Sollet, m/44’/501’/*’/0’',
  },
  ledgerLive: {
    namePrefix: 'Ledger Live',
    template: `m/44'/${COINTYPE_SOL}'/${INDEX_PLACEHOLDER}'`,
    coinType: COINTYPE_SOL,
    label: 'Ledger Live',
    desc: 'Ledger Live, Solflare, m/44’/501’/*’',
    disableWalletTypes: ['hw'],
  },
};

const settings: IVaultSettings = {
  impl: IMPL_SOL,
  coinTypeDefault: COINTYPE_SOL,
  accountType: EDBAccountType.SIMPLE,

  importedAccountEnabled: true,
  hardwareAccountEnabled: true,
  externalAccountEnabled: false,
  watchingAccountEnabled: true,

  defaultFeePresetIndex: 0,

  isUtxo: false,
  isSingleToken: false,
  NFTEnabled: true,
  nonceRequired: false,
  feeUTXORequired: false,
  editFeeEnabled: true,
  replaceTxEnabled: false,

  accountDeriveInfo,
  networkInfo: {
    default: {
      curve: 'ed25519',
      addressPrefix: '',
    },
  },
  hasFrozenBalance: true,
};

export default Object.freeze(settings);