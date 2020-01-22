/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Reports } from './reports'
import { expect } from 'chai'

describe('Reports', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Analysis Report', () => {
    test('should get an analysis report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/report/getAnalysis?project_id=someproject&team_id=bestteam&analysis_id=sillyanalysis',
        )
        .reply(200, { data: expectedAnalysisReportResponse })

      return Reports.getAnalysis({
        projectId: 'someproject',
        teamId: 'bestteam',
        analysisId: 'sillyanalysis',
      }).then(response => {
        expect(response).to.not.be.a('error')
        expect(response.length).to.equal(expectedAnalysisReportResponse.length)

        expect(response.analysis.id).to.equal(
          expectedAnalysisReportResponse.analysis.id,
        )
        expect(response.analysis.team_id).to.equal(
          expectedAnalysisReportResponse.analysis.team_id,
        )
        expect(response.analysis.branch).to.equal(
          expectedAnalysisReportResponse.analysis.branch,
        )

        expect(response.report.project.id).to.equal(
          expectedAnalysisReportResponse.report.project.id,
        )
        expect(response.report.project_ruleset.id).to.equal(
          expectedAnalysisReportResponse.report.project_ruleset.id,
        )
        expect(response.report.statuses.id).to.equal(
          expectedAnalysisReportResponse.report.statuses.id,
        )
        expect(response.report.digests.length).to.equal(
          expectedAnalysisReportResponse.report.digests.length,
        )
        expect(response.report.ruleset_evaluation.analysis_id).to.equal(
          expectedAnalysisReportResponse.report.ruleset_evaluation.analysis_id,
        )
      })
    })
  })

  describe('Project Report', () => {
    test('should get a project report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/report/getProject?project_id=someproject&team_id=bestteam')
        .reply(200, { data: expectedProjectReportResponse })

      return Reports.getProject({
        projectId: 'someproject',
        teamId: 'bestteam',
      }).then(response => {
        expect(response).to.not.be.a('error')
        expect(response.length).to.equal(expectedProjectReportResponse.length)

        expect(response.id).to.equal(expectedProjectReportResponse.id)
        expect(response.team_id).to.equal(expectedProjectReportResponse.team_id)
        expect(response.branch).to.equal(expectedProjectReportResponse.branch)

        expect(response.analysis_summaries.length).to.equal(
          expectedProjectReportResponse.analysis_summaries.length,
        )
      })
    })
  })

  describe('Projects Report', () => {
    test('should get a projects report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/report/getProjects?team_id=bestteam')
        .reply(200, { data: expectedProjectsReportResponse, meta: {} })

      return Reports.getProjects({ teamId: 'bestteam' }).then(response => {
        expect(response).to.not.be.a('error')

        const projects = response.projects
        expect(projects.length).to.equal(expectedProjectsReportResponse.length)

        expect(projects[0].id).to.equal(expectedProjectsReportResponse[0].id)
        expect(projects[0].team_id).to.equal(
          expectedProjectsReportResponse[0].team_id,
        )
        expect(projects[0].branch).to.equal(
          expectedProjectsReportResponse[0].branch,
        )
      })
    })
  })

  describe('Portfolio Report', () => {
    test('should get a portfolio report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/report/getPortfolio?id=bestteam')
        .reply(200, { data: expectedPortfolioReportResponse, meta: {} })

      return Reports.getPortfolio({ teamId: 'bestteam' }).then(response => {
        expect(response).to.not.be.a('error')

        expect(response.project_summaries.length).to.equal(
          expectedPortfolioReportResponse.project_summaries.length,
        )
        expect(response.project_status_summaries.length).to.equal(
          expectedPortfolioReportResponse.project_status_summaries.length,
        )
        expect(response.vulnerability_summaries.length).to.equal(
          expectedPortfolioReportResponse.vulnerability_summaries.length,
        )
      })
    })
  })

  describe('Vulnerability Mitigation Report', () => {
    test('should get a vulnerability mitigation report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/report/getVulnerabilityList?id=bestteam')
        .reply(200, { data: expectedVulnListReportResponse, meta: {} })

      return Reports.getVulnerabilityList({ teamId: 'bestteam' }).then(resp => {
        expect(resp.cve_list.length).to.equal(
          expectedVulnListReportResponse.cve_list.length,
        )
        expect(resp.cve_list[0].title).to.equal('CVE-2019-10744')
      })
    })

    test('should not throw an error when there is not any vulnerabilties', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/report/getVulnerabilityList?id=bestteam')
        .reply(200, { data: { cve_list: null }, meta: {} })

      return Reports.getVulnerabilityList({ teamId: 'bestteam' }).then(resp => {
        expect(resp.cve_list).to.equal(null)
      })
    })
  })

  describe('Affected Projects', () => {
    test('should get the list of affected projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/report/getAffectedProjects?id=someteam&external_id=CVE-1234-5678',
        )
        .reply(200, { data: expectedAffectedProjects })

      return Reports.getAffectedProjects({
        teamId: 'someteam',
        externalId: 'CVE-1234-5678',
      }).then(resp => {
        expect(resp.length).to.equal(expectedAffectedProjects.length)
        expect(resp[0].name).to.equal('rust')
        expect(resp[1].name).to.equal('whiskey')
      })
    })
  })
})

