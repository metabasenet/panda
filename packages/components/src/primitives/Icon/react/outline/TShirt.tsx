import Svg, { SvgProps, Path } from 'react-native-svg';
const SvgTShirt = (props: SvgProps) => (
  <Svg fill="none" viewBox="0 0 24 24" accessibilityRole="image" {...props}>
    <Path
      fill="#000"
      fillRule="evenodd"
      d="M9.95 3.782a1 1 0 0 0-1.344-.609L3.297 5.448a3 3 0 0 0-1.664 3.706l.226.678a3.002 3.002 0 0 0 3.14 2.038V18a3 3 0 0 0 3 3h8a3 3 0 0 0 3-3v-6.13a3.002 3.002 0 0 0 3.142-2.038l.226-.678a3 3 0 0 0-1.665-3.706l-5.308-2.275a1 1 0 0 0-1.345.609l-.002.006-.018.047a3.453 3.453 0 0 1-.481.844c-.356.456-.845.821-1.548.821-.703 0-1.192-.365-1.549-.82a3.453 3.453 0 0 1-.498-.892l-.003-.006Zm4.1 0ZM8.514 5.388l-4.43 1.899a1 1 0 0 0-.555 1.235l.226.677a1 1 0 0 0 1.35.6l.493-.215A1 1 0 0 1 7 10.5V18a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-7.5a1 1 0 0 1 1.401-.916l.494.216a1 1 0 0 0 1.35-.6l.225-.678a1 1 0 0 0-.555-1.235l-4.43-1.9c-.1.168-.22.346-.36.526C14.536 6.66 13.525 7.5 12 7.5s-2.538-.84-3.124-1.587c-.14-.18-.26-.358-.36-.525Z"
      clipRule="evenodd"
    />
  </Svg>
);
export default SvgTShirt;
