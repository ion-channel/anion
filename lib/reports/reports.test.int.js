/* eslint-env jest */

import { Auth } from '../auth/auth'
import { Sessions } from '../sessions/sessions'
import { Reports } from './reports'
import { expect } from 'chai'

describe('Reports', () => {
  beforeAll(() => {
    global.document = {}

    return Sessions.login('ion', 'channel')
      .then(session => {
        Auth.setToken(session.jwt)
      })
  })

  describe('GetAnalysisNavigation', () => {
    test('should return an error on a not found', () => {
      return Reports.getAnalysisNavigation({ analysisId: 'foo' })
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })
})
