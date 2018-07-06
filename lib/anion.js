import { Teams } from './api/teams'
import { Vulnerabilities } from './api/vulnerabilities'

export class Anion {
    constructor(options) {
        this.teams = new Teams(options)
        this.vulnerabilities = new Vulnerabilities(options)
    }
}