const expectedAnalysisReportResponse = {
  analysis: {
    id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
    team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
    project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
    name: 'bunsen',
    text: '',
    type: 'git',
    source: 'git@github.com:ion-channel/bunsen.git',
    branch: 'master',
    description: '',
    status: 'finished',
    ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
    created_at: '2019-06-20T19:59:54.390278Z',
    updated_at: '2019-06-20T19:59:54.390278Z',
    duration: 220975.47088699866,
    trigger_hash: 'ff60322d59b20bf10c5c49f92a24c9d86e7a3fd6',
    trigger_text:
      'Merge pull request #730 from ion-channel/backoff-2-backoff-harder\n\nBackoff 2 backoff harder',
    trigger_author: 'Daniel Hess',
    scan_summaries: [
      {
        id: '5035948b-2f5b-00fa-aebc-9b00458e4c50',
        team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
        project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
        analysis_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
        summary: 'Finished clamav scan for bunsen, found 0 infected files.',
        results: {
          type: 'virus',
          data: {
            known_viruses: 0,
            engine_version: '',
            scanned_directories: 0,
            scanned_files: 17134,
            infected_files: 0,
            data_scanned: '',
            data_read: '',
            time: '118.258 sec (1 m 58 s)',
            file_notes: {
              empty_file: null,
            },
            clam_av_details: {
              clamav_version: '',
              clamav_db_version: '',
            },
          },
        },
        created_at: '0001-01-01T00:00:00Z',
        updated_at: '0001-01-01T00:00:00Z',
        duration: 118400.17993699803,
        name: 'virus',
        description: '',
      },
    ],
    public: false,
  },
  report: {
    project: {
      id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
      team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
      ruleset_id: '86ee6e2f-95d5-47f5-9d73-86d7712d6889',
      name: 'bunsen',
      type: 'git',
      source: 'git@github.com:ion-channel/bunsen.git',
      branch: 'master',
      description: 'o',
      active: true,
      chat_channel: '',
      created_at: '2019-04-25T21:02:09.41508Z',
      updated_at: '2019-06-28T18:28:35.368666Z',
      deploy_key: '',
      should_monitor: false,
      monitor_frequency: 'daily',
      poc_name: 'i',
      poc_email: 'i@i.com',
      username: '',
      password: '',
      key_fingerprint: '',
      private: false,
      aliases: [
        {
          id: '4ebc1859-f638-406b-8f37-d7fdabdbb6cb',
          name: 'bunsen',
          org: 'i',
          created_at: '2019-06-28T18:28:35.368666Z',
          updated_at: '2019-06-28T18:28:35.368666Z',
          version: '1',
        },
      ],
      tags: [],
    },
    project_ruleset: {
      id: '86ee6e2f-95d5-47f5-9d73-86d7712d6889',
      team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
      name: 'No Viruses',
      description: '',
      rule_ids: null,
      created_at: '2019-01-22T18:25:14.540768Z',
      updated_at: '2019-01-22T18:25:14.540768Z',
      rules: [
        {
          id: 'f746023f-16cc-46db-9422-1e4e3364ab97',
          scan_type: 'virus',
          name: 'Has no viruses',
          description:
            'The project must not have any viruses found during the analysis.',
          category: 'Virus',
          created_at: '2019-01-17T22:45:43.451734Z',
          updated_at: '2019-07-26T11:56:20.068045Z',
        },
      ],
    },
    statuses: {
      id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
      team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
      project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
      message: 'Completed compliance analysis',
      branch: 'master',
      status: 'finished',
      created_at: '2019-06-20T19:57:02.895984Z',
      updated_at: '2019-06-20T19:59:55.25081Z',
      scan_status: [
        {
          id: 'f5722a33-d51f-0d8d-007d-71adfa22294e',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished about_yml scan for bunsen, valid .about.yml found.',
          name: 'about_yml',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:18.553556Z',
          updated_at: '2019-06-20T19:57:19.744086Z',
        },
        {
          id: 'c33418b2-2ed0-3262-eb7f-829e123260fb',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished vulnerability scan for bunsen, found 5 vulnerabilities.',
          name: 'vulnerability',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:58.534909Z',
          updated_at: '2019-06-20T19:57:58.539079Z',
        },
        {
          id: '97999bda-cb92-5451-44ea-9ecf02991ce3',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished community scan for bunsen, community data was not detected.',
          name: 'community',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:19.568504Z',
          updated_at: '2019-06-20T19:57:22.788329Z',
        },
        {
          id: '97242bdd-d313-2d35-cad0-6d6994dfbc51',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished dependency scan for bunsen, found 75 dependencies, 0 with no version and 32 with updates available.',
          name: 'dependency',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:19.193475Z',
          updated_at: '2019-06-20T19:57:28.02566Z',
        },
        {
          id: 'b15790a4-ed6f-ef2c-c413-44d07731a10f',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message: 'Finished license scan for bunsen, found gpl-3.0 license.',
          name: 'license',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:19.352115Z',
          updated_at: '2019-06-20T19:57:27.669104Z',
        },
        {
          id: '94428d6a-86b3-c7bb-4455-65655036752c',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished difference scan for bunsen, a difference was detected.',
          name: 'difference',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:18.670253Z',
          updated_at: '2019-06-20T19:57:49.432882Z',
        },
        {
          id: '26b00867-9737-cce4-58b2-84a8dc164e81',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message:
            'Finished ecosystems scan for bunsen, Ruby, Makefile, Shell, Go, Gherkin were detected in project.',
          name: 'ecosystems',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:21.228031Z',
          updated_at: '2019-06-20T19:57:48.771457Z',
        },
        {
          id: '5035948b-2f5b-00fa-aebc-9b00458e4c50',
          analysis_status_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
          project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          message: 'Finished clamav scan for bunsen, found 0 infected files.',
          name: 'virus',
          read: 'f',
          status: 'finished',
          created_at: '2019-06-20T19:57:18.739885Z',
          updated_at: '2019-06-20T19:59:17.48833Z',
        },
      ],
      deliveries: {},
    },
    digests: [
      {
        index: 0,
        title: 'difference detected',
        data: {
          bool: true,
        },
        scan_id: '94428d6a-86b3-c7bb-4455-65655036752c',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 1,
        title: 'viruses found',
        data: {
          count: 0,
        },
        scan_id: '5035948b-2f5b-00fa-aebc-9b00458e4c50',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 2,
        title: 'critical vulnerabilities',
        data: {
          count: 0,
        },
        scan_id: 'c33418b2-2ed0-3262-eb7f-829e123260fb',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: true,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 3,
        title: 'high vulnerabilities',
        data: {
          count: 0,
        },
        scan_id: 'c33418b2-2ed0-3262-eb7f-829e123260fb',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: true,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 4,
        title: 'total vulnerabilities',
        data: {
          count: 5,
        },
        scan_id: 'c33418b2-2ed0-3262-eb7f-829e123260fb',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: true,
        warning_message: 'vulnerabilities found',
        errored: false,
      },
      {
        index: 5,
        title: 'unique vulnerabilities',
        data: {
          count: 5,
        },
        scan_id: 'c33418b2-2ed0-3262-eb7f-829e123260fb',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: true,
        warning_message: 'vulnerabilities found',
        errored: false,
      },
      {
        index: 6,
        title: 'license found',
        data: {
          chars: 'gpl-3.0',
        },
        scan_id: 'b15790a4-ed6f-ef2c-c413-44d07731a10f',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 7,
        title: 'total files scanned',
        data: {
          count: 17134,
        },
        scan_id: '5035948b-2f5b-00fa-aebc-9b00458e4c50',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 8,
        title: 'direct dependencies',
        data: {
          count: 33,
        },
        scan_id: '97242bdd-d313-2d35-cad0-6d6994dfbc51',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 9,
        title: 'transitive dependencies',
        data: {
          count: 42,
        },
        scan_id: '97242bdd-d313-2d35-cad0-6d6994dfbc51',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 10,
        title: 'dependencies outdated',
        data: {
          count: 32,
        },
        scan_id: '97242bdd-d313-2d35-cad0-6d6994dfbc51',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 11,
        title: 'dependencies no version specified',
        data: {
          count: 0,
        },
        scan_id: '97242bdd-d313-2d35-cad0-6d6994dfbc51',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 12,
        title: 'valid about yaml',
        data: {
          bool: true,
        },
        scan_id: 'f5722a33-d51f-0d8d-007d-71adfa22294e',
        rule_id: 'c30b9179-56c3-040d-aa2c-571ef31dbe3a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: true,
        pending: false,
        passed: true,
        passed_message: 'The project must include a valid about.yml file.',
        warning: false,
        errored: false,
      },
      {
        index: 13,
        title: 'languages',
        data: {
          count: 5,
        },
        scan_id: '26b00867-9737-cce4-58b2-84a8dc164e81',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
      {
        index: 14,
        title: 'unique committers',
        data: {
          count: 0,
        },
        scan_id: '97999bda-cb92-5451-44ea-9ecf02991ce3',
        rule_id: 'n/a',
        ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
        evaluated: false,
        pending: false,
        passed: false,
        passed_message: '',
        warning: false,
        errored: false,
      },
    ],
    ruleset_evaluation: {
      project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
      team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
      analysis_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
      rule_evaluation_summary: {
        ruleset_name: 'About.yml',
        summary: 'pass',
        risk: 'low',
        passed: false,
        ruleresults: [
          {
            id: '5035948b-2f5b-00fa-aebc-9b00458e4c50',
            team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
            project_id: '29c4fb49-c685-473e-bfb3-6ecce155c3ad',
            analysis_id: '045e1c06-4a46-462d-bdc6-bb05135ef5dd',
            rule_id: 'n/a',
            ruleset_id: '011aaa30-e7d8-4f49-89db-fe69688ece3b',
            summary: 'Finished clamav scan for bunsen, found 0 infected files.',
            results: {
              type: 'virus',
              data: {
                known_viruses: 0,
                engine_version: '',
                scanned_directories: 0,
                scanned_files: 17134,
                infected_files: 0,
                data_scanned: '',
                data_read: '',
                time: '118.258 sec (1 m 58 s)',
                file_notes: {
                  empty_file: null,
                },
                clam_av_details: {
                  clamav_version: '',
                  clamav_db_version: '',
                },
              },
            },
            created_at: '0001-01-01T00:00:00Z',
            updated_at: '0001-01-01T00:00:00Z',
            duration: 118400.17993699803,
            name: 'Virus',
            description: '',
            risk: 'n/a',
            type: 'Not Evaluated',
            passed: false,
          },
        ],
      },
      created_at: '2019-06-20T19:59:54.966044Z',
      updated_at: '2019-06-20T19:59:54.966044Z',
    },
  },
}

const expectedProjectReportResponse = {
  id: 'AB3DC2C7-4BB8-4211-8F42-158C8AD4BAE3',
  team_id: '28FB6CD7-2F18-444F-9925-BAB75CFD4A04',
  ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
  name: 'Pepe',
  type: 'git',
  source: 'git@github.com:ion-channel/pepe.git',
  branch: 'master',
  description: '',
  active: true,
  chat_channel: '',
  created_at: '2017-05-26T21:18:28.667Z',
  updated_at: '2017-07-19T20:02:07.010Z',
  deploy_key: null,
  should_monitor: false,
  poc_name: 'Daniel',
  poc_email: '',
  username: null,
  password: null,
  key_fingerprint: '',
  private: false,
  poc_name_hash: '',
  poc_email_hash: '',
  aliases: [],
  tags: [],
  ruleset_name: 'Go Project Ruleset',
  analysis_summaries: [
    {
      analysis_id: 'F9D328A5-53E2-4D17-B0E3-09ED60CB1CA2',
      description: '',
      branch: 'master',
      risk: 'high',
      summary: '',
      passed: false,
      ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
      ruleset_name: 'Go Project Ruleset',
      duration: 34011.3134330059,
      created_at: '2017-09-26T18:23:46.000Z',
      trigger_hash: '798627047292aa4342cb706c0a5507cd7340a39e',
      trigger_text:
        'Merge pull request #151 from ion-channel/test-for-new-account-emails\n\nAdd a test for ensuring we send the right link via email.',
      trigger_author: 'Daniel Hess',
      trigger: 'source commit',
    },
    {
      analysis_id: 'B1454451-C3F0-4226-B2A6-5427E3213116',
      description: '',
      branch: 'master',
      risk: 'high',
      summary: '',
      passed: false,
      ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
      ruleset_name: 'Go Project Ruleset',
      duration: 24763.7515759998,
      created_at: '2017-07-19T23:19:51.000Z',
      trigger_hash: 'bbd96df8639568106e5ef2fe4a2a7954a587ceb8',
      trigger_text:
        'Merge pull request #137 from ion-channel/testing-notice\n\nupdating to notify of running against testing',
      trigger_author: 'Matthew Mayer',
      trigger: 'source commit',
    },
  ],
}

const expectedProjectsReportResponse = [
  {
    id: 'AB3DC2C7-4BB8-4211-8F42-158C8AD4BAE3',
    team_id: '28FB6CD7-2F18-444F-9925-BAB75CFD4A04',
    ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
    name: 'Pepe',
    type: 'git',
    source: 'git@github.com:ion-channel/pepe.git',
    branch: 'master',
    description: '',
    active: true,
    chat_channel: '',
    created_at: '2017-05-26T21:18:28.667Z',
    updated_at: '2017-07-19T20:02:07.010Z',
    deploy_key: null,
    should_monitor: false,
    poc_name: 'Daniel',
    poc_email: '',
    username: null,
    password: null,
    key_fingerprint: '',
    private: false,
    poc_name_hash: '',
    poc_email_hash: '',
    aliases: [],
    tags: [],
    ruleset_name: 'Go Project Ruleset',
    analysis_summaries: [
      {
        analysis_id: 'F9D328A5-53E2-4D17-B0E3-09ED60CB1CA2',
        description: '',
        branch: 'master',
        risk: 'high',
        summary: '',
        passed: false,
        ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
        ruleset_name: 'Go Project Ruleset',
        duration: 34011.3134330059,
        created_at: '2017-09-26T18:23:46.000Z',
        trigger_hash: '798627047292aa4342cb706c0a5507cd7340a39e',
        trigger_text:
          'Merge pull request #151 from ion-channel/test-for-new-account-emails\n\nAdd a test for ensuring we send the right link via email.',
        trigger_author: 'Daniel Hess',
        trigger: 'source commit',
      },
      {
        analysis_id: 'B1454451-C3F0-4226-B2A6-5427E3213116',
        description: '',
        branch: 'master',
        risk: 'high',
        summary: '',
        passed: false,
        ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
        ruleset_name: 'Go Project Ruleset',
        duration: 24763.7515759998,
        created_at: '2017-07-19T23:19:51.000Z',
        trigger_hash: 'bbd96df8639568106e5ef2fe4a2a7954a587ceb8',
        trigger_text:
          'Merge pull request #137 from ion-channel/testing-notice\n\nupdating to notify of running against testing',
        trigger_author: 'Matthew Mayer',
        trigger: 'source commit',
      },
    ],
  },
  {
    id: '82fd4a0d-ea2d-47b7-a5d8-9be59063ad66',
    team_id: '28FB6CD7-2F18-444F-9925-BAB75CFD4A04',
    ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
    name: 'Boregard',
    type: 'git',
    source: 'git@github.com:ion-channel/boregard.git',
    branch: 'master',
    description: '',
    active: true,
    chat_channel: '',
    created_at: '2017-05-26T21:18:28.667Z',
    updated_at: '2017-07-19T20:02:07.010Z',
    deploy_key: null,
    should_monitor: false,
    poc_name: 'Daniel',
    poc_email: '',
    username: null,
    password: null,
    key_fingerprint: '',
    private: false,
    poc_name_hash: '',
    poc_email_hash: '',
    aliases: [],
    tags: [],
    ruleset_name: 'Go Project Ruleset',
    analysis_summaries: [
      {
        analysis_id: '837eca12-de19-4180-bfa9-3c8a9c86cfd8',
        description: '',
        branch: 'master',
        risk: 'high',
        summary: '',
        passed: false,
        ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
        ruleset_name: 'Go Project Ruleset',
        duration: 34011.3134330059,
        created_at: '2017-09-26T18:23:46.000Z',
        trigger_hash: '798627047292aa4342cb706c0a5507cd7340a39e',
        trigger_text:
          'Merge pull request #151 from ion-channel/test-for-new-account-emails\n\nAdd a test for ensuring we send the right link via email.',
        trigger_author: 'Daniel Hess',
        trigger: 'source commit',
      },
      {
        analysis_id: '18f20478-b0a2-467d-ac8c-2a442933af97',
        description: '',
        branch: 'master',
        risk: 'high',
        summary: '',
        passed: false,
        ruleset_id: '25174480-5C8F-4C12-8E8D-3E9F125660BE',
        ruleset_name: 'Go Project Ruleset',
        duration: 24763.7515759998,
        created_at: '2017-07-19T23:19:51.000Z',
        trigger_hash: 'bbd96df8639568106e5ef2fe4a2a7954a587ceb8',
        trigger_text:
          'Merge pull request #137 from ion-channel/testing-notice\n\nupdating to notify of running against testing',
        trigger_author: 'Matthew Mayer',
        trigger: 'source commit',
      },
    ],
  },
]

const expectedPortfolioReportResponse = {
  project_summaries: [
    {
      title: 'Total Projects',
      data: { count: 26 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Monitored Projects',
      data: { count: 13 },
      errored: false,
      errored_message: '',
    },
  ],
  project_status_summaries: [
    {
      title: 'Passing Projects',
      data: { count: 8 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Failing Projects',
      data: { count: 5 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Errored Projects',
      data: { count: 0 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Pending Projects',
      data: { count: 13 },
      errored: false,
      errored_message: '',
    },
  ],
  vulnerability_summaries: [
    {
      title: 'Total Vulnerabilities',
      data: { count: 12 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Unique Vulnerabilities',
      data: { count: 12 },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Most Frequent Vulnerability',
      data: { chars: 'CVE-2019-10744' },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Severity',
      data: {
        cve_list: [
          {
            title: 'CVE-2019-10744',
            projects_affected: 1,
            product: 'lodash',
            rating: 9.8,
            system: 'cvssv3',
          },
          {
            title: 'CVE-2018-3728',
            projects_affected: 1,
            product: 'hoek',
            rating: 8.8,
            system: 'cvssv3',
          },
          {
            title: 'CVE-2016-10697',
            projects_affected: 1,
            product: 'react-native-baidu-voice-synthesizer',
            rating: 8.1,
            system: 'cvssv3',
          },
          {
            title: 'NPM-813',
            projects_affected: 1,
            product: 'js-yaml',
            rating: 7,
            system: 'cvssv3',
          },
          {
            title: 'NPM-1164',
            projects_affected: 1,
            product: 'handlebars',
            rating: 7,
            system: 'cvssv3',
          },
        ],
      },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Impact',
      data: {
        cve_list: [
          {
            title: 'CVE-2019-10744',
            projects_affected: 1,
            product: 'lodash',
            rating: 9.8,
            system: 'cvssv3',
          },
          {
            title: 'CVE-2018-3728',
            projects_affected: 1,
            product: 'hoek',
            rating: 8.8,
            system: 'cvssv3',
          },
          {
            title: 'CVE-2016-10697',
            projects_affected: 1,
            product: 'react-native-baidu-voice-synthesizer',
            rating: 8.1,
            system: 'cvssv3',
          },
          {
            title: 'NPM-813',
            projects_affected: 1,
            product: 'js-yaml',
            rating: 7,
            system: 'cvssv3',
          },
          {
            title: 'NPM-1164',
            projects_affected: 1,
            product: 'handlebars',
            rating: 7,
            system: 'cvssv3',
          },
        ],
      },
      errored: false,
      errored_message: '',
    },
    {
      title: 'Vulnerabilities Over Last 30 Days',
      data: {
        line_graph: {
          title: 'vulnerabilities over time',
          axes: [
            {
              legend: 'number of vulnerabilities',
              orientation: 'left',
              points: [
                7,
                0,
                17,
                0,
                7,
                7,
                10,
                0,
                1,
                13,
                13,
                16,
                10,
                1,
                5,
                49,
                13,
                3,
                12,
                16,
                11,
                0,
                0,
                2,
                5,
                3,
                13,
              ],
            },
            {
              legend: 'projects analyzed',
              orientation: 'right',
              points: [
                11,
                11,
                1,
                11,
                10,
                11,
                11,
                11,
                11,
                11,
                11,
                11,
                1,
                11,
                1,
                11,
                11,
                11,
                11,
                11,
                11,
                11,
                10,
                11,
                1,
                11,
                11,
              ],
            },
          ],
          lines: [
            {
              domain: 'date',
              range: 'count',
              legend: 'vulnerabilities',
              points: {
                '2019-11-05': 2,
                '2019-11-06': 16,
                '2019-11-07': 16,
                '2019-11-08': 5,
                '2019-11-09': 0,
                '2019-11-11': 5,
                '2019-11-12': 10,
                '2019-11-13': 10,
                '2019-11-14': 11,
                '2019-11-15': 17,
                '2019-11-16': 0,
                '2019-11-18': 0,
                '2019-11-19': 0,
                '2019-11-20': 0,
                '2019-11-21': 49,
                '2019-11-22': 7,
                '2019-11-23': 1,
                '2019-11-25': 13,
                '2019-11-26': 13,
                '2019-11-27': 7,
                '2019-11-28': 13,
                '2019-11-29': 3,
                '2019-11-30': 1,
                '2019-12-02': 3,
                '2019-12-03': 13,
                '2019-12-04': 7,
                '2019-12-05': 12,
              },
            },
            {
              domain: 'date',
              range: 'count',
              legend: 'projects',
              points: {
                '2019-11-05': 11,
                '2019-11-06': 11,
                '2019-11-07': 11,
                '2019-11-08': 11,
                '2019-11-09': 1,
                '2019-11-11': 10,
                '2019-11-12': 11,
                '2019-11-13': 11,
                '2019-11-14': 11,
                '2019-11-15': 11,
                '2019-11-16': 1,
                '2019-11-18': 11,
                '2019-11-19': 11,
                '2019-11-20': 11,
                '2019-11-21': 11,
                '2019-11-22': 11,
                '2019-11-23': 1,
                '2019-11-25': 11,
                '2019-11-26': 11,
                '2019-11-27': 11,
                '2019-11-28': 11,
                '2019-11-29': 11,
                '2019-11-30': 1,
                '2019-12-02': 10,
                '2019-12-03': 11,
                '2019-12-04': 11,
                '2019-12-05': 11,
              },
            },
          ],
        },
      },
      errored: false,
      errored_message: '',
    },
  ],
}

const expectedVulnListReportResponse = {
  cve_list: [
    {
      title: 'CVE-2019-10744',
      projects_affected: 1,
      product: 'lodash',
      rating: 9.8,
      system: 'cvssv3',
    },
    {
      title: 'CVE-2016-10697',
      projects_affected: 1,
      product: 'react-native-baidu-voice-synthesizer',
      rating: 8.1,
      system: 'cvssv3',
    },
    {
      title: 'NPM-1164',
      projects_affected: 1,
      product: 'handlebars',
      rating: 7,
      system: 'cvssv3',
    },
    {
      title: 'NPM-1070',
      projects_affected: 1,
      product: 'lodash.defaultsdeep',
      rating: 7,
      system: 'cvssv3',
    },
    {
      title: 'NPM-1068',
      projects_affected: 1,
      product: 'lodash.defaultsdeep',
      rating: 7,
      system: 'cvssv3',
    },
    {
      title: 'NPM-1065',
      projects_affected: 1,
      product: 'lodash',
      rating: 7,
      system: 'cvssv3',
    },
    {
      title: 'NPM-1300',
      projects_affected: 1,
      product: 'handlebars',
      rating: 5,
      system: 'cvssv3',
    },
    {
      title: 'CVE-2019-11284',
      projects_affected: 1,
      product: 'reactor_netty',
      rating: 5,
      system: 'cvssv2',
    },
  ],
}

const expectedAffectedProjects = [
  {
    id: '5a8d88c8-a45d-4ad5-9c22-7b495bd483eb',
    name: 'rust',
    version: '1.12.1',
    vulnerabilities: -1,
  },
  {
    id: 'fcaa99a8-4377-485a-9cb5-4771aa03f179',
    name: 'whiskey',
    version: '1.1.2',
    vulnerabilities: -1,
  },
  {
    id: 'dfcc3180-5548-4d35-b321-49187cba593e',
    name: 'kellys-cool-project',
    version: '1.20.19',
    vulnerabilities: -1,
  },
]
