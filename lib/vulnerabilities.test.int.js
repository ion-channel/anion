import { expect } from 'chai'
import { Vulnerabilities } from './vulnerabilities'

describe('Vulnerabilities', () => {
    before(() => {
        global.API_BASEURL = 'http://localhost:4567'
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
})

const expectedVulnerability = {
    id: 2,
    external_id: 'CVE-2012-1531',
    title: 'CVE-2012-1531',
}
