import { V4LocalDbIndexed } from './v4indexed/V4LocalDbIndexed';

import type { V4LocalDbBase } from './V4LocalDbBase';

// TODO ensureBackgroundObject

const v4localDb: V4LocalDbBase = new V4LocalDbIndexed();
export default v4localDb;
