# Anion

[![Ion Channel Status](https://api.ionchannel.io/v1/report/getBadge?project_id=71947498-72d7-4c82-9517-ac3b2bdf7859&branch=master)](http://console.ionchannel.io/)[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/ion-channel/anion/blob/master/LICENSE.md)
[![Release](https://img.shields.io/github/release/ion-channel/anion.svg)](https://github.com/ion-channel/anion/releases/latest)

A Node SDK for the Ion Channel API

# Requirements

[Request an api key](https://ionchannel.io/contact/)
You'll also need to define a value for a global variable `API_ENDPOINT`, such as [https://api.test.ionchannel.io](https://api.test.ionchannel.io)
Node version >=14.15.4

# Installation

# Versioning

The SDK will be versioned in accordance with [Semver 2.0.0](http://semver.org). See the [releases](https://github.com/ion-channel/anion/releases) section for the latest version.

It is always highly recommended to vendor the version you are using.

# License

This SDK is distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0). See [LICENSE.md](./LICENSE.md) for more information.

# Usage

This is intended to be used in a client side application. Instead of making `fetch` requests or using a library like `axios` (which is what this uses), you can import these services to invoke their methods, which will end up making http requests. If you'd rather make the http requests in a tool like a terminal, you might want to look at our [ion-connect](https://github.com/ion-channel/ion-connect)

# API Documentation

Each of the following entities can be imported into a module with javascript module syntax as named imports from 'anion'

example:
`import { Auth } from 'anion'`

A lot of the methods have a single argument as an object. This is essentialy a way in javascript to provide named arguments. As long as you provide a single argument as an object to those function calls that have the names of the keys that are required for those function calls, you can order those key-value pairs any way you want.

example:

```javascript
Rulesets.getAppliedRuleSet({
  analysisId: 'abc',
  projectId: 'foo',
  teamId: '123',
})

Rulesets.getAppliedRuleSet({
  teamId: '123',
  analysisId: 'abc',
  projectId: 'foo',
})
```

Both cases will yield the same result.

## types

- `Meta`:

  - limit: number, optional
  - offset: number
  - total_count: number

## API

[view the api documentation](https://github.com/ion-channel/anion/api.md)

## Suggested workflow for new users

todo: compliment each steps with the api functions that could be invoked

- Request an api key
  - your user and team will be created with you as the admin role
  - log into a new session
  - create a ruleset
  - create a project
  - run an analysis
  - get the results of that analysis
  - get the history of your project
