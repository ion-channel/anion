import { expect } from 'chai'
import { Teams } from './teams'
import nock from 'nock'

describe('Teams', function() {
    var api

    beforeEach(function() {
        api = new Teams({baseURL: 'http://api.ionchannel.io', token: 'soopersecret'})
    })

    describe('GetTeam', function() {
        it('should get a team', function() {
            nock('http://api.ionchannel.io')
                .matchHeader('Authorization', 'bearer soopersecret')
                .get('/v1/teams/getTeam?someid=cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .reply(200, {data: expectedTeam})

            return api.getTeam('cd98e4e1-6926-4989-8ef8-f326cd5956fc')
                .then(response => {
                    expect(response).to.not.be.a('error')
                    expect(response.id).to.equal(expectedTeam.id)
                    expect(response.name).to.equal(expectedTeam.name)
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
