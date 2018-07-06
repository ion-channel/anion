import { API } from './api'
import { URLSearchParams } from 'url'
import t from 'tcomb'

export class Teams {
    constructor(options) {
        this.api = new API({ baseURL: options.baseURL, token: options.token })
    }

    getTeam(id) {
        let params = new URLSearchParams({
            someid: id,
        })

        return this.api.get(getTeamEndpoint, params, undefined)
            .then(response => {
                Team(response.data.data)
                return response.data.data
            })
            .catch(error => {
                return error
            })
    }
}

const getTeamEndpoint = '/v1/teams/getTeam'

const Team = t.struct({
    id: t.String,
    name: t.String,
    sys_admin: t.Bool,
    poc_name: t.String,
    poc_email: t.String,
    created_at: t.String,
    updated_at: t.String,
    deleted_at: t.maybe(t.String),
})
