/* eslint-env jest */
import { Sessions } from './sessions'

describe('Sessions', () => {
  describe('Login', () => {
    test('should return a session with valid credentials', () => {
      return Sessions.login('ion', 'channel').then((response) => {
        expect(response.jwt).not.toEqual('')
        expect(response.user).not.toEqual('')
      })
    })

    test('should return an error with bad credentials', () => {
      return Sessions.login('bad', 'wolf').catch((response) => {
        expect(response.response.status).toEqual(401)
      })
    })
  })
})
