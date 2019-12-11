/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Users } from './users'
import { expect } from 'chai'

describe('Reports', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Analysis Report', () => {
    test('should get an analysis report', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/users/getSelf')
        .reply(200, { data: expectedGetSelf })

      return Users.getSelf()
        .then(resp => {
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
