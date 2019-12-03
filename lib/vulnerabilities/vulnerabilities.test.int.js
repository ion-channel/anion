/* eslint-env mocha */

import { expect } from 'chai'
import { Vulnerabilities } from './vulnerabilities'

describe('Vulnerabilities', () => {
  describe('GetVulnerability', () => {
    it('should get a vulnerability', () => {
      return Vulnerabilities.getVulnerability('CVE-2012-1531')
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.id).to.equal(expectedVulnerability.id)
          expect(response.title).to.equal(expectedVulnerability.title)
        })
    })

    it('should return an error on a not found', () => {
      return Vulnerabilities.getVulnerability('somevulnid')
        .catch(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed with status code 404')
        })
    })
  })

  describe('GetVulnerabilities', () => {
    it('should get vulnerabilities', () => {
      return Vulnerabilities.getVulnerabilities('extend', undefined)
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(expectedVulnerabilities.length)
          expect(response[0].id).to.equal(expectedVulnerabilities[0].id)
          expect(response[0].name).to.equal(expectedVulnerabilities[0].name)
        })
    })

    it('should get vulnerabilities with the version', () => {
      return Vulnerabilities.getVulnerabilities('extend', '3.0.0')
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(expectedVulnerabilitiesVersion.length)
          expect(response[0].id).to.equal(expectedVulnerabilitiesVersion[0].id)
          expect(response[0].name).to.equal(expectedVulnerabilitiesVersion[0].name)
        })
    })

    it('should return an empty set on a not found', () => {
      return Vulnerabilities.getVulnerabilities('asdf', undefined)
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(0)
        })
    })
  })
})

const expectedVulnerability = {
  id: 2,
  external_id: 'CVE-2012-1531',
  title: 'CVE-2012-1531',
}

const expectedVulnerabilities = [
  {
    id: 9,
    external_id: 'CVE-2012-1531',
    title: 'CVE-2012-1531',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
    score: '10.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
]

const expectedVulnerabilitiesVersion = [
  {
    id: 9,
    external_id: 'CVE-2012-1531',
    title: 'CVE-2012-1531',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
    score: '10.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
]
