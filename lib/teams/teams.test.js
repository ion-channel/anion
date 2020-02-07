/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Teams } from './teams'

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
        expect(resp).toEqual({})
      })
    })
  })

  describe('GetTeam', () => {
    test('should get a team', () => {
      const expectedRes = {
        data: expectedTeam,
        meta: {
          total_count: 1,
        },
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getTeam?id=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
        .reply(200, expectedRes)

      return Teams.getTeam({ id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc' }).then(
        teamResp => {
          expect(teamResp).toEqual({
            meta: {
              total_count: 1,
            },
            team: {
              created_at: '2016-09-09T22:06:49.487Z',
              id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
              name: 'ion-channel',
              poc_email: '',
              poc_name: '',
              sys_admin: true,
              updated_at: '2016-09-09T22:06:49.487Z',
            },
          })
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
        expect(response.message).toEqual('Request failed with status code 404')
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
        expect(response.message).toEqual('Request failed with status code 500')
      })
    })
  })

  describe('Update Team', () => {
    test('should update a team', () => {
      const expectedBody = {
        someid: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
        name: 'somenewname',
        poc_name: 'NewGuy',
        poc_email: 'newguy@ionchannel.io',
      }
      const expectedRes = {
        data: expectedTeam,
        meta: {
          total_count: 1,
        },
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/teams/updateTeam', expectedBody)
        .reply(200, expectedRes)

      return Teams.updateTeam({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
        name: 'somenewname',
        pocName: 'NewGuy',
        pocEmail: 'newguy@ionchannel.io',
      }).then(resp => {
        expect(resp).toEqual(expectedTeam)
      })
    })
  })

  describe('Create Team', () => {
    test('should create a team', () => {
      const expectedBody = {
        name: 'best team',
        poc_name: 'NewGuy',
        poc_email: 'newguy@ionchannel.io',
        email: 'newguy@ionchannel.io',
        username: 'thisguy',
      }
      const expectedRes = {
        data: expectedTeam,
        meta: {
          total_count: 1,
        },
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/teams/establishTeam', expectedBody)
        .reply(200, expectedRes)

      return Teams.createTeam({
        name: 'best team',
        pocName: 'NewGuy',
        email: 'newguy@ionchannel.io',
        username: 'thisguy',
      }).then(resp => {
        expect(resp).toEqual(expectedTeam)
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
        expect(resp).toEqual(expectedTeamUsers)
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
        expect(resp).toEqual(expectedTeamUser)
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
        expect(resp).toEqual(expectedTeamUser)
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
        expect(resp).toEqual(expectedTeamUser)
      })
    })
  })

  describe('ResendInvite', () => {
    test('should resend an invite', () => {
      const expectedBody = {
        someid: 'someteamuserid',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/teamUsers/resendInvite', expectedBody)
        .reply(201, {
          data: expectedTeamUser,
        })

      return Teams.resendInvite({
        id: 'someteamuserid',
      }).then(resp => {
        expect(resp).toEqual(expectedTeamUser)
      })
    })
  })

  describe('DeleteTeamUser', () => {
    test('should delete a team user', () => {
      const expectedBody = {
        someid: 'someteamuserid',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .delete('/v1/teamUsers/deleteTeamUser', expectedBody)
        .reply(200, {
          data: expectedDeleteTeamUser,
        })

      return Teams.deleteTeamUser({ id: 'someteamuserid' }).then(resp => {
        expect(resp).toEqual(expectedDeleteTeamUser)
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
        expect(teamsResp).toEqual({
          meta: {
            total_count: 1,
          },
          teams: [
            {
              created_at: '2016-09-09T22:06:49.487Z',
              id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
              name: 'ion-channel',
              poc_email: '',
              poc_name: '',
              role: 'member',
              sys_admin: true,
              updated_at: '2016-09-09T22:06:49.487Z',
            },
          ],
        })
      })
    })

    test('should return an error on a bad jwt', () => {
      Auth.clearToken()

      nock('http://localhost:8001')
        .get('/v1/teams/getTeams')
        .reply(404)

      return Teams.getTeams().catch(response => {
        expect(response.message).toEqual('Request failed with status code 404')
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

const expectedDeleteTeamUser = {
  message: 'Deleted Team User: 210303a4-8be2-41fb-84d5-7c80a7116dfe',
}
