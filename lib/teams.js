import { URLSearchParams } from 'url'
import { Auth } from './auth'
import { Get } from './requests'
import t from 'tcomb'

const getTeamEndpoint = '/v1/teams/getTeam'
const getTeamsEndpoint = '/v1/teams/getTeams'

export class Teams {
    static getTeam(id) {
        let params = new URLSearchParams({
            someid: id,
        })

        return Get(getTeamEndpoint, params, Auth.appendHeaders())
            .then(response => {
                Team(response.data.data)
                Meta(response.data.meta)
                return {team: response.data.data, meta: response.data.meta}
            })
            .catch(error => {
                return error
            })
    }

    static getTeams() {
        return Get(getTeamsEndpoint, undefined, Auth.appendHeaders())
            .then(response => {
                UsersTeams(response.data)
                Meta(response.data.meta)
                return {teams: response.data.data, meta: response.data.meta}
            })
            .catch(error => {
                return error
            })
    }
}

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
}, 'Team')

const UsersTeam = t.struct({
    id: t.String,
    name: t.String,
    sys_admin: t.Bool,
    poc_name: t.String,
    poc_email: t.String,
    created_at: t.String,
    updated_at: t.String,
    deleted_at: t.maybe(t.String),
    role: t.String,
}, 'UserTeam')

const UsersTeams = t.struct({
    data: t.list(UsersTeam),
}, 'UsersTeams')
