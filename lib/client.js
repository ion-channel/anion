import { Vulnerabilities } from './api/vulnerabilities'

export class Client {
    constructor(options) {
        this.vulnerabilities = new Vulnerabilities(options)
    }
}
