/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Tokens } from './tokens'
import { expect } from 'chai'

describe('Tokens', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Get Tokens', () => {
    test('should get a list of users tokens', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/tokens/getTokens?cli=true')
        .reply(200, { data: expectedTokens })

      return Tokens.getTokens({ cli: true }).then(resp => {
        expect(resp).to.not.be.a('error')

        expect(resp.length).to.equal(expectedTokens.length)
        expect(resp[0].name).to.equal('mahtoken')
        expect(resp[0].sub).to.equal('3fd8243f-6197-421b-b073-ee2d7c726d09')
        expect(resp[0].cli).to.equal(true)
      })
    })
  })

  describe('Delete Token', () => {
    test('should delete a single token', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .delete(
          '/v1/tokens/deleteToken?id=f76c469b-4487-40d9-91d5-bc32fb317009',
        )
        .reply(204)

      return Tokens.deleteToken({
        id: 'f76c469b-4487-40d9-91d5-bc32fb317009',
      }).then(resp => {
        expect(resp).to.not.be.a('error')
      })
    })
  })
})

const expectedTokens = [
  {
    jti: '6af992c9-cd9d-45f8-b78f-1fe845d31825',
    sub: '3fd8243f-6197-421b-b073-ee2d7c726d09',
    iat: 1577993178,
    name: 'mahtoken',
    cli: true,
  },
  {
    jti: 'efcc7f3d-528c-4dbe-b8d6-80f0f351164c',
    sub: '3fd8243f-6197-421b-b073-ee2d7c726d09',
    iat: 1577993274,
    name: 'anothertoken',
    cli: true,
  },
]
