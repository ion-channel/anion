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
    test('should get an analysis navigation', () => {
      const opts = {
        analysisId: '7074b7f2-8f3c-4494-9e1a-af858e536c57',
        teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
        projectId: '8ca10aea-7448-4fba-920e-e0abab735071',
      }
      return Reports.getAnalysisNavigation(opts)
        .then(navResp => {
          expect(navResp).to.not.be.an('error')
          expect(navResp).to.not.be.an('undefined')

          const nav = navResp.navigation
          expect(nav.analysis).to.not.be.an('undefined')
          expect(nav.latest_analysis).to.not.be.an('undefined')
        })
    })

    test('should return an error on a not found', () => {
      return Reports.getAnalysisNavigation({ analysisId: 'foo' })
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })
})
