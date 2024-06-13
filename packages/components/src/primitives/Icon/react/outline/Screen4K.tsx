import Svg, { SvgProps, Path } from 'react-native-svg';
const SvgScreen4K = (props: SvgProps) => (
  <Svg fill="none" viewBox="0 0 24 24" accessibilityRole="image" {...props}>
    <Path
      stroke="currentColor"
      strokeLinecap="square"
      strokeLinejoin="round"
      strokeWidth={2}
      d="M19 5H5a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2Z"
    />
    <Path
      fill="currentColor"
      d="M9.783 15.622c-.566 0-.976-.317-.976-.981v-.26H6.604c-.747 0-1.264-.473-1.264-1.156 0-.376.127-.772.4-1.26a44.28 44.28 0 0 1 1.436-2.393c.586-.923 1.064-1.24 1.87-1.24 1.03 0 1.714.571 1.714 1.436v3.027h.16c.543 0 .802.337.802.796s-.264.79-.806.79h-.156v.26c0 .664-.415.981-.977.981Zm-.918-2.744V9.836h-.039c-.708 1.035-1.22 1.855-1.792 2.983v.059h1.831Zm4.58 2.744c-.659 0-1.035-.39-1.035-1.084V9.416c0-.693.376-1.084 1.035-1.084.66 0 1.035.39 1.035 1.084v1.831h.04l2.163-2.446c.297-.332.566-.469.918-.469.542 0 .981.425.981.957 0 .313-.107.537-.4.85l-1.455 1.552 1.523 1.885c.356.44.508.752.508 1.045a.98.98 0 0 1-.996 1.001c-.445 0-.747-.166-1.084-.596l-1.582-2.006-.616.634v.884c0 .693-.376 1.084-1.035 1.084Z"
    />
  </Svg>
);
export default SvgScreen4K;
