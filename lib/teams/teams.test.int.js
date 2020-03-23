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
      return Teams.getTeam({ id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c' }).then(
        teamResp => {
          expect(teamResp).not.toBe('error')
          expect(teamResp).toBeDefined()
          expect(teamResp.team).toBeDefined()
          expect(teamResp.meta).toBeDefined()

          expect(teamResp.meta.total_count).toEqual(1)

          const team = teamResp.team
          expect(team.id).toEqual(expectedTeam.id)
          expect(team.name).toEqual(expectedTeam.name)
          expect(team.created_at).toEqual(expectedTeam.created_at)
          expect(team.updated_at).toEqual(expectedTeam.updated_at)
          expect(team.sys_admin).toEqual(expectedTeam.sys_admin)
        },
      )
    })

    test('should return an error on a not found', () => {
      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toBe('Request failed with status code 404')
      })
    })

    test('should return an error on a bad response', () => {
      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toBe('Request failed with status code 404')
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
  id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
  created_at: '2018-05-31T16:59:24.334349Z',
  updated_at: '2018-05-31T16:59:24.334349Z',
  name: 'ion-channel',
  sys_admin: true,
  poc_name: '',
  poc_email: '',
}
