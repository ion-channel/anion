# Reports

- types
  - `AnalysisReport`
    - analysis: object
      - id: string,
      - team_id: string,
      - project_id: string,
      - name: string,
      - text: string, optional,
      - type: string,
      - source: string,
      - branch: string,
      - description: string, optional
      - status: string,
      - ruleset_id: string,
      - created_at: string,
      - updated_at: string,
      - duration: number,
      - trigger_hash: string,
      - trigger_text: string,
      - trigger_author: string,
      - scan_summaries: array of any
      - public: boolean
  - `Digests`
  - `AnalysisSummary`
    - analysis_id: string
    - branch: string
    - created_at: string
    - description: string
    - duration: number
    - id: string
    - passed: boolean
    - risk: string
    - ruleset_id: string
    - ruleset_name: string
    - summary: string
    - team_id: string
    - trigger: string
    - trigger_author: string
    - trigger_hash: string
    - trigger_text: string
  - `Project`
    - active: boolean,
    - aliases: any
    - analysis_summary: `AnalysisSummary`
    - chat_channel: string
    - created_at: string
    - deploy_key: string
    - id: string
    - key_fingerprint: string
    - monitor_frequency: string
    - name: string
    - password: string
    - poc_email: string
    - poc_name: string
    - private: boolean
    - ruleset_history: any
    - ruleset_name: string
    - should_monitor: boolean
    - status: string
    - tags: any
    - team_id: string
    - updated_at: string
    - username: string
  - `PortfolioSummary`: object
    - data: object
      - [field: string]: any
    - errored: boolean
    - errored_message: string
    - title: string
  - `Vulnerability`: object
    - product: string,
    - projects_affected: number
    - rating: number,
    - system: string
    - title: string
  - `AffectedProject`
    - id: string,
    - name: string,
    - version: string,
    - vulnerabilities: number
  - `ProjectStatus`
    - date: string
    - project_pass_fail: object
      - analysis_id: string,
      - created_at: string
      - fail_count: number,
      - pass: boolean,
      - project_id: string,
      - status_flipped: boolean
      - team_id: string
  - `ProjectReport`
    - critical_vuln_count: number,
    - current_status: failed,
    - high_vuln_count: number,
    - org: string,
    - product_name: string,
    - project_id: string,
    - project_name: string,
    - version: string,
    - virus_count: number,
    - vuln_count: number,
