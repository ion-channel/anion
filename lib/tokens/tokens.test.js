/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Tokens } from './tokens'

describe('Tokens', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Create Token', () => {
    test('should create a cli token', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/tokens/createToken?name=awesometoken&cli=true')
        .reply(201, { data: expectedCreatedToken })

      return Tokens.createToken({
        name: 'awesometoken',
      }).then((resp) => {
        expect(resp.data).toEqual(expectedCreatedToken)
      })
    })
  })

  describe('Get Tokens', () => {
    test('should get a list of users tokens', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/tokens/getTokens?cli=true')
        .reply(200, { data: expectedTokens })

      return Tokens.getTokens({ cli: true }).then((resp) => {
        expect(resp).toEqual(expectedTokens)
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
      }).then((resp) => {
        expect(resp).toEqual('')
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

const expectedCreatedToken =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c'
