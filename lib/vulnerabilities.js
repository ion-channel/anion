import t from 'tcomb'
import { Get } from './requests'
import { URLSearchParams } from 'url'

export class Vulnerabilities {
    static getVulnerability(external_id) {
        let params = new URLSearchParams({
            external_id: external_id,
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

const getVulnerabilityEndpoint = '/v1/vulnerability/getVulnerability'

const Vulnerability = t.struct({
    id: t.Number,
    external_id: t.String,
    title: t.String,
    summary:  t.String,
    score:  t.String,
    score_version:  t.String,
    score_system:  t.String,
})
