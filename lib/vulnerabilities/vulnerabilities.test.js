/* eslint-env jest */

import { Vulnerabilities } from './vulnerabilities'
import nock from 'nock'

describe('Vulnerabilities', () => {
  describe('GetVulnerability', () => {
    test('should get a vulnerability', () => {
      nock('http://localhost:8001')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(200, { data: expectedVulnerability })

      return Vulnerabilities.getVulnerability('somevulnid').then(response => {
        expect(response).toEqual(expectedVulnerability)
      })
    })

    test('should return an error on a not found', () => {
      nock('http://localhost:8001')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(404)

      return Vulnerabilities.getVulnerability('somevulnid').catch(response => {
        expect(response.message).toEqual('Request failed with status code 404')
      })
    })

    test('should return an error on a bad response', () => {
      nock('http://localhost:8001')
        .get('/v1/vulnerability/getVulnerability?external_id=somevulnid')
        .reply(500)

      return Vulnerabilities.getVulnerability('somevulnid').catch(response => {
        expect(response.message).toEqual('Request failed with status code 500')
      })
    })
  })

  describe('GetVulnerabilities', () => {
    test('should get vulnerabilities', () => {
      nock('http://localhost:8001')
        .get(
          '/v1/vulnerability/getVulnerabilities?product=jdk&offset=0&limit=10',
        )
        .reply(200, { data: expectedVulnerabilities })

      return Vulnerabilities.getVulnerabilities('jdk', undefined).then(
        response => {
          expect(response).toEqual(expectedVulnerabilities)
        },
      )
    })

    test('should get vulnerabilities with the version', () => {
      nock('http://localhost:8001')
        .get(
          '/v1/vulnerability/getVulnerabilities?product=jdk&version=1.0.0&offset=0&limit=10',
        )
        .reply(200, { data: expectedVulnerabilitiesVersion })

      return Vulnerabilities.getVulnerabilities('jdk', '1.0.0').then(
        response => {
          expect(response).toEqual(expectedVulnerabilitiesVersion)
        },
      )
    })

    test('should return an empty set on a not found', () => {
      nock('http://localhost:8001')
        .get(
          '/v1/vulnerability/getVulnerabilities?product=asdf&offset=0&limit=10',
        )
        .reply(200, { data: [] })

      return Vulnerabilities.getVulnerabilities('asdf', undefined).then(
        response => {
          expect(response).toEqual([])
        },
      )
    })

    test('should get vulnerabilities with default pagination params', () => {
      nock('http://localhost:8001')
        .get(
          '/v1/vulnerability/getVulnerabilities?product=jdk&offset=0&limit=10',
        )
        .reply(200, { data: expectedVulnerabilities })

      return Vulnerabilities.getVulnerabilities('jdk', undefined, {
        offset: 0,
        limit: 10,
      }).then(response => {
        expect(response).toEqual(expectedVulnerabilities)
      })
    })

    test('should get vulnerabilities with unique pagination params', () => {
      nock('http://localhost:8001')
        .get(
          '/v1/vulnerability/getVulnerabilities?product=jdk&offset=0&limit=1',
        )
        .reply(200, { data: [expectedVulnerabilities[0]] })

      return Vulnerabilities.getVulnerabilities('jdk', undefined, {
        offset: 0,
        limit: 1,
      }).then(response => {
        expect(response).toEqual([expectedVulnerabilities[0]])
      })
    })
  })
})

describe('Products', () => {
  describe('Get Product', () => {
    test('should get a product', () => {
      nock('http://localhost:8001')
        .get('/v1/vulnerability/getProducts?external_id=ruby')
        .reply(200, { data: expectedProduct })

      return Vulnerabilities.getProduct({ externalId: 'ruby' }).then(
        response => {
          expect(response).toEqual(expectedProduct[0])
        },
      )
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

const expectedProduct = [
  {
    id: 1224356151,
    name: 'rails',
    org: 'rubyonrails',
    version: '3.0.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-05-08T01:24:46.382Z',
    updated_at: '2020-02-13T00:23:06.883Z',
    title: 'Rubyonrails Rails 3.0.0',
    references: [],
    part: '/a',
    language: '',
    external_id: 'cpe:/a:rubyonrails:rails:3.0.0',
    cpe23: null,
    target_hw: null,
    target_sw: null,
    sw_edition: null,
    other: null,
    text_search_vector: "'300':2B 'rails':1A 'rubyonrails':3C",
    source: [
      {
        id: 1,
        name: 'NVD',
        description: 'National Vulnerability Database',
        created_at: '2017-02-09T20:18:35.385Z',
        updated_at: '2017-02-13T20:12:05.342Z',
        attribution:
          'Copyright © 1999–2017, The MITRE Corporation. CVE and the CVE logo are registered trademarks and CVE-Compatible is a trademark of The MITRE Corporation.',
        license:
          'Submissions: For all materials you submit to the Common Vulnerabilities and Exposures (CVE®), you hereby grant to The MITRE Corporation (MITRE) and all CVE Numbering Authorities (CNAs) a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute such materials and derivative works. Unless required by applicable law or agreed to in writing, you provide such materials on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE.\n\nCVE Usage: MITRE hereby grants you a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare derivative works of, publicly display, publicly perform, sublicense, and distribute Common Vulnerabilities and Exposures (CVE®). Any copy you make for such purposes is authorized provided that you reproduce MITRE\'s copyright designation and this license in any such copy.\n',
        copyright_url: 'http://cve.mitre.org/about/termsofuse.html',
      },
    ],
  },
]
