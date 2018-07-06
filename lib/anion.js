import { Teams } from './teams'
import { Vulnerabilities } from './vulnerabilities'

export class Anion {
    constructor(options) {
        this.teams = new Teams(options)
        this.vulnerabilities = new Vulnerabilities(options)
    }
}
