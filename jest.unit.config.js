// For a detailed explanation regarding each configuration property, visit:
// https://jestjs.io/docs/en/configuration.html

module.exports = {
  // The paths to modules that run some code to configure or set up the testing environment before each test
  setupFiles: ['<rootDir>/test/unit.test.setup.js'],

  // A set of global variables that need to be available in all test environments
  globals: {
    API_ENDPOINT: 'http://localhost:4567',
    COOKIE_DOMAIN: 'localhost:8001',
    fetch: () => null,
    ANIMATIONS: true,
  },

  testURL: 'http://localhost:8001',

  // The test environment that will be used for testing
  testEnvironment: 'jsdom',

  // Indicates whether the coverage information should be collected while executing the test
  collectCoverage: false,

  // An array of regexp pattern strings used to skip coverage collection
  coveragePathIgnorePatterns: [ '.storybook', 'story.js$', 'test.js$', 'fileMock.js' ],

  // A map from regular expressions to module names that allow to stub out resources with a single module
  moduleNameMapper: {
    '\\.(png|svg)$': '<rootDir>/test/fileMock.js',
  },

  // The glob patterns Jest uses to detect test files
  testMatch: [
    '<rootDir>/src/**/*.test.js',
    '<rootDir>/test/unit/*_test.js',
    '<rootDir>/test/unit/**/*_test.js',
  ],

  // An array of regexp pattern strings, matched against all module paths before considered 'visible' to the module loader
  modulePathIgnorePatterns: [
    '<rootDir>/node_modules',
    '<rootDir>/src/api/*',
  ],
}
