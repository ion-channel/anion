/* eslint-env jest  */
import { Vulnerabilities } from './vulnerabilities'

describe('Vulnerabilities', () => {
  describe('GetVulnerability', () => {
    it('should get a vulnerability', () => {
      return Vulnerabilities.getVulnerability('CVE-2012-1531').then(
        (response) => {
          expect(response.id).toEqual(expectedVulnerability.id)
          expect(response.title).toEqual(expectedVulnerability.title)
        },
      )
    })

    it('should return an error on a not found', () => {
      return Vulnerabilities.getVulnerability('somevulnid').catch(
        (response) => {
          expect(response.message).toEqual(
            'Request failed with status code 404',
          )
        },
      )
    })
  })

  describe('GetVulnerabilities', () => {
    it('should get vulnerabilities', () => {
      return Vulnerabilities.getVulnerabilities('extend', undefined).then(
        (response) => {
          expect(response.length).toEqual(expectedVulnerabilities.length)
          expect(response[0].id).toEqual(expectedVulnerabilities[0].id)
          expect(response[0].name).toEqual(expectedVulnerabilities[0].name)
        },
      )
    })

    it('should get vulnerabilities with the version', () => {
      return Vulnerabilities.getVulnerabilities('extend', '3.0.0').then(
        (response) => {
          expect(response.length).toEqual(expectedVulnerabilitiesVersion.length)
          expect(response[0].id).toEqual(expectedVulnerabilitiesVersion[0].id)
          expect(response[0].name).toEqual(
            expectedVulnerabilitiesVersion[0].name,
          )
        },
      )
    })

    it('should return an empty set on a not found', () => {
      return Vulnerabilities.getVulnerabilities('asdf', undefined).then(
        (response) => {
          expect(response.length).toEqual(0)
        },
      )
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
    summary:
      'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
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
    summary:
      'Unspecified vulnerability in the Java Runtime Environment (JRE) component in Oracle Java SE 7 Update 7 and earlier, 6 Update 35 and earlier, 5.0 Update 36 and earlier, and 1.4.2_38 and earlier; and JavaFX 2.2 and earlier; allows remote attackers to affect confidentiality, integrity, and availability via unknown vectors related to 2D.\\nPer: http://www.oracle.com/technetwork/topics/security/javacpuoct2012-1515924.html\r\n\r\n"Applies to client and server deployment of Java. This vulnerability can be exploited through untrusted Java Web Start applications and untrusted Java applets. It can also be exploited by supplying data to APIs in the specified Component without using untrusted Java Web Start applications or untrusted Java applets, such as through a web service."',
    score: '10.0',
    score_version: '2.0',
    score_system: 'CVSS',
  },
]
