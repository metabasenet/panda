import type { Ref } from 'react';
import { forwardRef } from 'react';

import { TextArea as TMTextArea, getFontSize } from 'tamagui';

import platformEnv from '@onekeyhq/shared/src/platformEnv';

import { useSelectionColor } from '../../hooks';
import { getSharedInputStyles } from '../Input/sharedStyles';

import type { IInputProps } from '../Input';
import type { TextAreaProps } from 'tamagui';

export type ITextAreaProps = Pick<
  IInputProps,
  'disabled' | 'editable' | 'error' | 'size'
> &
  Omit<TextAreaProps, 'size'>;

const defaultTextAlignVertical = platformEnv.isNative ? 'top' : undefined;
function BaseTextArea(
  {
    disabled,
    editable,
    error,
    size,
    textAlignVertical,
    ...props
  }: ITextAreaProps,
  ref: Ref<any>,
) {
  const sharedStyles = getSharedInputStyles({
    disabled,
    editable,
    error,
    size,
  });

  const selectionColor = useSelectionColor();

  return (
    <TMTextArea
      unstyled
      ref={ref}
      fontSize={getFontSize('$bodyLg')}
      px={sharedStyles.px}
      py={size === 'large' ? '$3.5' : '$2.5'}
      numberOfLines={3}
      bg={sharedStyles.backgroundColor}
      color={sharedStyles.color}
      borderRadius={sharedStyles.borderRadius}
      borderWidth={sharedStyles.borderWidth}
      borderColor={sharedStyles.borderColor}
      placeholderTextColor={sharedStyles.placeholderTextColor}
      disabled={disabled}
      selectionColor={selectionColor}
      cursor={sharedStyles.cursor}
      borderCurve="continuous"
      editable={editable}
      textAlignVertical={textAlignVertical || defaultTextAlignVertical}
      {...props}
    />
  );
}

export const TextArea = forwardRef(BaseTextArea);
