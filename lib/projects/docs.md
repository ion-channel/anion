# Projects

- types
  - `Project`: object
    - id: string, optional, not needed for creating a project
    - team_id: string
    - ruleset_id: string
    - name: string
    - type: string
    - source: string
    - branch: string
    - description: string
    - active: boolean
    - chat_channel: string
    - created_at: string, optional, not needed for creating a project
    - updated_at: string, optional, not needed for creating a project
    - deploy_key: string
    - should_monitor: boolean
    - monitor_frequency: string, optional, not needed for creating a project
    - poc_name: string
    - poc_email: string
    - username: string
    - password: string
    - key_fingerprint: string, optional, not needed for creating a project
    - private: boolean
    - aliases: array of `Alias`
    - tags: array of `Tag`
  - `Alias`: object
    - id: string
    - name: string
    - org: string
    - created_at: string
    - updated_at: string
    - version: string
  - `Tag`: object
    - id: string
    - team_id: string
    - name: string
    - description: string
    - created_at: string
    - updated_at: string
- methods

  - createProject
    - description: adds a new project to your team
    - parameters: object as `Project` with optional field for `checkAccess` as a boolean
    - returns: Promise
      - `Project`
      ```javascript
      const example = {
        team_id: 'abc',
        ruleset_id: 'rule 1',
        name: 'fake name',
        type: 'git',
        source: 'foo.com-git',
        branch: 'master',
        description: '',
        active: true,
        should_monitor: true,
        aliases: [
          {
            name: 'productName',
            version: '0.0.0',
            org: 'foo org',
            id: 'alias id',
            created_at: 'today',
            updated_at: 'today',
          },
        ],
        tags: [],
        poc_name: 'my pocName',
        poc_email: 'pocEmail@foo.com',
        deploy_key: 'sdf',
        username: 'ion',
        password: 'channel',
        chat_channel: 'slack channel',
        id: 'sdf',
        created_at: 'today',
        updated_at: 'today',
        monitor_frequency: 'every day',
        key_fingerprint: 'fingerprint key',
        private: true,
      }
      ```
    - example:
    ```javascript
    Projects.createProject({
      id: 'sdfsdfsdf',
      team_id: 'abc',
      ruleset_id: 'rule 1',
      name: 'fake name',
      type: 'git',
      source: 'foo.com-git',
      branch: 'master',
      description: '',
      active: true,
      should_monitor: true,
      aliases: [
        {
          name: 'productName',
          version: '0.0.0',
          org: 'foo org',
          id: 'alias id',
          created_at: 'today',
          updated_at: 'today',
        },
      ],
      tags: [],
      poc_name: 'my pocName',
      poc_email: 'pocEmail@foo.com',
      deploy_key: 'sdf',
      username: 'ion',
      password: 'channel',
      chat_channel: 'slack channel',
    })
    ```
  - `getProject`
    - description: returns a project on a team
    - parameters: object
      - id
        - type: string
        - description: the id of the private project
      - teamId
        - type: string
        - description: the id of the team that owns the private project
    - returns: Promise
      - object
        - project: `Project`
        - meta: `Meta`
      ```javascript
      const example: {
        id: 'sdfsdfsdf',
        team_id: 'abc',
        ruleset_id: 'rule 1',
        name: 'fake name',
        type: 'git',
        source: 'foo.com-git',
        branch: 'master',
        description: '',
        active: true,
        should_monitor: true,
        aliases: [
          {
            name: 'productName',
            version: '0.0.0',
            org: 'foo org',
            id: 'alias id',
            created_at: 'today',
            updated_at: 'today',
          },
        ],
        tags: [],
        poc_name: 'my pocName',
        poc_email: 'pocEmail@foo.com',
        deploy_key: 'sdf',
        username: 'ion',
        password: 'channel',
        chat_channel: 'slack channel',
        created_at: 'today',
        updated_at: 'today',
        monitor_frequency: 'every day',
        key_fingerprint: 'fingerprint key',
        private: true,
      }
      ```
    - example: `Projects.getProject({ id: 'def', teamId: 'abc' })`
  - getPublicProject
    - description: fetches a public project
    - parameters
      - id
        - type: string
        - description: the id of the public project
    - returns: Promise
    ```javascript
    const example = {
      id: 'sdfsdfsdf',
      team_id: 'abc',
      ruleset_id: 'rule 1',
      name: 'fake name',
      type: 'git',
      source: 'foo.com-git',
      branch: 'master',
      description: '',
      active: true,
      should_monitor: true,
      aliases: [
        {
          name: 'productName',
          version: '0.0.0',
          org: 'foo org',
          id: 'alias id',
          created_at: 'today',
          updated_at: 'today',
        },
      ],
      tags: [],
      poc_name: 'my pocName',
      poc_email: 'pocEmail@foo.com',
      deploy_key: 'sdf',
      username: 'ion',
      password: 'channel',
      chat_channel: 'slack channel',
      created_at: 'today',
      updated_at: 'today',
      monitor_frequency: 'every day',
      key_fingerprint: 'fingerprint key',
      private: false,
    }
    ```
    - example: `Projects.getPublicProject({id: 'sdfsdfsdf'})`
  - getProjects
    - description: fetches a list of projects
    - parameters:
      - teamId
        - type: string
        - description: id of the team that the projects belong to
    - returns: Promise
      ```javascript
      const example = {
        projects: [
        {
        id: 'sdfsdfsdf',
        team_id: 'abc',
        ruleset_id: 'rule 1',
        name: 'fake name',
        type: 'git',
        source: 'foo.com-git',
        branch: 'master',
        description: '',
        active: true,
        should_monitor: true,
        aliases: [
          {
            name: 'productName',
            version: '0.0.0',
            org: 'foo org',
            id: 'alias id',
            created_at: 'today',
            updated_at: 'today',
          },
        ],
        tags: [],
        poc_name: 'my pocName',
        poc_email: 'pocEmail@foo.com',
        deploy_key: 'sdf',
        username: 'ion',
        password: 'channel',
        chat_channel: 'slack channel',
        created_at: 'today',
        updated_at: 'today',
        monitor_frequency: 'every day',
        key_fingerprint: 'fingerprint key',
        private: true,
        }
      ]
      meta: {total_count: 1000, offset: 0, limit: 10}
      }
      ```
    - example: `Projects.getProjects({teamId: 'abc'})`
  - updateProject

    - description: updates a project
    - parameters:
      project
      - type: `Project`
      - description: the object with values changed on any of the fields
    - returns: Promise
      data:
      - type: `Project`
      - description: the current value of the project after a successful put request
      ```javascript
      const example = {
        active: true,
        aliases: [],
        branch: 'cat-master',
        chat_channel: 'chat channel',
        created_at: '2018-05-31T16:59:32.969012Z',
        deploy_key: 'deploy key',
        description: 'my description',
        id: '8ca10aea-7451-4fba-920e-e0abab735071',
        key_fingerprint: 'fake fingerprint',
        name: 'cat-project-v2',
        password: '123abc',
        poc_email: 'ironic@gmail.com',
        poc_name: 'poc_name',
        private: false,
        ruleset_id: '4362ca46-1a68-452f-b419-e26c40e0c346',
        should_monitor: true,
        monitor_frequency: 'daily',
        source: 'git@github.com:/ion-channel/ion-ui',
        tags: [],
        team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
        type: 'git',
        updated_at: '2018-05-31T16:59:32.969012Z',
        username: 'ironic',
      }
      ```
    - example:

    ```javascript
    Projects.updateProject({
      active: true,
      aliases: [],
      branch: 'cat-master',
      chat_channel: 'chat channel',
      created_at: '2018-05-31T16:59:32.969012Z',
      deploy_key: 'deploy key',
      description: 'my description',
      id: '8ca10aea-7451-4fba-920e-e0abab735071',
      key_fingerprint: 'fake fingerprint',
      name: 'cat-project-v2',
      password: '123abc',
      poc_email: 'ironic@gmail.com',
      poc_name: 'poc_name',
      private: false,
      ruleset_id: '4362ca46-1a68-452f-b419-e26c40e0c346',
      should_monitor: true,
      monitor_frequency: 'daily',
      source: 'git@github.com:/ion-channel/ion-ui',
      tags: [],
      team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      type: 'git',
      updated_at: '2018-05-31T16:59:32.969012Z',
      username: 'ironic',
    })
    ```

  - updateRulesetForProjects
    - description: change the ruleset on every project of a list of projects
    - parameters:
      - rulesetId
        - type: string
        - description: the id of the ruleset that will be changed on all the projects
      - projectIds
        - type: array of strings
        - description: every string represents an id of a project
    - returns: Promise
    ```javascript
    const example = { data: { data: { ruleset_id: 'abc' } } }
    ```
    - example: `Projects.updateRulesetForProjects({ rulesetId: 'abc', projectIds: ['def']})`
  - updateProjects
    - description: update a list of projects by a possible list of fields
    - parameter: object
      - projectIds
        - type: an array of strings
        - description: each string is an id to a project
      - fields: an unlimited list of key and value pairs
        - example: monitor is the key, and the value is false, so the intent is that you're changing the monitoring field on all of the given projects
        - this should only have fields that are in the `Project` type
    - returns: Promise
      - data: object
        - data: object
          - succeeded: an array of project ids where the change was successful
          - failed: an array of project ids where the change was not successful
      - example:
      ```javascript
      const example = {data: data: {succeeded: ['a'], failed: []}}
      ```
    - example:
    ```javascript
    Projects.updateProjects({
      projectIds: ['a', 'b'],
      monitor: false,
    })
    ```
