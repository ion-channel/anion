/* eslint-env jest */

import { Auth } from '../auth/auth'
import { Sessions } from '../sessions/sessions'
import { Teams } from './teams'

describe('Teams', () => {
  beforeAll(() => {
    global.document = {}
  })

  describe('GetTeam', () => {
    beforeAll(() => {
      return Sessions.login('ion', 'channel').then(session => {
        Auth.setToken(session.jwt)
      })
    })

    test('should get a team', () => {
      return Teams.getTeam({ id: expectedTeam.id }).then(teamResp => {
        expect(teamResp).not.toBe('error')
        expect(teamResp).toBeDefined()
        expect(teamResp.team).toBeDefined()
        expect(teamResp.meta).toBeDefined()

        expect(teamResp.meta.total_count).toEqual(1)

        const team = teamResp.team
        expect(team).toEqual(expectedTeam)
      })
    })

    test('should return an error on a not found', () => {
      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toBe('Request failed with status code 423')
      })
    })

    test('should return an error on a bad response', () => {
      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toBe('Request failed with status code 423')
      })
    })
  })

  describe('GetTeams', () => {
    test('should get a users teams', () => {
      return Sessions.login('ion', 'channel').then(session => {
        Auth.setToken(session.jwt)

        return Teams.getTeams().then(teamsResp => {
          expect(teamsResp).not.toBe('error')
          expect(teamsResp).toBeDefined()
          expect(teamsResp.teams).toBeDefined()
          expect(teamsResp.meta).toBeDefined()

          expect(teamsResp.meta.total_count).toBeGreaterThanOrEqual(1)

          const teams = teamsResp.teams
          expect(teams.length).toBeGreaterThanOrEqual(1)

          expect(teamsResp.meta.total_count).toEqual(teams.length)
        })
      })
    })

    test('should return an error on a bad jwt', () => {
      Auth.clearToken()

      return Teams.getTeams().catch(response => {
        expect(response.message).toBe('Request failed with status code 401')
        expect(response.response.status).toEqual(401)
      })
    })
  })
})

const expectedTeam = {
  team: {
    created_at: '2019-03-13T19:05:53.497295Z',
    default_deploy_key: '',
    deleted_at: '0001-01-01T00:00:00Z',
    delivering: false,
    id: '1432e8d9-71e9-4a78-a5de-78262ba2a1e9',
    name: 'Demo Team',
    poc_email: '',
    poc_name: '',
    sys_admin: false,
    updated_at: '2019-03-13T19:05:53.497295Z',
  },
  meta: {
    last_update: '0001-01-01T00:00:00Z',
    offset: 0,
    total_count: 1,
  },
}
