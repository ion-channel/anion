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
                VulnerabilityType(response.data.data)
                return response.data.data
            })
            .catch(error => {
                return error
            })
    }

    static getVulnerabilities(product, version) {
        let params = new URLSearchParams({
            product: product,
        })

        if (version !== undefined) {
            params.set('version', version)
        }

        return Get(getVulnerabilitiesEndpoint, params, undefined)
            .then(response => {
                VulnerabilitiesType(response.data.data)
                return response.data.data
            })
            .catch(error => {
                return error
            })
    }
}

const getVulnerabilityEndpoint = '/v1/vulnerability/getVulnerability'
const getVulnerabilitiesEndpoint = '/v1/vulnerability/getVulnerabilities'

const VulnerabilityType = t.struct({
    id: t.Number,
    external_id: t.String,
    title: t.String,
    summary:  t.String,
    score:  t.String,
    score_version:  t.String,
    score_system:  t.String,
})

const VulnerabilitiesType = t.list(VulnerabilityType)
