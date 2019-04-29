/* eslint-env mocha */

import { expect } from 'chai'
import { Vulnerabilities } from './vulnerabilities'
import nock from 'nock'

describe('Vulnerabilities', () => {
  before(() => {
    global.API_BASEURL = 'https://api.ionchannel.io'
  })

  describe('GetVulnerability', () => {
    it('should get a vulnerability', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(200, { data: expectedVulnerability })

      return Vulnerabilities.getVulnerability('somevulnid')
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.id).to.equal(expectedVulnerability.id)
          expect(response.name).to.equal(expectedVulnerability.name)
        })
    })

    it('should return an error on a not found', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(404)

      return Vulnerabilities.getVulnerability('somevulnid')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })

    it('should return an error on a bad response', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(500)

      return Vulnerabilities.getVulnerability('somevulnid')
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed')
        })
    })
  })

  describe('GetVulnerabilities', () => {
    it('should get vulnerabilities', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerabilities?product=jdk')
        .reply(200, { data: expectedVulnerabilities })

      return Vulnerabilities.getVulnerabilities('jdk', undefined)
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(expectedVulnerabilities.length)
          expect(response[0].id).to.equal(expectedVulnerabilities[0].id)
          expect(response[0].name).to.equal(expectedVulnerabilities[0].name)
        })
    })

    it('should get vulnerabilities with the version', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerabilities?product=jdk&version=1.0.0')
        .reply(200, { data: expectedVulnerabilitiesVersion })

      return Vulnerabilities.getVulnerabilities('jdk', '1.0.0')
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(expectedVulnerabilitiesVersion.length)
          expect(response[0].id).to.equal(expectedVulnerabilitiesVersion[0].id)
          expect(response[0].name).to.equal(expectedVulnerabilitiesVersion[0].name)
        })
    })

    it('should return an empty set on a not found', () => {
      nock('https://api.ionchannel.io')
        .get('/v1/vulnerability/getVulnerabilities?product=asdf')
        .reply(200, { data: [] })

      return Vulnerabilities.getVulnerabilities('asdf', undefined)
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(0)
        })
    })
  })
})

const expectedVulnerability = {
  id: 1,
  external_id: 'CVE-1234-1234',
  title: 'CVE-1234-1234',
  summary: 'this is a summary of CVE-1234-1234',
  score: '10.0',
  score_version: 'V3',
  score_system: 'CVSS',
}

const expectedVulnerabilities = [
  {
    id: 1,
    external_id: 'CVE-1234-1234',
    title: 'CVE-1234-1234',
    summary: 'this is a summary of CVE-1234-1234',
    score: '10.0',
    score_version: 'V3',
    score_system: 'CVSS',
  },
  {
    id: 2,
    external_id: 'CVE-4321-4321',
    title: 'CVE-4321-4321',
    summary: 'this is a summary of CVE-4321-4321',
    score: '1.0',
    score_version: 'V3',
    score_system: 'CVSS',
  },
]

const expectedVulnerabilitiesVersion = [
  {
    id: 1,
    external_id: 'CVE-1234-1234',
    title: 'CVE-1234-1234',
    summary: 'this is a summary of CVE-1234-1234',
    score: '10.0',
    score_version: 'V3',
    score_system: 'CVSS',
  },
]