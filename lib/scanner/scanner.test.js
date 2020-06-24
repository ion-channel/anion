/* eslint-env jest */
import nock from 'nock'
import { Auth } from '../auth/auth'
import { Scanner } from './scanner'

describe('Scanner', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('getAnalysisStatus', () => {
    test('should get the analysis report of a project', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get(
          '/v1/scanner/getAnalysisStatus?project_id=someproject&team_id=bestteam&id=id',
        )
        .reply(200, { data: expectedLatestAnalysisStatusResponse })

      return Scanner.getAnalysisStatus({
        projectId: 'someproject',
        teamId: 'bestteam',
        id: 'id',
      }).then(res => {
        expect(res).toEqual(expectedLatestAnalysisStatusResponse)
      })
    })
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

  describe('analyzeProject', () => {
    test('should return a success response', () => {
      const analyzeProjectRes = {
        data: {
          id: '160d9af7-40f2-4de0-a2ad-039b174f3285',
          team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
          project_id: '8ca10aea-7448-4fba-920e-e0abab735071',
          build_number: null,
          status: 'accepted',
          message:
            'Request for analysis 160d9af7-40f2-4de0-a2ad-039b174f3285 on many-virus-project has been accepted.',
          created_at: '2020-02-10T20:52:20.871Z',
          updated_at: '2020-02-10T20:52:20.871Z',
          branch: 'cat-minion',
        },
        meta: {
          copyright:
            'Copyright 2018 Selection Pressure LLC www.selectpress.net',
          authors: ['Ion Channel Dev Team'],
          version: 'v1',
        },
        links: {
          created:
            'http://localhost:4567/v1/scanner/analyzeProject?id=160d9af7-40f2-4de0-a2ad-039b174f3285',
        },
        timestamps: {
          created: '2020-02-10T20:52:20.871Z',
          updated: '2020-02-10T20:52:20.871Z',
        },
      }

      const expectedBody = {
        project_id: '8ca10aea-7448-4fba-920e-e0abab735071',
        team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/scanner/analyzeProject', expectedBody)
        .reply(200, analyzeProjectRes)

      return Scanner.analyzeProject({
        projectId: '8ca10aea-7448-4fba-920e-e0abab735071',
        teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      }).then(res => {
        expect(res).toEqual(analyzeProjectRes)
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
