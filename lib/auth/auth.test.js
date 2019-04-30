/* eslint-env mocha */

import { expect } from 'chai'
import { Auth } from './auth'

describe('Auth', () => {
  describe('Accessors', () => {
    it('should set a token', () => {
      global.document = {}
      Auth.setToken('foo')
      expect(global.document.cookie).to.equal('jwt=foo; path=/')
    })

    it('should clear a token', () => {
      global.document = { cookie: 'jwt=foo; path=/' }
      Auth.clearToken()
      expect(global.document.cookie).to.have.string('jwt=;')
    })
  })

  describe('Headers', () => {
    before(() => {
      global.document = {}
      Auth.setToken('atoken')
    })

    after(() => {
      Auth.clearToken()
      global.document = undefined
    })

    it('should return the auth headers when the cookie is set', () => {
      const headers = Auth.appendHeaders()
      expect(headers).to.not.be.an('undefined')
      expect(headers['Authorization']).to.equal('bearer atoken')
    })

    it('should add the auth headers to existing headers', () => {
      const headers = {
        foo: 'bar',
      }
      headers = Auth.appendHeaders(headers)
      expect(headers).to.not.be.an('undefined')
      expect(headers['foo']).to.equal('bar')
      expect(headers['Authorization']).to.equal('bearer atoken')
    })

    it('should not add the token to the header if it is not set', () => {
      const headers = {
        foo: 'bar',
      }

      Auth.clearToken()
      headers = Auth.appendHeaders(headers)

      expect(headers).to.not.be.an('undefined')
      expect(headers['foo']).to.equal('bar')
      expect(headers['Authorization']).to.be.an('undefined')
    })
  })
})
