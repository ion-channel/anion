# Scanner

- types

  - `AnalysisStatus`

    - analysis_event_src: string,
    - branch: string,
    - created_at: string,
    - deliveries: `Delivery`,
    - id: string,
    - message: string,
    - project_id: string,
    - scan_status: array of `ScanStatus`,
    - status: string,
    - team_id: string,
    - unreachable_error: boolean,
    - updated_at: string,

  - `Delivery`
    - id: string,
    - team_id: string,
    - project_id: string,
    - analysis_id: string,
    - destination: string,
    - status: string,
    - filename: string,
    - hash: string,
    - message: string,
    - created_at: string,
    - updated_at: string,
    - delivered_at: string,
  - `ScanStatus`
    - id: string,
    - analysis_status_id: string,
    - project_id: string,
    - team_id: string,
    - message: string,
    - name: string,
    - read: string,
    - status: string,
    - created_at: string,
    - updated_at: string,

- methods

  - `getAnalysisStatus`

    - description: fetch the status of the analysis of the project that belongs to this team
    - parameter: object
      - projectId
        - type: string
        - description: id of the project that belongs to the team
      - teamId
        - type: string
        - description: id of the team
      - id
        - type: string
        - description: id of the analysis
    - returns: Promise
      - `AnalysisStatus`
      - example: look at line 127 in [test file](./scanner/scanner.test.js)
    - example: `Scanner.getAnalysisStatus({projectId: 'someproject', teamId: 'bestteam', id: 'id'})`

  - `getPublicAnalysisStatus`

    - description: fetch the analysis status of a public analysis
    - parameter: object
      - projectId
        - type: string
        - description: id of the project you want to see the analysis of
      - id
        - type: string
        - description: id of the public analysis
    - returns: Promise
      - `AnalysisStatus`
    - example: `Scanner.getPublicAnalysisStatus({projectId: 'abc', id: 'eee'})`

  - `getLatestAnalysisStatus`

    - description: get the status of the latest analysis
    - parameter: object
      - projectId
        - type: string
        - description: id of the project
      - teamId
        - type: string
        - description: id of the team that owns the project
    - returns: Promise
      - `AnalysisStatus`
      - example: look at line 127 in [test file](./scanner/scanner.test.js)
    - example: `Scanner.getLatestAnalysisStatus({projectId: 'someproject', teamId: 'bestteam'})`

  - `analyzeProject`

    - description: starts an analysis of a project
    - parameters:
      - projectId
        - type: string
        - description: id of a project
      - teamId
        - type: string
        - description: id of a team that owns the project
    - returns: Promise
      - `AnalysisStatus`
      - example: look at line 51 in [test file](./scanner/scanner.test.js)
    - example: `Scanner.analyzeProject({projectId: '8ca10aea-7448-4fba-920e-e0abab735071', teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c'})`

  - `analyzeProjects`
    - description:
    - parameter:
      - body
        - type: array of objects
        - description: each object should have an id field, which represents the id of a project that would be added to the analysis queue
    - returns: Promise
      - data: object
        - field
      - example: look at line 102 in [test file](./scanner/scanner.test.js)
    - example: `Scanner.analyzeProjects([{ project_id: '95dc4e15' }, { project_id: '9657f3fe' }])`
