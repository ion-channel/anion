/* eslint-env mocha */

import nock from 'nock'
import { Auth } from './auth/auth'
import { Get, Post, Put, Delete } from './requests'
import { expect } from 'chai'

describe('Reuqests', () => {
  before(() => {
    global.API_ENDPOINT = 'https://api.ionchannel.io'
    global.document = {}
    Auth.setToken('footoken')
  })

  it('should perform a get request', () => {
    nock('https://api.ionchannel.io')
      .matchHeader('Authorization', 'bearer footoken')
      .get('/v1/baz')
      .query({ limit: 100 })
      .reply(200, { id: 'foo' })

    return Get('/v1/baz', { limit: 100 }, Auth.appendHeaders())
      .then(response => {
        expect(response.status).to.equal(200)
        expect(response.data.id).to.equal('foo')
      })
  })

  it('should perform a post request', () => {
    const body = { id: 'someid', bar: 'foo' }
    nock('https://api.ionchannel.io')
      .matchHeader('Authorization', 'bearer footoken')
      .post('/v1/buzz', body)
      .query({ limit: 100 })
      .reply(201)

    return Post('/v1/buzz', { limit: 100 }, Auth.appendHeaders(), body)
      .then(response => {
        expect(response.status).to.equal(201)
        expect(response.data).to.equal('')
      })
  })

  it('should perform a put request', () => {
    const body = { id: 'someid', bar: 'foo' }
    nock('https://api.ionchannel.io')
      .matchHeader('Authorization', 'bearer footoken')
      .put('/v1/buzz', body)
      .query({ limit: 100 })
      .reply(201)

    return Put('/v1/buzz', { limit: 100 }, Auth.appendHeaders(), body)
      .then(response => {
        expect(response.status).to.equal(201)
        expect(response.data).to.equal('')
      })
  })

  it('should perform a delete request', () => {
    nock('https://api.ionchannel.io')
      .matchHeader('Authorization', 'bearer footoken')
      .delete('/v1/baz/fooid')
      .query({ limit: 100 })
      .reply(204)

    return Delete('/v1/baz/fooid', { limit: 100 }, Auth.appendHeaders())
      .then(response => {
        expect(response.status).to.equal(204)
        expect(response.data).to.equal('')
      })
  })
})
