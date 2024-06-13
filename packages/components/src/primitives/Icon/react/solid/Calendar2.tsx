import Svg, { SvgProps, Path } from 'react-native-svg';
const SvgCalendar2 = (props: SvgProps) => (
  <Svg fill="none" viewBox="0 0 24 24" accessibilityRole="image" {...props}>
    <Path
      fill="currentColor"
      d="M8 2a1 1 0 0 1 1 1v1h6V3a1 1 0 1 1 2 0v1h1a3 3 0 0 1 3 3v2H3V7a3 3 0 0 1 3-3h1V3a1 1 0 0 1 1-1ZM3 18v-7h18v7a3 3 0 0 1-3 3H6a3 3 0 0 1-3-3Z"
    />
  </Svg>
);
export default SvgCalendar2;
