// For a detailed explanation regarding each configuration property, visit:
// https://jestjs.io/docs/en/configuration.html

module.exports = {
  // A set of global variables that need to be available in all test environments
  globals: {
    API_ENDPOINT: 'http://localhost:4567',
  },

  testURL: 'http://localhost:8001',

  // The test environment that will be used for testing
  testEnvironment: 'jsdom',

  // Indicates whether the coverage information should be collected while executing the test
  collectCoverage: false,

  // An array of regexp pattern strings used to skip coverage collection
  coveragePathIgnorePatterns: [ 'test.js$' ],

  // The glob patterns Jest uses to detect test files
  testMatch: [
    '<rootDir>/**/*.test.int.js',
  ],

  // An array of regexp pattern strings, matched against all module paths before considered 'visible' to the module loader
  modulePathIgnorePatterns: [
    '<rootDir>/node_modules',
  ],
}
