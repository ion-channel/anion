import { expect } from 'chai'
import { Vulnerabilities } from './vulnerabilities'

describe('Vulnerabilities', function() {
    it('should get a vulnerability', function() {
        let cli = new Vulnerabilities()
        expect(cli.getVulnerability("someid", "atoken")).to.equal("someidatoken")
    })
})
