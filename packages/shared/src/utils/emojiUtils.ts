import { HdWalletAvatarImageNames } from './avatarUtils';

import type {
  IHdWalletAvatarImageNames,
  IHwWalletAvatarImageNames,
  IOthersWalletAvatarImageNames,
} from './avatarUtils';

export const emojiList = [
  '😀',
  '😃',
  '😄',
  '😁',
  '😆',
  '😅',
  '🤣',
  '😂',
  '🙂',
  '🙃',
  '😉',
  '😊',
  '😇',
  '🥰',
  '😍',
  '🤩',
  '😘',
  '😗',
  '☺️',
  '😚',
  '😙',
  '🥲',
  '😋',
  '😛',
  '😜',
  '🤪',
  '😝',
  '🤑',
  '🤗',
  '🤭',
  '🤫',
  '🤔',
  '🤐',
  '🤨',
  '😐',
  '😑',
  '😶',
  '😏',
  '😒',
  '🙄',
  '😬',
  '🤥',
  '😌',
  '😔',
  '😪',
  '🤤',
  '😴',
  '😷',
  '🤒',
  '🤕',
  '🤢',
  '🤮',
  '🤧',
  '🥵',
  '🥶',
  '🥴',
  '😵',
  '🤯',
  '🤠',
  '🥳',
  '🥸',
  '😎',
  '🤓',
  '🧐',
  '😕',
  '😟',
  '🙁',
  '☹️',
  '😮',
  '😯',
  '😲',
  '😳',
  '🥺',
  '😦',
  '😧',
  '😨',
  '😰',
  '😥',
  '😢',
  '😭',
  '😱',
  '😖',
  '😣',
  '😞',
  '😓',
  '😩',
  '😫',
  '🥱',
  '😤',
  '😡',
  '😠',
  '🤬',
  '😈',
  '👿',
  '💀',
  '☠️',
  '💩',
  '🤡',
  '👹',
  '👺',
  '👻',
  '👽',
  '👾',
  '🤖',
  '😺',
  '😸',
  '😹',
  '😻',
  '😼',
  '😽',
  '🙀',
  '😿',
  '😾',
  '💋',
  '👋',
  '🤚',
  '🖐️',
  '✋',
  '🖖',
  '👌',
  '🤌',
  '🤏',
  '✌️',
  '🤞',
  '🤟',
  '🤘',
  '🤙',
  '👈',
  '👉',
  '👆',
  '🖕',
  '👇',
  '☝️',
  '👍',
  '👎',
  '✊',
  '👊',
  '🤛',
  '🤜',
  '👏',
  '🙌',
  '👐',
  '🤲',
  '🤝',
  '🙏',
  '✍️',
  '💅',
  '🤳',
  '💪',
  '🦾',
  '🦿',
  '🦵',
  '🦶',
  '👂',
  '🦻',
  '👃',
  '🧠',
  '🫀',
  '🫁',
  '🦷',
  '🦴',
  '👀',
  '👁️',
  '👅',
  '👄',
  '👶',
  '🧒',
  '👦',
  '👧',
  '🧑',
  '👱',
  '👨',
  '🧔',
  '👨‍🦰',
  '👨‍🦱',
  '👨‍🦳',
  '👨‍🦲',
  '👩',
  '👩‍🦰',
  '🧑‍🦰',
  '👩‍🦱',
  '🧑‍🦱',
  '👩‍🦳',
  '🧑‍🦳',
  '👩‍🦲',
  '🧑‍🦲',
  '👱‍♀️',
  '👱‍♂️',
  '🧓',
  '👴',
  '👵',
  '🙍',
  '🙍‍♂️',
  '🙍‍♀️',
  '🙎',
  '🙎‍♂️',
  '🙎‍♀️',
  '🙅',
  '🙅‍♂️',
  '🙅‍♀️',
  '🙆',
  '🙆‍♂️',
  '🙆‍♀️',
  '💁',
  '💁‍♂️',
  '💁‍♀️',
  '🙋',
  '🙋‍♂️',
  '🙋‍♀️',
  '🧏',
  '🧏‍♂️',
  '🧏‍♀️',
  '🙇',
  '🙇‍♂️',
  '🙇‍♀️',
  '🤦',
  '🤦‍♂️',
  '🤦‍♀️',
  '🤷',
  '🤷‍♂️',
  '🤷‍♀️',
  '🧑‍⚕️',
  '👨‍⚕️',
  '👩‍⚕️',
  '🧑‍🎓',
  '👨‍🎓',
  '👩‍🎓',
  '🧑‍🏫',
  '👨‍🏫',
  '👩‍🏫',
  '🧑‍⚖️',
  '👨‍⚖️',
  '👩‍⚖️',
  '🧑‍🌾',
  '👨‍🌾',
  '👩‍🌾',
  '🧑‍🍳',
  '👨‍🍳',
  '👩‍🍳',
  '🧑‍🔧',
  '👨‍🔧',
  '👩‍🔧',
  '🧑‍🏭',
  '👨‍🏭',
  '👩‍🏭',
  '🧑‍💼',
  '👨‍💼',
  '👩‍💼',
  '🧑‍🔬',
  '👨‍🔬',
  '👩‍🔬',
  '🧑‍💻',
  '👨‍💻',
  '👩‍💻',
  '🧑‍🎤',
  '👨‍🎤',
  '👩‍🎤',
  '🧑‍🎨',
  '👨‍🎨',
  '👩‍🎨',
  '🧑‍✈️',
  '👨‍✈️',
  '👩‍✈️',
  '🧑‍🚀',
  '👨‍🚀',
  '👩‍🚀',
  '👨🏽‍🚀',
  '🧑‍🚒',
  '👨‍🚒',
  '👩‍🚒',
  '👮',
  '👮‍♂️',
  '👮‍♀️',
  '🕵️',
  '🕵️‍♂️',
  '🕵️‍♀️',
  '💂',
  '💂‍♂️',
  '💂‍♀️',
  '🥷',
  '👷',
  '👷‍♂️',
  '👷‍♀️',
  '🤴',
  '👸',
  '👳',
  '👳‍♂️',
  '👳‍♀️',
  '👲',
  '🧕',
  '🤵',
  '🤵‍♂️',
  '🤵‍♀️',
  '👰',
  '👰‍♂️',
  '👰‍♀️',
  '🤰',
  '🤱',
  '👩‍🍼',
  '👨‍🍼',
  '🧑‍🍼',
  '👼',
  '🎅',
  '🤶',
  '🧑‍🎄',
  '🦸',
  '🦸‍♂️',
  '🦸‍♀️',
  '🦹',
  '🦹‍♂️',
  '🦹‍♀️',
  '🧙',
  '🧙‍♂️',
  '🧙🏼‍♂️',
  '🧙‍♀️',
  '🧚',
  '🧚‍♂️',
  '🧚‍♀️',
  '🧛',
  '🧛‍♂️',
  '🧛‍♀️',
  '🧜',
  '🧜‍♂️',
  '🧜‍♀️',
  '🧝',
  '🧝‍♂️',
  '🧝‍♀️',
  '🧞',
  '🧞‍♂️',
  '🧞‍♀️',
  '🧟',
  '🧟‍♂️',
  '🧟‍♀️',
  '💆',
  '💆‍♂️',
  '💆‍♀️',
  '💇',
  '💇‍♂️',
  '💇‍♀️',
  '🚶',
  '🚶‍♂️',
  '🚶‍♀️',
  '🧍',
  '🧍‍♂️',
  '🧍‍♀️',
  '🧎',
  '🧎‍♂️',
  '🧎‍♀️',
  '🧑‍🦯',
  '👨‍🦯',
  '👩‍🦯',
  '🧑‍🦼',
  '👨‍🦼',
  '👩‍🦼',
  '🧑‍🦽',
  '👨‍🦽',
  '👩‍🦽',
  '🏃',
  '🏃‍♂️',
  '🏃‍♀️',
  '💃',
  '🕺',
  '🕴️',
  '👯',
  '👯‍♂️',
  '👯‍♀️',
  '🧖',
  '🧖‍♂️',
  '🧖‍♀️',
  '🧘',
  '🧑‍🤝‍🧑',
  '👭',
  '👫',
  '👬',
  '💏',
  '👩‍❤️‍💋‍👨',
  '👨‍❤️‍💋‍👨',
  '👩‍❤️‍💋‍👩',
  '💑',
  '👩‍❤️‍👨',
  '👨‍❤️‍👨',
  '👩‍❤️‍👩',
  '👪',
  '👨‍👩‍👦',
  '👨‍👩‍👧',
  '👨‍👩‍👧‍👦',
  '👨‍👩‍👦‍👦',
  '👨‍👩‍👧‍👧',
  '👨‍👨‍👦',
  '👨‍👨‍👧',
  '👨‍👨‍👧‍👦',
  '👨‍👨‍👦‍👦',
  '👨‍👨‍👧‍👧',
  '👩‍👩‍👦',
  '👩‍👩‍👧',
  '👩‍👩‍👧‍👦',
  '👩‍👩‍👦‍👦',
  '👩‍👩‍👧‍👧',
  '👨‍👦',
  '👨‍👦‍👦',
  '👨‍👧',
  '👨‍👧‍👦',
  '👨‍👧‍👧',
  '👩‍👦',
  '👩‍👦‍👦',
  '👩‍👧',
  '👩‍👧‍👦',
  '👩‍👧‍👧',
  '🗣️',
  '👤',
  '👥',
  '🫂',
  '👣',
  '🧳',
  '🌂',
  '☂️',
  '🎃',
  '🧵',
  '🧶',
  '👓',
  '🕶️',
  '🥽',
  '🥼',
  '🦺',
  '👔',
  '👕',
  '👖',
  '🧣',
  '🧤',
  '🧥',
  '🧦',
  '👗',
  '👘',
  '🥻',
  '🩱',
  '🩲',
  '🩳',
  '👙',
  '👚',
  '👛',
  '👜',
  '👝',
  '🎒',
  '🩴',
  '👞',
  '👟',
  '🥾',
  '🥿',
  '👠',
  '👡',
  '🩰',
  '👢',
  '👑',
  '👒',
  '🎩',
  '🎓',
  '🧢',
  '🪖',
  '⛑️',
  '💄',
  '💍',
  '💼',
  '🩸',

  '🙈',
  '🙉',
  '🙊',
  '💥',
  '💫',
  '💦',
  '💨',
  '🐵',
  '🐒',
  '🦍',
  '🦧',
  '🐶',
  '🐕',
  '🦮',
  '🐕‍🦺',
  '🐩',
  '🐺',
  '🦊',
  '🦝',
  '🐱',
  '🐈',
  '🐈‍⬛',
  '🦁',
  '🐯',
  '🐅',
  '🐆',
  '🐴',
  '🐎',
  '🦄',
  '🦓',
  '🦌',
  '🦬',
  '🐮',
  '🐂',
  '🐃',
  '🐄',
  '🐷',
  '🐖',
  '🐗',
  '🐽',
  '🐏',
  '🐑',
  '🐐',
  '🐪',
  '🐫',
  '🦙',
  '🦒',
  '🐘',
  '🦣',
  '🦏',
  '🦛',
  '🐭',
  '🐁',
  '🐀',
  '🐹',
  '🐰',
  '🐇',
  '🐿️',
  '🦫',
  '🦔',
  '🦇',
  '🐻',
  '🐻‍❄️',
  '🐨',
  '🐼',
  '🦥',
  '🦦',
  '🦨',
  '🦘',
  '🦡',
  '🐾',
  '🦃',
  '🐔',
  '🐓',
  '🐣',
  '🐤',
  '🐥',
  '🐦',
  '🐧',
  '🕊️',
  '🦅',
  '🦆',
  '🦢',
  '🦉',
  '🦤',
  '🪶',
  '🦩',
  '🦚',
  '🦜',
  '🐸',
  '🐊',
  '🐢',
  '🦎',
  '🐍',
  '🐲',
  '🐉',
  '🦕',
  '🦖',
  '🐳',
  '🐋',
  '🐬',
  '🦭',
  '🐟',
  '🐠',
  '🐡',
  '🦈',
  '🐙',
  '🐚',
  '🐌',
  '🦋',
  '🐛',
  '🐜',
  '🐝',
  '🪲',
  '🐞',
  '🦗',
  '🪳',
  '🕷️',
  '🕸️',
  '🦂',
  '🦟',
  '🪰',
  '🪱',
  '🦠',
  '💐',
  '🌸',
  '💮',
  '🏵️',
  '🌹',
  '🥀',
  '🌺',
  '🌻',
  '🌼',
  '🌷',
  '🌱',
  '🪴',
  '🌲',
  '🌳',
  '🌴',
  '🌵',
  '🌾',
  '🌿',
  '☘️',
  '🍀',
  '🍁',
  '🍂',
  '🍃',
  '🍄',
  '🌰',
  '🦀',
  '🦞',
  '🦐',
  '🦑',
  '🌍',
  '🌎',
  '🌏',
  '🌐',
  '🪨',
  '🌑',
  '🌒',
  '🌓',
  '🌔',
  '🌕',
  '🌖',
  '🌗',
  '🌘',
  '🌙',
  '🌚',
  '🌛',
  '🌜',
  '☀️',
  '🌝',
  '🌞',
  '⭐',
  '🌟',
  '🌠',
  '☁️',
  '⛅',
  '⛈️',
  '🌤️',
  '🌥️',
  '🌦️',
  '🌧️',
  '🌨️',
  '🌩️',
  '🌪️',
  '🌫️',
  '🌬️',
  '🌈',
  '☂️',
  '☔',
  '⚡',
  '❄️',
  '☃️',
  '⛄',
  '☄️',
  '🔥',
  '💧',
  '🌊',
  '🎄',
  '✨',
  '🎋',
  '🎍',

  '🍇',
  '🍈',
  '🍉',
  '🍊',
  '🍋',
  '🍌',
  '🍍',
  '🥭',
  '🍎',
  '🍏',
  '🍐',
  '🍑',
  '🍒',
  '🍓',
  '🫐',
  '🥝',
  '🍅',
  '🫒',
  '🥥',
  '🥑',
  '🍆',
  '🥔',
  '🥕',
  '🌽',
  '🌶️',
  '🫑',
  '🥒',
  '🥬',
  '🥦',
  '🧄',
  '🧅',
  '🍄',
  '🥜',
  '🌰',
  '🍞',
  '🥐',
  '🥖',
  '🫓',
  '🥨',
  '🥯',
  '🥞',
  '🧇',
  '🧀',
  '🍖',
  '🍗',
  '🥩',
  '🥓',
  '🍔',
  '🍟',
  '🍕',
  '🌭',
  '🥪',
  '🌮',
  '🌯',
  '🫔',
  '🥙',
  '🧆',
  '🥚',
  '🍳',
  '🥘',
  '🍲',
  '🫕',
  '🥣',
  '🥗',
  '🍿',
  '🧈',
  '🧂',
  '🥫',
  '🍱',
  '🍘',
  '🍙',
  '🍚',
  '🍛',
  '🍜',
  '🍝',
  '🍠',
  '🍢',
  '🍣',
  '🍤',
  '🍥',
  '🥮',
  '🍡',
  '🥟',
  '🥠',
  '🥡',
  '🦪',
  '🍦',
  '🍧',
  '🍨',
  '🍩',
  '🍪',
  '🎂',
  '🍰',
  '🧁',
  '🥧',
  '🍫',
  '🍬',
  '🍭',
  '🍮',
  '🍯',
  '🍼',
  '🥛',
  '☕',
  '🫖',
  '🍵',
  '🍶',
  '🍾',
  '🍷',
  '🍸',
  '🍹',
  '🍺',
  '🍻',
  '🥂',
  '🥃',
  '🥤',
  '🧋',
  '🧃',
  '🧉',
  '🧊',
  '🥢',
  '🍽️',
  '🍴',
  '🥄',

  '🕴️',
  '🧗',
  '🧗‍♂️',
  '🧗‍♀️',
  '🤺',
  '🏇',
  '⛷️',
  '🏂',
  '🏌️',
  '🏌️‍♂️',
  '🏌️‍♀️',
  '🏄',
  '🏄‍♂️',
  '🏄‍♀️',
  '🚣',
  '🚣‍♂️',
  '🚣‍♀️',
  '🏊',
  '🏊‍♂️',
  '🏊‍♀️',
  '⛹️',
  '⛹️‍♂️',
  '⛹️‍♀️',
  '🏋️',
  '🏋️‍♂️',
  '🏋️‍♀️',
  '🚴',
  '🚴‍♂️',
  '🚴‍♀️',
  '🚵',
  '🚵‍♂️',
  '🚵‍♀️',
  '🤸',
  '🤸‍♂️',
  '🤸‍♀️',
  '🤼',
  '🤼‍♂️',
  '🤼‍♀️',
  '🤽',
  '🤽‍♂️',
  '🤽‍♀️',
  '🤾',
  '🤾‍♂️',
  '🤾‍♀️',
  '🤹',
  '🤹‍♂️',
  '🤹‍♀️',
  '🧘',
  '🧘‍♂️',
  '🧘‍♀️',
  '🎪',
  '🛹',
  '🛼',
  '🛶',
  '🎗️',
  '🎟️',
  '🎫',
  '🎖️',
  '🏆',
  '🏅',
  '⚽',
  '⚾',
  '🥎',
  '🏀',
  '🏐',
  '🏈',
  '🏉',
  '🎾',
  '🥏',
  '🎳',
  '🏏',
  '🏑',
  '🏒',
  '🥍',
  '🏓',
  '🏸',
  '🥊',
  '🥋',
  '🥅',
  '⛳',
  '⛸️',
  '🎣',
  '🎽',
  '🎿',
  '🛷',
  '🥌',
  '🎯',
  '🎱',
  '🎮',
  '🎰',
  '🎲',
  '🧩',
  '♟️',
  '🎭',
  '🎨',
  '🧵',
  '🧶',
  '🎼',
  '🎤',
  '🎧',
  '🎷',
  '🪗',
  '🎸',
  '🎹',
  '🎺',
  '🎻',
  '🥁',
  '🪘',
  '🎬',
  '🏹',

  '🚣',
  '🗾',
  '🏔️',
  '⛰️',
  '🌋',
  '🗻',
  '🏕️',
  '🏖️',
  '🏜️',
  '🏝️',
  '🏞️',
  '🏟️',
  '🏛️',
  '🏗️',
  '🛖',
  '🏘️',
  '🏚️',
  '🏠',
  '🏡',
  '🏢',
  '🏣',
  '🏤',
  '🏥',
  '🏦',
  '🏨',
  '🏩',
  '🏪',
  '🏫',
  '🏬',
  '🏭',
  '🏯',
  '🏰',
  '💒',
  '🗼',
  '🗽',
  '⛪',
  '🕌',
  '🛕',
  '🕍',
  '⛩️',
  '🕋',
  '⛲',
  '⛺',
  '🌁',
  '🌃',
  '🏙️',
  '🌄',
  '🌅',
  '🌆',
  '🌇',
  '🌉',
  '🎠',
  '🎡',
  '🎢',
  '🚂',
  '🚃',
  '🚄',
  '🚅',
  '🚆',
  '🚇',
  '🚈',
  '🚉',
  '🚊',
  '🚝',
  '🚞',
  '🚋',
  '🚌',
  '🚍',
  '🚎',
  '🚐',
  '🚑',
  '🚒',
  '🚓',
  '🚔',
  '🚕',
  '🚖',
  '🚗',
  '🚘',
  '🚙',
  '🛻',
  '🚚',
  '🚛',
  '🚜',
  '🏎️',
  '🏍️',
  '🛵',
  '🛺',
  '🚲',
  '🛴',
  '🚏',
  '🛣️',
  '🛤️',
  '⛽',
  '🚨',
  '🚥',
  '🚦',
  '🚧',
  '⚓',
  '⛵',
  '🚤',
  '🛳️',
  '⛴️',
  '🛥️',
  '🚢',
  '✈️',
  '🛩️',
  '🛫',
  '🛬',
  '🪂',
  '💺',
  '🚁',
  '🚟',
  '🚠',
  '🚡',
  '🛰️',
  '🚀',
  '🛸',
  '🪐',
  '🌠',
  '🌌',
  '⛱️',
  '🎆',
  '🎇',
  '🎑',
  '💴',
  '💵',
  '💶',
  '💷',
  '🗿',
  '🛂',
  '🛃',
  '🛄',
  '🛅',

  '💌',
  '🕳️',
  '💣',
  '🛀',
  '🛌',
  '🔪',
  '🏺',
  '🗺️',
  '🧭',
  '🧱',
  '💈',
  '🦽',
  '🦼',
  '🛢️',
  '🛎️',
  '🧳',
  '⌛',
  '⏳',
  '⌚',
  '⏰',
  '⏱️',
  '⏲️',
  '🕰️',
  '🌡️',
  '⛱️',
  '🧨',
  '🎈',
  '🎉',
  '🎊',
  '🎎',
  '🎏',
  '🎐',
  '🧧',
  '🎀',
  '🎁',
  '🤿',
  '🪀',
  '🪁',
  '🔮',
  '🪄',
  '🧿',
  '🕹️',
  '🧸',
  '🪅',
  '🪆',
  '🖼️',
  '🧵',
  '🪡',
  '🧶',
  '🪢',
  '🛍️',
  '📿',
  '💎',
  '📯',
  '🎙️',
  '🎚️',
  '🎛️',
  '📻',
  '🪕',
  '📱',
  '📲',
  '☎️',
  '📞',
  '📟',
  '📠',
  '🔋',
  '🔌',
  '💻',
  '🖥️',
  '🖨️',
  '⌨️',
  '🖱️',
  '🖲️',
  '💽',
  '💾',
  '💿',
  '📀',
  '🧮',
  '🎥',
  '🎞️',
  '📽️',
  '📺',
  '📷',
  '📸',
  '📹',
  '📼',
  '🔍',
  '🔎',
  '🕯️',
  '💡',
  '🔦',
  '🏮',
  '🪔',
  '📔',
  '📕',
  '📖',
  '📗',
  '📘',
  '📙',
  '📚',
  '📓',
  '📒',
  '📃',
  '📜',
  '📄',
  '📰',
  '🗞️',
  '📑',
  '🔖',
  '🏷️',
  '💰',
  '🪙',
  '💴',
  '💵',
  '💶',
  '💷',
  '💸',
  '💳',
  '🧾',
  '✉️',
  '📧',
  '📨',
  '📩',
  '📤',
  '📥',
  '📦',
  '📫',
  '📪',
  '📬',
  '📭',
  '📮',
  '🗳️',
  '✏️',
  '✒️',
  '🖋️',
  '🖊️',
  '🖌️',
  '🖍️',
  '📝',
  '📁',
  '📂',
  '🗂️',
  '📅',
  '📆',
  '🗒️',
  '🗓️',
  '📇',
  '📈',
  '📉',
  '📊',
  '📋',
  '📌',
  '📍',
  '📎',
  '🖇️',
  '📏',
  '📐',
  '✂️',
  '🗃️',
  '🗄️',
  '🗑️',
  '🔒',
  '🔓',
  '🔏',
  '🔐',
  '🔑',
  '🗝️',
  '🔨',
  '🪓',
  '⛏️',
  '⚒️',
  '🛠️',
  '🗡️',
  '⚔️',
  '🔫',
  '🪃',
  '🛡️',
  '🪚',
  '🔧',
  '🪛',
  '🔩',
  '⚙️',
  '🗜️',
  '⚖️',
  '🦯',
  '🔗',
  '⛓️',
  '🪝',
  '🧰',
  '🧲',
  '🪜',
  '⚗️',
  '🧪',
  '🧫',
  '🧬',
  '🔬',
  '🔭',
  '📡',
  '💉',
  '🩸',
  '💊',
  '🩹',
  '🩺',
  '🚪',
  '🪞',
  '🪟',
  '🛏️',
  '🛋️',
  '🪑',
  '🚽',
  '🪠',
  '🚿',
  '🛁',
  '🪤',
  '🪒',
  '🧴',
  '🧷',
  '🧹',
  '🧺',
  '🧻',
  '🪣',
  '🧼',
  '🪥',
  '🧽',
  '🧯',
  '🛒',
  '🚬',
  '⚰️',
  '🪦',
  '⚱️',
  '🗿',
  '🪧',
  '🚰',

  '💘',
  '💝',
  '💖',
  '💗',
  '💓',
  '💞',
  '💕',
  '💟',
  '❣️',
  '💔',
  '❤️',
  '🧡',
  '💛',
  '💚',
  '💙',
  '💜',
  '🤎',
  '🖤',
  '🤍',
  '💯',
  '💢',
  '💬',
  '👁️‍🗨️',
  '🗨️',
  '🗯️',
  '💭',
  '💤',
  '💮',
  '♨️',
  '💈',
  '🛑',
  '🕛',
  '🕧',
  '🕐',
  '🕜',
  '🕑',
  '🕝',
  '🕒',
  '🕞',
  '🕓',
  '🕟',
  '🕔',
  '🕠',
  '🕕',
  '🕡',
  '🕖',
  '🕢',
  '🕗',
  '🕣',
  '🕘',
  '🕤',
  '🕙',
  '🕥',
  '🕚',
  '🕦',
  '🌀',
  '♠️',
  '♥️',
  '♦️',
  '♣️',
  '🃏',
  '🀄',
  '🎴',
  '🔇',
  '🔈',
  '🔉',
  '🔊',
  '📢',
  '📣',
  '📯',
  '🔔',
  '🔕',
  '🎵',
  '🎶',
  '💹',
  '🛗',
  '🏧',
  '🚮',
  '🚰',
  '♿',
  '🚹',
  '🚺',
  '🚻',
  '🚼',
  '🚾',
  '⚠️',
  '🚸',
  '⛔',
  '🚫',
  '🚳',
  '🚭',
  '🚯',
  '🚱',
  '🚷',
  '📵',
  '🔞',
  '☢️',
  '☣️',
  '⬆️',
  '↗️',
  '➡️',
  '↘️',
  '⬇️',
  '↙️',
  '⬅️',
  '↖️',
  '↕️',
  '↔️',
  '↩️',
  '↪️',
  '⤴️',
  '⤵️',
  '🔃',
  '🔄',
  '🔙',
  '🔚',
  '🔛',
  '🔜',
  '🔝',
  '🛐',
  '⚛️',
  '🕉️',
  '✡️',
  '☸️',
  '☯️',
  '✝️',
  '☦️',
  '☪️',
  '☮️',
  '🕎',
  '🔯',
  '♈',
  '♉',
  '♊',
  '♋',
  '♌',
  '♍',
  '♎',
  '♏',
  '♐',
  '♑',
  '♒',
  '♓',
  '⛎',
  '🔀',
  '🔁',
  '🔂',
  '▶️',
  '⏩',
  '⏭️',
  '⏯️',
  '◀️',
  '⏪',
  '⏮️',
  '🔼',
  '⏫',
  '🔽',
  '⏬',
  '⏸️',
  '⏹️',
  '⏺️',
  '⏏️',
  '🎦',
  '🔅',
  '🔆',
  '📶',
  '📳',
  '📴',
  '♀️',
  '♂️',
  '✖️',
  '➕',
  '➖',
  '➗',
  '♾️',
  '‼️',
  '⁉️',
  '❓',
  '❔',
  '❕',
  '❗',
  '〰️',
  '💱',
  '💲',
  '⚕️',
  '♻️',
  '⚜️',
  '🔱',
  '📛',
  '🔰',
  '⭕',
  '✅',
  '☑️',
  '✔️',
  '❌',
  '❎',
  '➰',
  '➿',
  '〽️',
  '✳️',
  '✴️',
  '❇️',
  '©️',
  '®️',
  '™️',
  '#️⃣',
  '*️⃣',
  '0️⃣',
  '1️⃣',
  '2️⃣',
  '3️⃣',
  '4️⃣',
  '5️⃣',
  '6️⃣',
  '7️⃣',
  '8️⃣',
  '9️⃣',
  '🔟',
  '🔠',
  '🔡',
  '🔢',
  '🔣',
  '🔤',
  '🅰️',
  '🆎',
  '🅱️',
  '🆑',
  '🆒',
  '🆓',
  'ℹ️',
  '🆔',
  'Ⓜ️',
  '🆕',
  '🆖',
  '🅾️',
  '🆗',
  '🅿️',
  '🆘',
  '🆙',
  '🆚',
  '🈁',
  '🈂️',
  '🈷️',
  '🈶',
  '🈯',
  '🉐',
  '🈹',
  '🈚',
  '🈲',
  '🉑',
  '🈸',
  '🈴',
  '🈳',
  '㊗️',
  '㊙️',
  '🈺',
  '🈵',
  '🔴',
  '🟠',
  '🟡',
  '🟢',
  '🔵',
  '🟣',
  '🟤',
  '⚫',
  '⚪',
  '🟥',
  '🟧',
  '🟨',
  '🟩',
  '🟦',
  '🟪',
  '🟫',
  '⬛',
  '⬜',
  '◼️',
  '◻️',
  '◾',
  '◽',
  '▪️',
  '▫️',
  '🔶',
  '🔷',
  '🔸',
  '🔹',
  '🔺',
  '🔻',
  '💠',
  '🔘',
  '🔳',
  '🔲',

  '🏁',
  '🚩',
  '🎌',
  '🏴',
  '🏳️',
  '🏳️‍🌈',
  '🏳️‍⚧️',
  '🏴‍☠️',
  '🇦🇨',
  '🇦🇩',
  '🇦🇪',
  '🇦🇫',
  '🇦🇬',
  '🇦🇮',
  '🇦🇱',
  '🇦🇲',
  '🇦🇴',
  '🇦🇶',
  '🇦🇷',
  '🇦🇸',
  '🇦🇹',
  '🇦🇺',
  '🇦🇼',
  '🇦🇽',
  '🇦🇿',
  '🇧🇦',
  '🇧🇧',
  '🇧🇩',
  '🇧🇪',
  '🇧🇫',
  '🇧🇬',
  '🇧🇭',
  '🇧🇮',
  '🇧🇯',
  '🇧🇱',
  '🇧🇲',
  '🇧🇳',
  '🇧🇴',
  '🇧🇶',
  '🇧🇷',
  '🇧🇸',
  '🇧🇹',
  '🇧🇻',
  '🇧🇼',
  '🇧🇾',
  '🇧🇿',
  '🇨🇦',
  '🇨🇨',
  '🇨🇩',
  '🇨🇫',
  '🇨🇬',
  '🇨🇭',
  '🇨🇮',
  '🇨🇰',
  '🇨🇱',
  '🇨🇲',
  '🇨🇳',
  '🇨🇴',
  '🇨🇵',
  '🇨🇷',
  '🇨🇺',
  '🇨🇻',
  '🇨🇼',
  '🇨🇽',
  '🇨🇾',
  '🇨🇿',
  '🇩🇪',
  '🇩🇬',
  '🇩🇯',
  '🇩🇰',
  '🇩🇲',
  '🇩🇴',
  '🇩🇿',
  '🇪🇦',
  '🇪🇨',
  '🇪🇪',
  '🇪🇬',
  '🇪🇭',
  '🇪🇷',
  '🇪🇸',
  '🇪🇹',
  '🇪🇺',
  '🇫🇮',
  '🇫🇯',
  '🇫🇰',
  '🇫🇲',
  '🇫🇴',
  '🇫🇷',
  '🇬🇦',
  '🇬🇧',
  '🇬🇩',
  '🇬🇪',
  '🇬🇫',
  '🇬🇬',
  '🇬🇭',
  '🇬🇮',
  '🇬🇱',
  '🇬🇲',
  '🇬🇳',
  '🇬🇵',
  '🇬🇶',
  '🇬🇷',
  '🇬🇸',
  '🇬🇹',
  '🇬🇺',
  '🇬🇼',
  '🇬🇾',
  '🇭🇰',
  '🇭🇲',
  '🇭🇳',
  '🇭🇷',
  '🇭🇹',
  '🇭🇺',
  '🇮🇨',
  '🇮🇩',
  '🇮🇪',
  '🇮🇱',
  '🇮🇲',
  '🇮🇳',
  '🇮🇴',
  '🇮🇶',
  '🇮🇷',
  '🇮🇸',
  '🇮🇹',
  '🇯🇪',
  '🇯🇲',
  '🇯🇴',
  '🇯🇵',
  '🇰🇪',
  '🇰🇬',
  '🇰🇭',
  '🇰🇮',
  '🇰🇲',
  '🇰🇳',
  '🇰🇵',
  '🇰🇷',
  '🇰🇼',
  '🇰🇾',
  '🇰🇿',
  '🇱🇦',
  '🇱🇧',
  '🇱🇨',
  '🇱🇮',
  '🇱🇰',
  '🇱🇷',
  '🇱🇸',
  '🇱🇹',
  '🇱🇺',
  '🇱🇻',
  '🇱🇾',
  '🇲🇦',
  '🇲🇨',
  '🇲🇩',
  '🇲🇪',
  '🇲🇫',
  '🇲🇬',
  '🇲🇭',
  '🇲🇰',
  '🇲🇱',
  '🇲🇲',
  '🇲🇳',
  '🇲🇴',
  '🇲🇵',
  '🇲🇶',
  '🇲🇷',
  '🇲🇸',
  '🇲🇹',
  '🇲🇺',
  '🇲🇻',
  '🇲🇼',
  '🇲🇽',
  '🇲🇾',
  '🇲🇿',
  '🇳🇦',
  '🇳🇨',
  '🇳🇪',
  '🇳🇫',
  '🇳🇬',
  '🇳🇮',
  '🇳🇱',
  '🇳🇴',
  '🇳🇵',
  '🇳🇷',
  '🇳🇺',
  '🇳🇿',
  '🇴🇲',
  '🇵🇦',
  '🇵🇪',
  '🇵🇫',
  '🇵🇬',
  '🇵🇭',
  '🇵🇰',
  '🇵🇱',
  '🇵🇲',
  '🇵🇳',
  '🇵🇷',
  '🇵🇸',
  '🇵🇹',
  '🇵🇼',
  '🇵🇾',
  '🇶🇦',
  '🇷🇪',
  '🇷🇴',
  '🇷🇸',
  '🇷🇺',
  '🇷🇼',
  '🇸🇦',
  '🇸🇧',
  '🇸🇨',
  '🇸🇩',
  '🇸🇪',
  '🇸🇬',
  '🇸🇭',
  '🇸🇮',
  '🇸🇯',
  '🇸🇰',
  '🇸🇱',
  '🇸🇲',
  '🇸🇳',
  '🇸🇴',
  '🇸🇷',
  '🇸🇸',
  '🇸🇹',
  '🇸🇻',
  '🇸🇽',
  '🇸🇾',
  '🇸🇿',
  '🇹🇦',
  '🇹🇨',
  '🇹🇩',
  '🇹🇫',
  '🇹🇬',
  '🇹🇭',
  '🇹🇯',
  '🇹🇰',
  '🇹🇱',
  '🇹🇲',
  '🇹🇳',
  '🇹🇴',
  '🇹🇷',
  '🇹🇹',
  '🇹🇻',
  '🇹🇿',
  '🇺🇦',
  '🇺🇬',
  '🇺🇲',
  '🇺🇳',
  '🇺🇸',
  '🇺🇾',
  '🇺🇿',
  '🇻🇦',
  '🇻🇨',
  '🇻🇪',
  '🇻🇬',
  '🇻🇮',
  '🇻🇳',
  '🇻🇺',
  '🇼🇫',
  '🇼🇸',
  '🇽🇰',
  '🇾🇪',
  '🇾🇹',
  '🇿🇦',
  '🇿🇲',
  '🇿🇼',
  '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  '🏴󠁧󠁢󠁳󠁣󠁴󠁿',
  '🏴󠁧󠁢󠁷󠁬󠁳󠁿',
] as const;

export type IEmojiTypes = (typeof emojiList)[number];

export const colors = [];

export type IAvatarInfo = {
  img:
    | IHdWalletAvatarImageNames
    | IHwWalletAvatarImageNames
    | IOthersWalletAvatarImageNames;
  emoji?: IEmojiTypes | 'img';
  bgColor?: string;
};

export const defaultAvatar: IAvatarInfo = {
  img: 'bear',
  emoji: undefined,
  bgColor: undefined,
};

function getRandomInt(max: number) {
  return Math.floor(Math.random() * max);
}

export function randomAvatar(): IAvatarInfo {
  return {
    img: HdWalletAvatarImageNames[
      getRandomInt(HdWalletAvatarImageNames.length)
    ],
    emoji: undefined,
    bgColor: undefined,
  };
}
