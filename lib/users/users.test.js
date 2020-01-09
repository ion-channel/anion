/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Users } from './users'
import { expect } from 'chai'

describe('Users', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Get Self', () => {
    test('should get self', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/users/getSelf')
        .reply(200, { data: expectedGetSelf })

      return Users.getSelf().then(resp => {
        expect(resp).to.not.be.a('error')

        expect(resp.username).to.equal('ion-channel')
        expect(Object.keys(resp.teams).length).to.equal(1)
      })
    })

    test('should send custom token if given', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer differenttoken')
        .get('/v1/users/getSelf')
        .reply(200, { data: expectedGetSelf })

      return Users.getSelf('differenttoken').then(resp => {
        expect(resp).to.not.be.a('error')

        expect(resp.username).to.equal('ion-channel')
        expect(Object.keys(resp.teams).length).to.equal(1)
      })
    })
  })

  describe('Password Reset', () => {
    test('should reset a users password', () => {
      const expectedBody = {
        email: 'myemail@ionchannel.io',
      }

      nock('http://localhost:8001')
        .post('/v1/users/resetPassword', expectedBody)
        .reply(201, { message: 'Password reset created successfully' })

      return Users.resetPassword({ email: 'myemail@ionchannel.io' }).then(
        resp => {
          expect(resp).to.not.be.a('error')

          expect(resp.message).to.equal('Password reset created successfully')
        },
      )
    })
  })

  describe('Update User', () => {
    test('should update a user', () => {
      const expectedBody = {
        someid: 'myuserid',
        password: 'mynewpassword',
      }

      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/users/updateUser', expectedBody)
        .reply(200, { data: expectedUser })

      return Users.updateUser({
        id: 'myuserid',
        password: 'mynewpassword',
      }).then(resp => {
        expect(resp).to.not.be.a('error')

        expect(resp.username).to.equal('ion-channel')
        expect(Object.keys(resp.teams).length).to.equal(1)
      })
    })
  })
})

const expectedGetSelf = {
  id: '15f402cc-0770-4285-9ecb-8f746a567d2b',
  email: 'admin@ionchannel.io',
  username: 'ion-channel',
  chat_handle: '',
  created_at: '2016-08-17T21:07:29.697168Z',
  updated_at: '2019-12-11T21:59:31.357117Z',
  last_active_at: '2019-12-11T21:59:31.357117Z',
  externally_managed: false,
  metadata: null,
  sys_admin: true,
  system: false,
  teams: {
    '13804c75-4733-44ca-90e6-511b1af64294': 'system admin',
  },
}

const expectedUser = {
  id: 'c172c904-4845-4662-9509-b9072e3ec7d3',
  email: 'admin@ionchannel.io',
  username: 'ion-channel',
  chat_handle: '',
  created_at: '2016-08-17T21:07:29.697168Z',
  updated_at: '2019-12-11T21:59:31.357117Z',
  last_active_at: '2019-12-11T21:59:31.357117Z',
  externally_managed: false,
  metadata: null,
  sys_admin: true,
  system: false,
  teams: {
    'cd85c358-2918-4d1d-b9be-642063b4ad74': 'system admin',
  },
}
