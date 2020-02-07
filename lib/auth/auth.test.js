/* eslint-env jest */
import { Auth } from './auth'

describe('Auth', () => {
  describe('Accessors', () => {
    test('should set a token', () => {
      global.document = {}
      Auth.setToken('foo')
      expect(global.document.cookie).toEqual('jwt=foo')
    })

    test('should clear a token', () => {
      global.document = { cookie: 'jwt=foo' }
      Auth.clearToken()
      expect(global.document.cookie).toEqual('')
    })
  })

  describe('Headers', () => {
    beforeAll(() => {
      global.document = {}
      Auth.setToken('atoken')
    })

    afterAll(() => {
      Auth.clearToken()
      global.document = undefined
    })

    test('should return the auth headers when the cookie is set', () => {
      const headers = Auth.appendHeaders()
      expect(headers).not.toBeUndefined()
      expect(headers.Authorization).toEqual('bearer atoken')
    })

    test('should add the auth headers to existing headers', () => {
      const headers = Auth.appendHeaders({ foo: 'bar' })
      expect(headers).not.toBeUndefined()
      expect(headers.foo).toEqual('bar')
      expect(headers.Authorization).toEqual('bearer atoken')
    })

    test('should not add the token to the header if it is not set', () => {
      Auth.clearToken()
      const headers = Auth.appendHeaders({ foo: 'bar' })

      expect(headers).not.toBeUndefined()
      expect(headers.foo).toEqual('bar')
      expect(headers.Authorization).toBeUndefined()
    })
  })
})
