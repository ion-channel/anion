import { API } from './api/api'
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
                Meta(response.data.meta)
                return {team: response.data.data, meta: response.data.meta}
            })
            .catch(error => {
                return error
            })
    }
}

const getTeamEndpoint = '/v1/teams/getTeam'

const Meta = t.struct({
    total_count: t.Integer,
    offset: t.maybe(t.Integer),
    limit: t.maybe(t.Integer),
})

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
