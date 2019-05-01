/* eslint-env mocha */

import { expect } from 'chai'
import { Sessions } from './sessions'

describe('Vulnerabilities', () => {
  before(() => {
    global.API_ENDPOINT = 'http://localhost:4567'
  })

  describe('Login', () => {
    it('should return a session with valid credentials', () => {
      return Sessions.login('ion', 'channel')
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.jwt).to.not.equal('')
          expect(response.user).to.not.equal('')
        })
    })

    it('should return an error with bad credentials', () => {
      return Sessions.login('bad', 'wolf')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.response.status).to.equal(401)
        })
    })
  })
})
