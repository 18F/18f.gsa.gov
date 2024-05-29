/* eslint no-bitwise: 0 */
// WCAG Color Contrast functions
// Implements the WCAG color contrast procedure: https://www.w3.org/TR/WCAG20-TECHS/G18.html#G18-tests
// With gratitude to:
//   https://github.com/mkdynamic/wcag_color_contrast
//   https://blog.cristiana.tech/calculating-color-contrast-in-typescript-using-web-content-accessibility-guidelines-wcag

const humanReadableContrastRatio = (ratio) => {
  // SMELL: This is less readable than ideal.
  let digits = 0;

  if (ratio < 4) {
    digits = 1;
  } else if (ratio < 5) {
    digits = 2;
  } else {
    digits = 0;
  }
  return `${ratio.toFixed(digits)}:1`;
};

const hexToRgb = (hexParts) => {
  const hex = hexParts.slice(1);
  const value = parseInt(hex, 16);
  const r = (value >> 16) & 255;
  const g = (value >> 8) & 255;
  const b = value & 255;

  return [r, g, b];
};

const luminance = (hex) => {
  const [r8, g8, b8] = hexToRgb(hex);
  const [r, g, b] = [r8, g8, b8].map((component) => {
    const value = component / 255;
    return value <= 0.03928 ? value / 12.92 : ((value + 0.055) / 1.055) ** 2.4;
  });
  return r * 0.2126 + g * 0.7152 + b * 0.0722;
};

const contrastRatio = (hex1, hex2) => {
  const lum1 = luminance(hex1);
  const lum2 = luminance(hex2);
  let lighter = 0;
  let darker = 0;

  if (lum1 >= lum2) {
    lighter = lum1;
    darker = lum2;
  } else {
    darker = lum1;
    lighter = lum2;
  }
  return (lighter + 0.05) / (darker + 0.05);
};

module.exports = { contrastRatio, humanReadableContrastRatio };
