const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        ttcommons: ['tt-commons-pro', 'sans-serif'],
        comma_base: ['common-base', 'sans-serif'],
        header: ['kudryashev-d-contrast', 'sans-serif']
      },
      colors: {
        'amber': '#E0CE8F'
      },
      borderColor: {
        'amber': '#E0CE8F'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries')
  ]
}