- methods

  - `getAnalysis`
    - description:
    - parameters: object
      - projectId
        - type: string
        - description: the id of the project you want the analysis from
      - teamId
        - type: string
        - description: id of the team that owns the project
      - analysisId
        - type: string
        - description: the id of the analysis that was done on the project that the team owns
    - returns: Promise
      - data: object
        - analysis: `Analysis`
      - example: look at line 306 in [test file](./reports/reports.test.js)
    - example:
    ```javascript
    Reports.getAnalysis({
      projectId: 'someproject',
      teamId: 'bestteam',
      analysisId: 'sillyanalysis',
    })
    ```
  - `getDigests`
    - description:
    - parameters: object
      - projectId
        - type: string
        - description: the id of the project that you want to find the digests from
      - teamId:
        - type: string
        - description: the id of the team that owns the project
      - analysisId
        - type: string
        - description: the analysis that contains the digests for that project
      - grouped
        - type: boolean
        - default value: false
        - description: when true, some of the digests will be grouped by their relevance
    - returns: Promise
      - data: object
        - data: object
          - `Digests`
      - [example](./reports/reports.test.js) line 49
    - example:
    ```javascript
    Reports.getDigests({
      projectId: 'someproject',
      teamId: 'bestteam',
      analysisId: 'sillyanalysis',
    })
    ```
  - `getPublicDigests`
    - description: returns a digest on a public project, like an open source project in github
    - parameters: object
      - projectId
        - type: string,
        - description: the id of the project
      - analysisId
        - type: string
        - description: the id of the analysis
      - grouped
        - type: boolean, default is false
        - description: When true, returns the digests in related groups, otherwise returns a list of digests
    - returns: Promise with the same shape as `getDigests`
  - `getProject`
    - description: Similar to `Projects.getProject`, but includes the last 10 analysis summaries, and the ruleset history
    - parameters: object
      - projectId
        - type: string
        - description: id of the project
      - teamId
        - type: string
        - description: id of the team that the project belongs to
    - returns: Promise, see [example](./reports/reports.test.js) line 852
    - example:
    ```javascript
    Reports.getProject({
      projectId: 'someproject',
      teamId: 'bestteam',
    })
    ```
  - `getProjects`

    - description: fetches a list of projects that belong to a team
    - parameters: object
      - teamId
        - type: string
        - description: the id of the team that you want the projects from
    - returns: Promise
      - projects: array of `Projects`
      - meta: `Meta`
      - [example](./reports/reports.test.js) line 916
    - example: `Reports.getProjects({ teamId: 'bestteam' })`

  - `getPortfolio`
    - description: fethes a summary of the state of my team's projects
    - parameters: object
      - teamId
        - type: string
        - description: the id of the team that has existing projects
    - returns: Promise
      - object
        - dependency_summaries: array of `PortfolioSummary`
        - project_status_summaries: array of `PortfolioSummary`
        - project_summaries: array of `PortfolioSummary`
        - vulnerability_summaries: array of `PortfolioSummary`
      - [example](./reports/repots.test.js) line 35374
    - example: `Reports.getPortfolio({ teamId: 'bestteam' })`
  - `getVulnerabilityList`
    - description: fetches a list of vulnerabilities that are on any of the projects that belong to a team
    - parameter: object
      - teamId
        - type: string
        - description: the id of a team that has projects
    - returns: Promise
      - object
        - cve_list: array of `Vulnerability`
      - [example](./reports/reports.test.js) line 35828
    - example: `Reports.getVulnerabilityList({ teamId: 'bestteam' })`
  - `getAffectedProjects`
    - description: fetches a list of projects that are have a given vulnerability
    - parameter: object
      - teamId
        - type: string
        - description: the id of the team that has projects
      - externalId
        - type: string
        - description: the id of a vulnerability. This should be an id from a vulnerability in the response from `getVulnerabilityList` otherwise you might get back an empty array
      - [example](./reports/reports.test.js) line 35889
    - returns: Promise that resolves to an array of `AffectedProject`
    - example
    ```javascript
    Reports.getAffectedProjects({
      teamId: 'someteam',
      externalId: 'CVE-1234-5678',
    })
    ```
  - `getPublicAnalysis`
    - description: fetches the analysis results of a public project
    - parameter:
      - analysisId
        - type: string
        - description: the id of the analysis that was ran on a project
    - returns: Promise
      - data: object
        - analysis: `Analysis`
    - example: `Reports.getPublicAnalysis('abc')`
  - `getProjectHistory`
    - description: fetches the history of a project for the last year, specifically around changes to the ruleset on a project, and the pass/fail state of an analysis if ran on that day for that project
    - parameter: object
      - teamId
        - type: string
        - description: the id of the team that owns the project
      - projectId
        - type: string
        - description: the id of the project that you want to see the history from
    - returns: Promise that resovles to an array of `ProjectStatus`
      - [example](./reports/reports.test.js) line 34488
    - example: `Reports.getProjectHistory({ teamId: '646fa3e5', projectId: '03b5660f' })`
  - `getExportedData`
    - description: fetches a snapshot of data around a list of projects
    - parameter: object
      - teamId
        - type: string
        - description: the id of the team that has projects
      - ids
        - type: an array of strings
        - description: a list of project ids
    - returns: Promise
      - object
        - data: object
          - created_at: string
          - projects: list of `ProjectReport`
      - [example](./reports/reports.test.js) line 34571
    - example: `Reports.getExportedData({ teamId: 'someid', ids: ['abc'] })`
  - `getProjectsByDependency`
    - description: fetches the projects that have the given dependency
    - parameter: object
      - teamId
        - type: string,
        - description: the team that has some projects
      - name
        - type: string
        - description: the name of the dependency
      - org
        - type: string
        - description: the organization of the dependency
      - version
        - type: string
        - description: the version of the dependency
    - returns: Promise
      - data: object
        - team_id: string
        - name: string,
        - org: string,
        - version: string,
        - project_ids: an array of strings
      - meta: `Meta`
        [example](./reports/reports.test.js) line 34618
    - example:
    ```javascript
    Reports.getProjectsByDependency({
      teamId: '646fa3e5-e274-4884-aef2-1d47f029c289',
      name: 'argparse',
      org: 'nodeca',
      version: '1.0.10',
    })
    ```
