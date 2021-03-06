/* eslint-env jest */

import { Searches } from './searches'
import nock from 'nock'

describe('Searches', () => {
  beforeAll(() => {
    global.document = {}
  })

  describe('Search', () => {
    test('should search for results', () => {
      nock('http://localhost:8001')
        .get('/v1/search?q=ruby')
        .reply(200, {
          data: expectedResponse,
          meta: { total_count: expectedResponse.length, limit: 10, offset: 0 },
        })

      return Searches.search('ruby').then(resp => {
        const { results, meta } = resp
        expect(results).toEqual(expectedResponse)
        expect(meta.total_count).toEqual(expectedResponse.length)
      })
    })

    test('should search for results with unique pagination', () => {
      nock('http://localhost:8001')
        .get('/v1/search?q=ruby&offset=0&limit=2')
        .reply(200, {
          data: expectedResponse.slice(0, 2),
          meta: { total_count: 2, limit: 2, offset: 0 },
        })

      return Searches.search('ruby', undefined, 0, 2).then(resp => {
        const { results, meta } = resp
        expect(results).toEqual(expectedResponse.slice(0, 2))
        expect(meta).toEqual({
          total_count: 2,
          limit: 2,
          offset: 0,
        })
      })
    })

    test('should search for results with tbs', () => {
      nock('http://localhost:8001')
        .get('/v1/search?q=ruby&tbs=repos&offset=0&limit=2')
        .reply(200, {
          data: expectedResponse.slice(0, 2),
          meta: { total_count: 2, limit: 2, offset: 0 },
        })

      return Searches.search('ruby', 'repos', 0, 2).then(resp => {
        const { results, meta } = resp
        expect(results).toEqual(expectedResponse.slice(0, 2))
        expect(meta).toEqual({
          total_count: 2,
          limit: 2,
          offset: 0,
        })
      })
    })
  })
})

const expectedResponse = [
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.6.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2018-05-10T16: 29: 53.850716Z',
    updated_at: '2018-05-15T22: 51: 56.501573Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.6.0: preview1',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 1,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.6.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-10-24T22: 39: 42Z',
    updated_at: '2019-10-24T22: 39: 42Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.6.0: preview2',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 5,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.6.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T21: 03: 08.197749Z',
    updated_at: '2019-01-22T00: 24: 51.320806Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.6.0: : : ',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 18,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.6.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T22: 31: 05.233893Z',
    updated_at: '2019-01-22T00: 24: 51.370563Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.6.0',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 3,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.3',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-10-24T22: 39: 42Z',
    updated_at: '2019-10-24T22: 39: 42Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.3',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 9,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.2',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-10-24T22: 39: 42Z',
    updated_at: '2019-10-24T22: 39: 42Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.2',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 25,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.1',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T21: 03: 08.18516Z',
    updated_at: '2019-01-22T00: 24: 51.315329Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.1: : : ',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 12,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.1',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T22: 31: 05.22571Z',
    updated_at: '2019-01-22T00: 24: 51.365093Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.1',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 1,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T22: 31: 05.217596Z',
    updated_at: '2019-01-22T00: 24: 51.359635Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.0',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 1,
  },
  {
    name: 'ruby',
    org: 'ruby-lang',
    version: '2.5.0',
    up: '',
    edition: '',
    aliases: null,
    created_at: '2019-01-21T21: 03: 08.17286Z',
    updated_at: '2019-01-22T00: 24: 51.309861Z',
    title: '',
    references: null,
    part: '',
    language: '',
    external_id: 'cpe: /a: ruby-lang: ruby: 2.5.0: : : ',
    source: null,
    confidence: 0.7599088549613953,
    vulnerability_count: 0,
  },
]
