/* eslint-env mocha */

import { Auth } from '../auth/auth'
import { Sessions } from '../sessions/sessions'
import { Teams } from './teams'
import { expect } from 'chai'

describe('Teams', () => {
  before(() => {
    global.API_ENDPOINT = 'http://localhost:4567'
    global.document = {}
  })

  describe('GetTeam', () => {
    before(() => {
      return Sessions.login('ion', 'channel')
        .then(session => {
          Auth.setToken(session.jwt)
        })
    })

    it('should get a team', () => {
      return Teams.getTeam('bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c')
        .then(teamResp => {
          expect(teamResp).to.not.be.an('error')
          expect(teamResp).to.not.be.an('undefined')
          expect(teamResp.team).to.not.be.an('undefined')
          expect(teamResp.meta).to.not.be.an('undefined')

          expect(teamResp.meta.total_count).to.equal(1)

          const team = teamResp.team
          expect(team.id).to.equal(expectedTeam.id)
          expect(team.name).to.equal(expectedTeam.name)
          expect(team.created_at).to.equal(expectedTeam.created_at)
          expect(team.updated_at).to.equal(expectedTeam.updated_at)
          expect(team.sys_admin).to.equal(expectedTeam.sys_admin)
        })
    })

    it('should return an error on a not found', () => {
      return Teams.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })

    it('should return an error on a bad response', () => {
      return Teams.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })

  describe('GetTeams', () => {
    it('should get a users teams', () => {
      return Sessions.login('ion', 'channel')
        .then(session => {
          Auth.setToken(session.jwt)

          return Teams.getTeams()
            .then(teamsResp => {
              expect(teamsResp).to.not.be.an('error')
              expect(teamsResp).to.not.be.an('undefined')
              expect(teamsResp.teams).to.not.be.an('undefined')
              expect(teamsResp.meta).to.not.be.an('undefined')

              expect(teamsResp.meta.total_count).to.be.at.least(1)

              const teams = teamsResp.teams
              expect(teams.length).to.be.at.least(1)

              expect(teamsResp.meta.total_count).to.equal(teams.length)
            })
        })
    })

    it('should return an error on a bad jwt', () => {
      Auth.clearToken()

      return Teams.getTeams()
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
          expect(response.response.status).to.equal(401)
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
