/* eslint-env jest */
import nock from 'nock'
import { Auth } from '../auth/auth'
import { Usage } from './usage'

describe('Usage', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('info', () => {
    test('should return the total purchaged and total used fields', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/usage/info?team_id=abc')
        .reply(200, { TotalPurchased: 100, TotalUsed: 10 })
      return Usage.info({ teamId: 'abc' }).then(res => {
        expect(res.data).toEqual({ TotalPurchased: 100, TotalUsed: 10 })
      })
    })

    test('should handle a no-op flag, and return the proper response', () => {
      const res = Usage.info({ teamId: 'abc', noOp: true})
      expect(res).toEqual({ TotalPurchased: -2, TotalUsed: 0 })
      
    })

    test('should handle a false no-op flag if present, and return the proper response', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/usage/info?team_id=abc')
        .reply(200, { TotalPurchased: 100, TotalUsed: 10 })
      return Usage.info({ teamId: 'abc', noOp: false }).then(res => {
        expect(res.data).toEqual({ TotalPurchased: 100, TotalUsed: 10 })
      })
      
    })
  })
})
