import { expect } from 'chai'
import { Teams } from './teams'
import nock from 'nock'

describe('Teams', function() {
    let api

    beforeEach(function() {
        api = new Teams({baseURL: 'http://api.ionchannel.io', token: 'soopersecret'})
    })

    describe('GetTeam', function() {
        it('should get a team', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .reply(200,{
                    data: expectedTeam,
                    meta: {
                        total_count: 1,
                    },
                })

            return api.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .then(teamResp => {
                    expect(teamResp).to.not.be.an('error')
                    expect(teamResp).to.not.be.an('undefined')
                    expect(teamResp.team).to.not.be.an('undefined')
                    expect(teamResp.meta).to.not.be.an('undefined')

                    expect(teamResp.meta.total_count).to.equal(1)

                    let team = teamResp.team
                    expect(team.id).to.equal(expectedTeam.id)
                    expect(team.name).to.equal(expectedTeam.name)
                    expect(team.created_at).to.equal(expectedTeam.created_at)
                    expect(team.updated_at).to.equal(expectedTeam.updated_at)
                    expect(team.sys_admin).to.equal(expectedTeam.sys_admin)
                })
        })

        it('should return an error on a not found', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .reply(404)

            return api.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .then(response => {
                    expect(response).to.be.a('error')
                    expect(response.message).to.contain('Request failed')
                })
        })

        it('should return an error on a bad response', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .reply(500)

            return api.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .then(response => {
                    expect(response).to.be.a('error')
                    expect(response.message).to.contain('Request failed')
                })
        })
    })
})

const expectedTeam = {
    id: "cd98e4e1-6926-4989-8ef8-f326cd5956fc",
    created_at: "2016-09-09T22:06:49.487Z",
    updated_at: "2016-09-09T22:06:49.487Z",
    name: "ion-channel",
    sys_admin: true,
    poc_name: "",
    poc_email: "",
}
