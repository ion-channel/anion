/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Rulesets } from './rulesets'

describe('Rulesets', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('getAppliedRuleSet', () => {
    test('should get an applied rule set', () => {
      const mockAppliedRuleset = {
        analysis_id: 'bc74d9fa-2cdb-4c2b-91ad-5be9cabecd9d',
        project_id: 'someproject',
        created_at: '2020-06-18T13:12:12.628926Z',
        updated_at: '2020-06-18T13:12:12.628926Z',
        team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
        rule_evaluation_summary: {},
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/ruleset/getAppliedRulesetForProject?project_id=foo&team_id=123&analysis_id=abc',
        )
        .reply(200, { data: mockAppliedRuleset })

      return Rulesets.getAppliedRuleSet({
        analysisId: 'abc',
        projectId: 'foo',
        teamId: '123',
      }).then(data => {
        expect(data).toEqual(mockAppliedRuleset)
      })
    })
  })

  describe('getRuleset', () => {
    test('should get a ruleset for a team', () => {
      const mockRuleset = {
        data: {
          id: 'bc74d9fa-2cdb-4c2b-91ad-5be9cabecd9d',
          created_at: '2020-06-18T13:12:12.628926Z',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
        },
        meta: {
          last_update: '0001-01-01T00:00:00Z',
          offset: 0,
          total_count: 1,
        },
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/ruleset/getRuleset?id=abc&team_id=123')
        .reply(200, { data: mockRuleset })

      return Rulesets.getRuleset({
        id: 'abc',
        teamId: '123',
      }).then(({ data }) => {
        expect(data).toEqual(mockRuleset)
      })
    })
  })

  describe('getProjectHistory', () => {
    test('should get the analysis history for a project', () => {
      const mockProjectHistory = {
        data: [
          {
            analysis_id: 'bc74d9fa-2cdb-4c2b-91ad-5be9cabecd9d',
            created_at: '2020-06-18T13:12:12.628926Z',
            pass: false,
            project_id: 'c5e4672e-85c2-4c35-ac3e-c08449341f12',
            team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          },
          {
            analysis_id: '14bba059-90b2-4086-90ce-4677efc1e357',
            created_at: '2020-06-17T13:14:40.935816Z',
            pass: false,
            project_id: 'c5e4672e-85c2-4c35-ac3e-c08449341f12',
            team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          },
        ],
        meta: {
          last_update: '0001-01-01T00:00:00Z',
          offset: 0,
          total_count: 59,
        },
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/ruleset/getProjectHistory?project_id=abc')
        .reply(200, { data: mockProjectHistory })

      return Rulesets.getProjectHistory({
        projectId: 'abc',
      }).then(({ data }) => {
        expect(data).toEqual(mockProjectHistory)
      })
    })

    test('should take a from and to query', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/ruleset/getProjectHistory?project_id=abc&from=2020-10-28&to=2020-10-29',
        )
        .reply(200, { data: {} })

      return Rulesets.getProjectHistory({
        projectId: 'abc',
        from: '2020-10-28',
        to: '2020-10-29',
      }).then(({ data }) => {
        expect(data).toEqual({})
      })
    })
  })

  describe('deleteRuleset', () => {
    test('should delete a ruleset', () => {
      const mockDeleteRuleset = {
        data: null,
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .delete('/v1/ruleset/deleteRuleset?ruleset_id=rule_id_1&team_id=team_a')
        .reply(200, mockDeleteRuleset)

      return Rulesets.deleteRuleset({
        rulesetId: 'rule_id_1',
        teamId: 'team_a',
      }).then(({ data }) => {
        expect(data).toEqual(mockDeleteRuleset)
      })
    })
  })

  describe('getRulesets', () => {
    test('should return an array of rulesets', () => {
      const rulesets = [
        {
          id: 'b503a916-0a5c-48e9-a8d4-c9eb21caf5a1',
          team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
          name: 'single committer',
          description: 'one',
          rule_ids: [
            'f746023f-16cc-46db-9422-1e4e3364ab97',
            '2981e1b0-0c8f-0137-8fe7-186590d3c755',
          ],
          created_at: '2019-03-19T20:39:44.446009Z',
          updated_at: '2019-03-19T20:39:44.446009Z',
          rules: [
            {
              id: 'f746023f-16cc-46db-9422-1e4e3364ab97',
              scan_type: 'virus',
              name: 'Has no viruses',
              description:
                'When this rule is enabled, an analysis will fail if any virus is detected.',
              category: 'Virus',
              created_at: '2019-01-17T22:45:43.451734Z',
              updated_at: '2021-01-12T22:42:16.946872Z',
              deprecated: false,
            },
          ],
          has_deprecated_rules: false,
          has_projects_assigned: true,
        },
      ]
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/ruleset/getRulesets?team_id=abc')
        .reply(200, { data: rulesets })

      return Rulesets.getRulesets({ teamId: 'abc' }).then(res => {
        expect(res).toEqual(rulesets)
      })
    })
  })

  describe('getRules', () => {
    test('should return an array of rules', () => {
      const rules = [
        {
          id: '276bbec3',
          scan_type: 'dependencies_version_exist',
          name: 'Dependencies Version Exist',
          description:
            'When this rule is enabled, an analysis will fail if any dependency without a version specified is detected.',
          category: 'Dependencies',
          created_at: '2019-01-17T22:45:43.390Z',
          updated_at: '2021-01-12T22:42:16.900Z',
          deprecated: null,
        },
      ]

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/ruleset/getRules')
        .reply(200, { data: rules })

      return Rulesets.getRules().then(res => {
        expect(res).toEqual(rules)
      })
    })
  })

  describe('createRuleset', () => {
    test('should take a ruleset and return that ruleset', () => {
      const newRuleset = {
        description: '',
        name: 'ruleset abc',
        ruleIds: ['f746023f'],
        teamId: '646fa3e5',
      }

      const createdRuleset = {
        ...newRuleset,
        id: 'abc',
        created_at: '2021-01-12T23:35:00.564Z',
        updated_at: '2021-01-12T23:35:00.564Z',
        deleted_at: null,
        deleted_by: null,
        rules: [
          {
            id: 'f746023f-16cc-46db-9422-1e4e3364ab97',
            scan_type: 'virus',
            name: 'Has no viruses',
            description:
              'When this rule is enabled, an analysis will fail if any virus is detected.',
            category: 'Virus',
            created_at: '2019-01-17T22:45:43.451Z',
            updated_at: '2021-01-12T22:42:16.946Z',
            deprecated: null,
          },
        ],
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/ruleset/createRuleset')
        .reply(200, { data: createdRuleset })

      return Rulesets.createRuleset(newRuleset).then(res => {
        expect(res.data.data).toEqual(createdRuleset)
      })
    })
  })

  describe('deleteRuleset', () => {
    test('should take a ruleset and return that ruleset', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .delete(
          '/v1/ruleset/deleteRuleset?ruleset_id=14229edc&team_id=646fa3e5',
        )
        .reply(200, { data: null })

      return Rulesets.deleteRuleset({
        rulesetId: '14229edc',
        teamId: '646fa3e5',
      }).then(res => {
        expect(res.data.data).toBe(null)
      })
    })
  })
})
