module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
    // defaultLineHeights: true,
    // standardFontWeights: true
  },
  purge: [],
  theme: {
    colors: {
      transparent: "transparent",
      current: "currentColor",
      black: "#000",
      white: "#fff",
      primary: {
        'base': '#2A9134',
        'dark': '#054A29',
      },
      secondary: '#FFA900',
      addition: '#F2F0E9',
      gray: {
        "100": "#f7fafc",
        "200": "#edf2f7",
        "300": "#e2e8f0",
        "400": "#cbd5e0",
        "500": "#a0aec0",
        "550": "#7E7E7E",
        "600": "#626262",
        "700": "#4a5568",
        "800": "#222222",
        "900": "#1a202c"
      },
      red: {
        "100": "#fff5f5",
        "200": "#fed7d7",
        "300": "#feb2b2",
        "400": "#fc8181",
        "500": "#f56565",
        "600": "#e53e3e",
        "700": "#c53030",
        "800": "#9b2c2c",
        "900": "#742a2a"
      },
      orange: {
        "100": "#fffaf0",
        "200": "#feebc8",
        "300": "#fbd38d",
        "400": "#f6ad55",
        "500": "#ed8936",
        "600": "#dd6b20",
        "700": "#c05621",
        "800": "#9c4221",
        "900": "#7b341e"
      },
      yellow: {
        "100": "#fffff0",
        "200": "#fefcbf",
        "300": "#faf089",
        "400": "#f6e05e",
        "500": "#ecc94b",
        "600": "#d69e2e",
        "700": "#b7791f",
        "800": "#975a16",
        "900": "#744210"
      },
      green: {
        "100": "#f0fff4",
        "200": "#c6f6d5",
        "300": "#9ae6b4",
        "400": "#68d391",
        "500": "#48bb78",
        "600": "#38a169",
        "700": "#2f855a",
        "800": "#276749",
        "900": "#22543d"
      }
      
    },
    lineClamp: {
      1: 1,
      2: 2,
      3: 3
    },

    extend: {
      screens: {
        xxl: "1440px",
        small: { max : '1279px'}
      },
      fontFamily: {
        display: [
          "\"Montserrat\"", 
          "sans-serif"
        ],
        body: [
          "\"Nunito Sans\"", 
          "sans-serif"
        ]
      },
      spacing: {
        "72": "18rem",
        "80": "20rem",
      },
      inset: {
       '1/2': '50%',
      }
    }
  },
  variants: {
    textColor: ['responsive', 'hover', 'focus', 'group-hover'],
    backgroundColor: ['responsive', 'hover', 'focus', 'group-hover']
  },
  plugins: [
    require('tailwindcss-line-clamp')
  ]
}
