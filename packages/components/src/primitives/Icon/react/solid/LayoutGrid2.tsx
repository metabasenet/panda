import Svg, { SvgProps, Path } from 'react-native-svg';
const SvgLayoutGrid2 = (props: SvgProps) => (
  <Svg fill="none" viewBox="0 0 24 24" accessibilityRole="image" {...props}>
    <Path
      fill="currentColor"
      d="M7.161 3c-.527 0-.981 0-1.356.03-.395.033-.789.104-1.167.297a3 3 0 0 0-1.311 1.311c-.193.378-.264.772-.296 1.167C3 6.18 3 6.635 3 7.161V10a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H7.161Zm12.201.327c-.378-.193-.772-.264-1.167-.296A17.9 17.9 0 0 0 16.838 3H14a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V7.161c0-.527 0-.981-.03-1.356-.033-.395-.104-.789-.297-1.167a3 3 0 0 0-1.311-1.311ZM4 13a1 1 0 0 0-1 1v2.838c0 .528 0 .982.03 1.357.033.395.104.789.297 1.167a3 3 0 0 0 1.311 1.311c.378.193.772.264 1.167.296.375.031.83.031 1.356.031H10a1 1 0 0 0 1-1v-6a1 1 0 0 0-1-1H4Zm10 0a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h2.839c.527 0 .982 0 1.356-.03.395-.033.789-.104 1.167-.297a3 3 0 0 0 1.311-1.311c.193-.378.264-.772.296-1.167.031-.375.031-.83.031-1.356V14a1 1 0 0 0-1-1h-6Z"
    />
  </Svg>
);
export default SvgLayoutGrid2;
