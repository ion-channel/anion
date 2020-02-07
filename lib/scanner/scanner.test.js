/* eslint-env jest */
import nock from 'nock'
import { Auth } from '../auth/auth'
import { Scanner } from './scanner'

describe('Scanner', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })
  describe('getLatestAnalysisStatus', () => {
    test('should get the latest analysis report of a project', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/scanner/getLatestAnalysisStatus?project_id=someproject&team_id=bestteam',
        )
        .reply(200, { data: expectedLatestAnalysisStatusResponse })

      return Scanner.getLatestAnalysisStatus({
        projectId: 'someproject',
        teamId: 'bestteam',
      }).then(res => {
        expect(res).toEqual(expectedLatestAnalysisStatusResponse)
      })
    })
  })
})

const expectedLatestAnalysisStatusResponse = {
  id: 'id',
  team_id: 'bestteam',
  project_id: 'someproject',
  message: 'message',
  branch: 'master',
  status: 'passing',
  created_at: 'some date',
  updated_at: 'another date',
  scan_status: [],
  deliveries: {
    '123': {
      id: 'mock data',
      team_id: 'mock data',
      project_id: 'mock data',
      analysis_id: 'mock data',
      destination: 'mock data',
      status: 'mock data',
      filename: 'mock data',
      hash: 'mock data',
      message: 'mock data',
      created_at: 'mock data',
      updated_at: 'mock data',
      delivered_at: 'mock data',
    },
  },
}
