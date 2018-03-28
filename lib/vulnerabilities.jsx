export class Vulnerabilities {
    constructor() {
        this.getVulnerability = this.getVulnerability.bind(this)
    }

    getVulnerability(id, token) {
        return id + token
    }
}
