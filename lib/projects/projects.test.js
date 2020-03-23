/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Projects } from './projects'

describe('Projects', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('CreateProject', () => {
    test('should create a new project', () => {
      const body = {
        id: 'sdfsdfsdf',
        team_id: 'abc',
        ruleset_id: 'rule 1',
        name: 'fake name',
        type: 'git',
        source: 'foo.com-git',
        branch: 'master',
        description: '',
        active: true,
        should_monitor: true,
        aliases: [
          {
            name: 'productName',
            version: '0.0.0',
            org: 'foo org',
            id: 'alias id',
            created_at: 'today',
            updated_at: 'today',
          },
        ],
        tags: [],
        poc_name: 'my pocName',
        poc_email: 'pocEmail@foo.com',
        deploy_key: 'sdf',
        username: 'ion',
        password: 'channel',
        chat_channel: 'slack channel',
      }
      const expectedRes = {
        ...body,
        id: 'sdf',
        created_at: 'today',
        updated_at: 'today',
        monitor_frequency: 'every day',
        key_fingerprint: 'fingerprint key',
        private: true,
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/project/createProject')
        .reply(200, {
          data: expectedRes,
        })

      return Projects.createProject(body).then(res => {
        expect(res).toEqual(expectedRes)
      })
    })
  })

  describe('UpdateProject', () => {
    test('should return expectedProject with updated properties', () => {
      const updatedProject = {
        active: true,
        aliases: [],
        branch: 'cat-master',
        chat_channel: 'chat channel',
        created_at: '2018-05-31T16:59:32.969012Z',
        deploy_key: 'deploy key',
        description: 'my description',
        id: '8ca10aea-7451-4fba-920e-e0abab735071',
        key_fingerprint: 'fake fingerprint',
        name: 'cat-project-v2',
        password: '123abc',
        poc_email: 'ironic@gmail.com',
        poc_name: 'poc_name',
        private: false,
        ruleset_id: '4362ca46-1a68-452f-b419-e26c40e0c346',
        should_monitor: true,
        monitor_frequency: 'daily',
        source: 'git@github.com:/ion-channel/ion-ui',
        tags: [],
        team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
        type: 'git',
        updated_at: '2018-05-31T16:59:32.969012Z',
        username: 'ironic',
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateProject', updatedProject)
        .reply(200, { data: updatedProject })

      return Projects.updateProject({ project: updatedProject }).then(res => {
        expect(res).toEqual(updatedProject)
      })
    })
  })
})
