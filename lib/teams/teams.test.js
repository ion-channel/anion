/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Teams } from './teams'
import { expect } from 'chai'

describe('Teams', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('AcceptInvite', () => {
    test('should send an accept invite', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'aninvitetoken')
        .put('/v1/teamUsers/acceptInvite')
        .reply(204, {})

      return Teams.acceptInvite({
        id: 'inviteid',
        token: 'aninvitetoken',
      }).then(resp => {
        expect(resp).to.not.be.an('error')
      })
    })
  })

  describe('GetTeam', () => {
    test('should get a team', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?id=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(200, {
          data: expectedTeam,
          meta: {
            total_count: 1,
          },
        })

      return Teams.getTeam({ id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc' }).then(
        teamResp => {
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
        },
      )
    })

    test('should return an error on a not found', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?id=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(404)

      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response).to.be.a('error')
        expect(response.message).to.contain('Request failed')
      })
    })

    test('should return an error on a bad response', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?id=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(500)

      return Teams.getTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response).to.be.a('error')
        expect(response.message).to.contain('Request failed')
      })
    })
  })

  describe('GetTeamUsers', () => {
    test('should get a teams users', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teamUsers/getTeamUsers?team_id=someteam')
        .reply(200, {
          data: expectedTeamUsers,
        })

      return Teams.getTeamUsers({ teamId: 'someteam' }).then(resp => {
        expect(resp).to.not.be.an('error')
        expect(resp).to.not.be.an('undefined')
        expect(resp.length).to.equal(expectedTeamUsers.length)

        expect(resp[0].username).to.equal('ion-channel')
      })
    })
  })

  describe('InviteTeamUser', () => {
    test('should invite a team user', () => {
      const expectedBody = {
        team_id: 'someteam',
        user_id: 'someuser',
        role: 'admin',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/teamUsers/inviteTeamUser', expectedBody)
        .reply(201, {
          data: expectedTeamUser,
        })

      return Teams.inviteTeamUser({
        teamId: 'someteam',
        userId: 'someuser',
        role: 'admin',
      }).then(resp => {
        expect(resp).to.not.be.an('error')
        expect(resp).to.not.be.an('undefined')
        expect(resp.id).to.equal(expectedTeamUser.id)
        expect(resp.team_id).to.equal(expectedTeamUser.team_id)
      })
    })

    test('should allow for an email instead of a user id', () => {
      const expectedBody = {
        team_id: 'someteam',
        email: 'someuser@ionchannel.io',
        role: 'admin',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/teamUsers/inviteTeamUser', expectedBody)
        .reply(201, {
          data: expectedTeamUser,
        })

      return Teams.inviteTeamUser({
        teamId: 'someteam',
        email: 'someuser@ionchannel.io',
        role: 'admin',
      }).then(resp => {
        expect(resp).to.not.be.an('error')
        expect(resp).to.not.be.an('undefined')
        expect(resp.id).to.equal(expectedTeamUser.id)
        expect(resp.team_id).to.equal(expectedTeamUser.team_id)
      })
    })

    test('should allow favor user id over email', () => {
      const expectedBody = {
        team_id: 'someteam',
        user_id: 'someuser',
        role: 'admin',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/teamUsers/inviteTeamUser', expectedBody)
        .reply(201, {
          data: expectedTeamUser,
        })

      return Teams.inviteTeamUser({
        teamId: 'someteam',
        userId: 'someuser',
        email: 'someuser@ionchannel.io',
        role: 'admin',
      }).then(resp => {
        expect(resp).to.not.be.an('error')
        expect(resp).to.not.be.an('undefined')
        expect(resp.id).to.equal(expectedTeamUser.id)
        expect(resp.team_id).to.equal(expectedTeamUser.team_id)
      })
    })
  })

  describe('GetTeams', () => {
    test('should get a users teams', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeams')
        .reply(200, {
          data: expectedUsersTeams,
          meta: {
            total_count: expectedUsersTeams.length,
          },
        })

      return Teams.getTeams().then(teamsResp => {
        expect(teamsResp).to.not.be.an('error')
        expect(teamsResp).to.not.be.an('undefined')
        expect(teamsResp.teams).to.not.be.an('undefined')
        expect(teamsResp.meta).to.not.be.an('undefined')

        expect(teamsResp.meta.total_count).to.equal(1)

        const teams = teamsResp.teams
        expect(teams.length).to.equal(expectedUsersTeams.length)

        const expTeam = expectedUsersTeams[0]
        const team = teams[0]
        expect(team.id).to.equal(expTeam.id)
        expect(team.name).to.equal(expTeam.name)
        expect(team.created_at).to.equal(expTeam.created_at)
        expect(team.updated_at).to.equal(expTeam.updated_at)
        expect(team.sys_admin).to.equal(expTeam.sys_admin)
      })
    })

    test('should return an error on a bad jwt', () => {
      Auth.clearToken()

      nock('http://localhost:8001')
        .get('/v1/teams/getTeams')
        .reply(404)

      return Teams.getTeams().catch(response => {
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

const expectedTeamUsers = [
  {
    id: '7e80441b-bab2-492b-b3dc-bf7f6496b747',
    created_at: '2016-08-17T21:07:29.720Z',
    updated_at: '2016-08-17T21:07:29.720Z',
    team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
    user_id: 'a4f9d578-77c0-4da9-87d1-fe2019e08ae9',
    role: 'admin',
    deleted_at: null,
    status: 'active',
    inviter: null,
    invited_at: '2016-08-17T21:07:29.720Z',
    username: 'ion-channel',
    email: 'admin@ionchannel.io',
    chat_handle: null,
    last_active_at: '2019-12-11T21:06:21.158Z',
  },
  {
    id: 'eaa6c176-fdb7-4299-9ea9-fa2b0aa8fc2d',
    created_at: '2019-01-19T00:27:31.271Z',
    updated_at: '2019-01-19T00:27:54.695Z',
    team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
    user_id: '8098a997-8c2c-4e27-a2d1-8a47eaaeb375',
    role: 'admin',
    deleted_at: null,
    status: 'active',
    inviter: 'f8636445-a1ab-434b-87ef-329ab7aba37e',
    invited_at: '2019-01-19T00:27:31.271Z',
    username: 'bunsen',
    email: 'dev@ionchannel.io',
    chat_handle: null,
    last_active_at: '2019-12-11T20:56:11.991Z',
  },
  {
    id: '67297910-1cce-480b-9e56-481b2383ebc0',
    created_at: '2019-01-31T17:22:23.084Z',
    updated_at: '2019-01-31T17:22:40.700Z',
    team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
    user_id: 'cea1d908-7934-46b9-b4ef-0b3c9a0b119b',
    role: 'admin',
    deleted_at: null,
    status: 'active',
    inviter: 'f8636445-a1ab-434b-87ef-329ab7aba37e',
    invited_at: '2019-01-31T17:22:23.084Z',
    username: 'kelly',
    email: 'kelly.plummer@ionchannel.io',
    chat_handle: null,
    last_active_at: '2019-11-15T17:02:24.301Z',
  },
  {
    id: '5fb0bf6c-9df7-40ed-858b-48c6221dd535',
    created_at: '2019-06-23T17:22:30.759Z',
    updated_at: '2019-06-23T17:22:30.759Z',
    team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
    user_id: '72703033-e379-4b9b-9fb1-fb41467b80bf',
    role: 'member',
    deleted_at: null,
    status: 'pending',
    inviter: 'f8636445-a1ab-434b-87ef-329ab7aba37e',
    invited_at: '2019-06-23T17:22:30.759Z',
    username: 'mike.swain',
    email: 'mike.swain@ionchannel.io',
    chat_handle: null,
    last_active_at: '2019-10-30T17:15:45.595Z',
  },
  {
    id: '86a5c626-4849-4510-953c-a6c0af31f655',
    created_at: '2019-07-10T18:32:14.892Z',
    updated_at: '2019-07-10T18:32:14.892Z',
    team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
    user_id: '6213c445-6036-4e37-8bb9-b6fd73a78ead',
    role: 'member',
    deleted_at: null,
    status: 'pending',
    inviter: 'f8636445-a1ab-434b-87ef-329ab7aba37e',
    invited_at: '2019-07-10T18:32:14.892Z',
    username: 'mbenton',
    email: 'megan.benton@ionchannel.io',
    chat_handle: null,
    last_active_at: '2019-06-18T20:58:57.430Z',
  },
]

const expectedTeamUser = {
  id: '7e80441b-bab2-492b-b3dc-bf7f6496b747',
  created_at: '2016-08-17T21:07:29.720Z',
  updated_at: '2016-08-17T21:07:29.720Z',
  team_id: 'cb8d4daa-dca7-47b5-9117-c5e1e066b66a',
  user_id: 'a4f9d578-77c0-4da9-87d1-fe2019e08ae9',
  role: 'admin',
  deleted_at: null,
  status: 'active',
  inviter: null,
  invited_at: '2016-08-17T21:07:29.720Z',
  username: 'ion-channel',
  email: 'admin@ionchannel.io',
  chat_handle: null,
  last_active_at: '2019-12-11T21:06:21.158Z',
}
