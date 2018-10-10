import t from 'tcomb'
import { Get } from './requests'
import { URLSearchParams } from 'url'

export class Vulnerabilities {
    static getVulnerability(id) {
        let params = new URLSearchParams({
            id: id,
        })

        return Get(getVulnerabilityEndpoint, params, undefined)
            .then(response => {
                Vulnerability(response.data.data)
                return response.data.data
            })
            .catch(error => {
                return error
            })
    }
}

const getVulnerabilityEndpoint = '/v1/vulnerabilities/getVulnerability'

const Vulnerability = t.struct({
    id: t.String,
    name: t.String,
})
