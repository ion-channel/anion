/* eslint-env mocha */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Teams } from './teams'
import { expect } from 'chai'

describe('Teams', () => {
  before(() => {
    global.API_BASEURL = 'https://api.ionchannel.io'
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('GetTeam', () => {
    it('should get a team', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(200, {
          data: expectedTeam,
          meta: {
            total_count: 1,
          },
        })

      return Teams.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .then(teamResp => {
          expect(teamResp).to.not.be.an('error')
          expect(teamResp).to.not.be.an('undefined')
          expect(teamResp.team).to.not.be.an('undefined')
          expect(teamResp.meta).to.not.be.an('undefined')

          expect(teamResp.meta.total_count).to.equal(1)

          let team = teamResp.team
          expect(team.id).to.equal(expectedTeam.id)
          expect(team.name).to.equal(expectedTeam.name)
          expect(team.created_at).to.equal(expectedTeam.created_at)
          expect(team.updated_at).to.equal(expectedTeam.updated_at)
          expect(team.sys_admin).to.equal(expectedTeam.sys_admin)
        })
    })

    it('should return an error on a not found', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(404)

      return Teams.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })

    it('should return an error on a bad response', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(500)

      return Teams.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })

  describe('GetTeams', () => {
    it('should get a users teams', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeams')
        .reply(200, {
          data: expectedUsersTeams,
          meta: {
            total_count: expectedUsersTeams.length,
          },
        })

      return Teams.getTeams()
        .then(teamsResp => {
          expect(teamsResp).to.not.be.an('error')
          expect(teamsResp).to.not.be.an('undefined')
          expect(teamsResp.teams).to.not.be.an('undefined')
          expect(teamsResp.meta).to.not.be.an('undefined')

          expect(teamsResp.meta.total_count).to.equal(1)

          let teams = teamsResp.teams
          expect(teams.length).to.equal(expectedUsersTeams.length)

          let expTeam = expectedUsersTeams[0]
          let team = teams[0]
          expect(team.id).to.equal(expTeam.id)
          expect(team.name).to.equal(expTeam.name)
          expect(team.created_at).to.equal(expTeam.created_at)
          expect(team.updated_at).to.equal(expTeam.updated_at)
          expect(team.sys_admin).to.equal(expTeam.sys_admin)
        })
    })

    it('should return an error on a not found', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeams')
        .reply(404)

      return Teams.getTeams()
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })

    it('should return an error on a bad response', () => {
      nock('https://api.ionchannel.io')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeams')
        .reply(500)

      return Teams.getTeams()
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })
})

const expectedTeam = {
  id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
  created_at: '2016-09-09T22:06:49.487Z',
  updated_at: '2016-09-09T22:06:49.487Z',
  name: 'ion-channel',
  sys_admin: true,
  poc_name: '',
  poc_email: '',
}

const expectedUsersTeams = [
  {
    id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
    created_at: '2016-09-09T22:06:49.487Z',
    updated_at: '2016-09-09T22:06:49.487Z',
    name: 'ion-channel',
    sys_admin: true,
    poc_name: '',
    poc_email: '',
    role: 'member',
  },
]
