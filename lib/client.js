import { VulnerabilitiesAPI } from './api/vulnerabilities'

export class Client {
    constructor(options) {
        this.vulnerabilities = new VulnerabilitiesAPI(options)
    }
}
