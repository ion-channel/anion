/* eslint-env jest */

import nock from 'nock'
import { Auth } from './auth/auth'
import { Get, Post, Put, Delete } from './requests'

describe('Reuqests', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('footoken')
  })

  test('should perform a get request', () => {
    nock('http://localhost:8001')
      .get('/v1/baz')
      .matchHeader('Authorization', 'bearer footoken')
      .query({ limit: 100 })
      .reply(200, { id: 'foo' })

    return Get('/v1/baz', { limit: 100 }, Auth.appendHeaders()).then(
      response => {
        expect(response.status).toEqual(200)
        expect(response.data.id).toEqual('foo')
      },
    )
  })

  test('should perform a post request', () => {
    const body = { id: 'someid', bar: 'foo' }
    nock('http://localhost:8001')
      .post('/v1/buzz', body)
      .matchHeader('Authorization', 'bearer footoken')
      .query({ limit: 100 })
      .reply(201)

    return Post('/v1/buzz', { limit: 100 }, Auth.appendHeaders(), body).then(
      response => {
        expect(response.status).toEqual(201)
        expect(response.data).toEqual('')
      },
    )
  })

  test('should perform a put request', () => {
    const body = { id: 'someid', bar: 'foo' }
    nock('http://localhost:8001')
      .put('/v1/buzz', body)
      .matchHeader('Authorization', 'bearer footoken')
      .query({ limit: 100 })
      .reply(201)

    return Put('/v1/buzz', { limit: 100 }, Auth.appendHeaders(), body).then(
      response => {
        expect(response.status).toEqual(201)
        expect(response.data).toEqual('')
      },
    )
  })

  test('should perform a delete request', () => {
    const body = { id: 'someid', bar: 'foo' }
    nock('http://localhost:8001')
      .delete('/v1/baz/fooid', body)
      .matchHeader('Authorization', 'bearer footoken')
      .query({ limit: 100 })
      .reply(204)

    return Delete(
      '/v1/baz/fooid',
      { limit: 100 },
      Auth.appendHeaders(),
      body,
    ).then(response => {
      expect(response.status).toEqual(204)
      expect(response.data).toEqual('')
    })
  })
})
