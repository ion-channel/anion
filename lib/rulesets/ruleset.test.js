/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Rulesets } from './rulesets'

describe('Rulesets', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
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
  })
})
