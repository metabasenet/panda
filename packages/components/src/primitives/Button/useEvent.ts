import { useCallback } from 'react';

import { debounce } from 'lodash';

import type { IButtonProps } from '..';
import type { GestureResponderEvent } from 'react-native';

export const useSharedPress = ({
  onPress,
  onPressDebounce = 0,
  onLongPress,
  stopPropagation = true,
}: IButtonProps) => {
  const handlePress = useCallback(
    (event: GestureResponderEvent) => {
      if (onPress && stopPropagation) {
        event.stopPropagation();
      }
      onPress?.(event);
    },
    [onPress, stopPropagation],
  );

  const handleLongPress = useCallback(
    (event: GestureResponderEvent) => {
      if (onLongPress && stopPropagation) {
        event.stopPropagation();
      }
      onLongPress?.(event);
    },
    [onLongPress, stopPropagation],
  );
  return {
    onPress: debounce(handlePress, onPressDebounce),
    onLongPress: handleLongPress,
  };
};
