import { API } from './api/api'
import { VulnerabilitiesAPI } from './api/vulnerabilities'

export class Client {
    constructor(options) {
        let api = new API({ baseURL: options.baseURL, token: options.token })

        this.vulnerabilities = new VulnerabilitiesAPI(api)
    }
}
