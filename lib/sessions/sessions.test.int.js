/* eslint-env jest */

import { expect } from 'chai'
import { Sessions } from './sessions'

describe('Sessions', () => {
  describe('Login', () => {
    test('should return a session with valid credentials', () => {
      return Sessions.login('ion', 'channel').then(response => {
        expect(response).to.not.be.a('error')
        expect(response.jwt).to.not.equal('')
        expect(response.user).to.not.equal('')
      })
    })

    test('should return an error with bad credentials', () => {
      return Sessions.login('bad', 'wolf').catch(response => {
        expect(response).to.be.a('error')
        expect(response.response.status).to.equal(401)
      })
    })
  })
})
