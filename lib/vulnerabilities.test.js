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
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(200, {data: expectedVulnerability})

            return Vulnerabilities.getVulnerability('somevulnid')
                .then(response => {
                    expect(response).to.not.be.a('error')
                    expect(response.id).to.equal(expectedVulnerability.id)
                    expect(response.name).to.equal(expectedVulnerability.name)
                })
        })

        it('should return an error on a not found', () => {
            nock('https://api.ionchannel.io')
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(404)

            return Vulnerabilities.getVulnerability('somevulnid')
                .then(response => {
                    expect(response).to.be.a('error')
                    expect(response.message).to.contain('Request failed')
                })
        })

        it('should return an error on a bad response', () => {
            nock('https://api.ionchannel.io')
                .get('/v1/vulnerabilities/getVulnerability?id=somevulnid')
                .reply(500)

            return Vulnerabilities.getVulnerability('somevulnid')
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
