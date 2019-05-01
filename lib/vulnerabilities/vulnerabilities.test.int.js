/* eslint-env mocha */

import { expect } from 'chai'
import { Vulnerabilities } from './vulnerabilities'

describe('Vulnerabilities', () => {
  before(() => {
    global.API_ENDPOINT = 'http://localhost:4567'
  })

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
        .then(response => {
          expect(response).to.be.a('error')
          expect(response.message).to.contain('Request failed with status code 404')
        })
    })
  })

  describe('GetVulnerabilities', () => {
    it('should get vulnerabilities', () => {
      return Vulnerabilities.getVulnerabilities('jdk', undefined)
        .then(response => {
          expect(response).to.not.be.a('error')
          expect(response.length).to.equal(expectedVulnerabilities.length)
          expect(response[0].id).to.equal(expectedVulnerabilities[0].id)
          expect(response[0].name).to.equal(expectedVulnerabilities[0].name)
        })
    })

    it('should get vulnerabilities with the version', () => {
      return Vulnerabilities.getVulnerabilities('jdk', '1.6.0')
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
    id: 2,
    external_id: 'CVE-2012-1531',
    title: 'CVE-2012-1531',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
    score: '10.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
  {
    id: 3,
    external_id: 'CVE-2012-3216',
    title: 'CVE-2012-3216',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier allows remote attackers to affect confidentiality via unknown vectors related to Libraries.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"',
    score: '2.6',
    score_version: '2.0',
    score_system: 'CVSS',
  },
  {
    id: 4,
    external_id: 'CVE-2016-3458',
    title: 'CVE-2016-3458',
    summary: 'Unspecified vulnerability in Oracle Java SE 6u115, 7u101, and 8u92; and Java SE Embedded 8u91 allows remote attackers to affect integrity via vectors related to CORBA.',
    score: '4.3',
    score_version: '3.0',
    score_system: 'CVSS',
  },
  {
    id: 8,
    external_id: 'CVE-2013-0424',
    title: 'CVE-2013-0424',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 through Update 11, 6 through Update 38, 5.0 through Update 38, and 1.4.2_40 and earlier, and OpenJDK 7, allows remote attackers to affect integrity via vectors related to RMI. NOTE: the previous information is from the February 2013 CPU. Oracle has not commented on claims from another vendor that this issue is related to cross-site scripting (XSS) in the sun.rmi.transport.proxy CGIHandler class that does not properly handle error messages in a (1) command or (2) port number.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"',
    score: '5.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
]

const expectedVulnerabilitiesVersion = [
  {
    id: 2,
    external_id: 'CVE-2012-1531',
    title: 'CVE-2012-1531',
    summary: 'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
    score: '10.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
  {
    id: 3,
    external_id: 'CVE-2012-3216',
    title: 'CVE-2012-3216',
    summary:
    'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier allows remote attackers to affect confidentiality via unknown vectors related to Libraries.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"',
    score: '2.6',
    score_version: '2.0',
    score_system: 'CVSS',
  },
  {
    id: 4,
    external_id: 'CVE-2016-3458',
    title: 'CVE-2016-3458',
    summary:
    'Unspecified vulnerability in Oracle Java SE 6u115, 7u101, and 8u92; and Java SE Embedded 8u91 allows remote attackers to affect integrity via vectors related to CORBA.',
    score: '4.3',
    score_version: '3.0',
    score_system: 'CVSS',
  },
  {
    id: 8,
    external_id: 'CVE-2013-0424',
    title: 'CVE-2013-0424',
    summary:
    'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 through Update 11, 6 through Update 38, 5.0 through Update 38, and 1.4.2_40 and earlier, and OpenJDK 7, allows remote attackers to affect integrity via vectors related to RMI. NOTE: the previous information is from the February 2013 CPU. Oracle has not commented on claims from another vendor that this issue is related to cross-site scripting (XSS) in the sun.rmi.transport.proxy CGIHandler class that does not properly handle error messages in a (1) command or (2) port number.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpufeb2013-1841061.html\r\n\r\n"Applies to client deployment of Java only. This vulnerability can be exploited only through untrusted Java Web Start applications and untrusted Java applets. (Untrusted Java Web Start applications and untrusted applets run in the Java sandbox with limited privileges.)"',
    score: '5.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
]
