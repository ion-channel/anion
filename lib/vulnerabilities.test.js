import { expect } from 'chai'
import { Client } from './client'
import nock from 'nock'

describe('Vulnerabilities', function() {
    var client

    beforeEach(function() {
        client = new Client({baseURL: 'http://api.ionchannel.io', token: 'soopersecret'})
    })

    describe('GetVulnerability', function() {
        it('should get a vulnerability', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(200, {data: expectedVulnerability})

            return client.vulnerabilities.getVulnerability('somevulnid')
                .then(response => {
                    expect(response).to.not.be.a('error')
                    expect(response.id).to.equal(expectedVulnerability.id)
                    expect(response.name).to.equal(expectedVulnerability.name)
                })
        })

        it('should return an error on a not found', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(404)

            return client.vulnerabilities.getVulnerability('somevulnid')
                .then(response => {
                    expect(response).to.be.a('error')
                    expect(response.message).to.contain('Request failed')
                })
        })

        it('should return an error on a bad response', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(500)

            return client.vulnerabilities.getVulnerability('somevulnid')
                .then(response => {
                    expect(response).to.be.a('error')
                    expect(response.message).to.contain('Request failed')
                })
        })
    })
})

const expectedVulnerability = {
    id: 'somevulnid',
    name: 'CVE-1234-1234',
}
