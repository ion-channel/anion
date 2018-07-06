import { expect } from 'chai'
import { API } from './api'
import nock from 'nock'

describe('API Client', function() {
    describe('Base URL', function() {
        it('should set a base url on construction', function() {
            let api = new API({baseURL: 'http://someurl.com'})
            expect(api.url).to.equal('http://someurl.com')
        })

        it('should return a base url', function() {
            let api = new API()
            expect(api.baseURL('http://google.com')).to.equal('http://google.com')
        })

        it('should allow updating the base url', function() {
            let api = new API({baseURL: 'http://someurl.com'})
            expect(api.baseURL()).to.equal('http://someurl.com')

            api.baseURL('http://google.com')
            expect(api.baseURL()).to.equal('http://google.com')
        })

        it('should return an empty string if not set', function() {
            let api = new API()
            expect(api.baseURL()).to.equal('')
        })
    })

    describe('Bearer Token', function() {
        it('should set a bearer token on construction', function() {
            let api = new API({token: 'sometoken'})
            expect(api.token).to.equal('sometoken')
        })

        it('should return a bearer token', function() {
            let api = new API()
            expect(api.bearerToken('anothertoken')).to.equal('anothertoken')
        })

        it('should allow updating the bearer token', function() {
            let api = new API({token: 'sometoken'})
            expect(api.bearerToken()).to.equal('sometoken')

            api.bearerToken('anothertoken')
            expect(api.bearerToken()).to.equal('anothertoken')
        })

        it('should return an empty string if not set', function() {
            let api = new API()
            expect(api.bearerToken()).to.equal('')
        })
    })

    describe('Requests', function() {
        let api

        beforeEach(function() {
            api = new API({
                baseURL: 'https://api.ionchannel.io',
                token: 'soopersecret',
            })
        })

        it('should perform a get request', function() {
            nock('https://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/baz')
                .query({ limit: 100 })
                .reply(200, { id: 'foo' })

            return api.get('/v1/baz', { limit: 100 }, undefined)
                .then(response => {
                    expect(response.status).to.equal(200)
                    expect(response.data.id).to.equal('foo')
                })
        })

        it('should perform a post request', function() {
            let body = { id: 'someid', bar: 'foo' }
            nock('https://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .post('/v1/buzz', body)
                .query({ limit: 100 })
                .reply(201)


            return api.post('/v1/buzz', { limit: 100 }, undefined, body)
                .then(response => {
                    expect(response.status).to.equal(201)
                    expect(response.data).to.equal('')
                })
        })

        it('should perform a put request', function() {
            let body = { id: 'someid', bar: 'foo' }
            nock('https://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .put('/v1/buzz', body)
                .query({ limit: 100 })
                .reply(201)


            return api.put('/v1/buzz', { limit: 100 }, undefined, body)
                .then(response => {
                    expect(response.status).to.equal(201)
                    expect(response.data).to.equal('')
                })
        })

        it('should perform a delete request', function() {
            nock('https://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .delete('/v1/baz/fooid')
                .query({ limit: 100 })
                .reply(204)

            return api.delete('/v1/baz/fooid', { limit: 100 }, undefined)
                .then(response => {
                    expect(response.status).to.equal(204)
                    expect(response.data).to.equal('')
                })
        })
    })
})
