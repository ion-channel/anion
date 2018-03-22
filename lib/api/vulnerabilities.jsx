import { URLSearchParams } from 'url'
import t from 'tcomb'

export class VulnerabilitiesAPI {
    constructor(api) {
        this.api = api
        this.getVulnerability = this.getVulnerability.bind(this)
    }

    getVulnerability(id) {
        let params = new URLSearchParams({
            id: id,
        })

        return this.api.get(getVulnerabilityEndpoint, params, undefined)
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
