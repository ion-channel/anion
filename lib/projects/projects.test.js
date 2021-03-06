/* eslint-env jest */

import nock from 'nock'
import { Auth } from '../auth/auth'
import { Projects } from './projects'

describe('Projects', () => {
  const project = {
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
    created_at: 'today',
    updated_at: 'today',
    monitor_frequency: 'every day',
    key_fingerprint: 'fingerprint key',
    private: true,
  }
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('CreateProject', () => {
    test('should create a new project', () => {
      const body = {
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

  describe('getProject', () => {
    test('should return a project', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/project/getProject?id=def&team_id=abc')
        .reply(200, { data: project, meta: { total_count: 1, offset: 0 } })

      return Projects.getProject({ id: 'def', teamId: 'abc' }).then(res => {
        expect(res.project).toEqual(project)
      })
    })
  })

  describe('getPublicProject', () => {
    test('should return a public project', () => {
      const publicProject = {
        ...project,
        private: false,
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/project/getPublicProject?id=abc')
        .reply(200, {
          data: publicProject,
          meta: { total_count: 1, offset: 0 },
        })

      return Projects.getPublicProject({ id: 'abc' }).then(res => {
        expect(res).toEqual({
          project: publicProject,
          meta: { total_count: 1, offset: 0 },
        })
      })
    })
  })

  describe('getProjects', () => {
    test('should return a list of projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/project/getProjects?team_id=abc')
        .reply(200, { data: [project], meta: { total_count: 1, offset: 0 } })

      return Projects.getProjects({ teamId: 'abc' }).then(res => {
        expect(res).toEqual({
          projects: [project],
          meta: { total_count: 1, offset: 0 },
        })
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
        .put('/v1/project/updateProject?chk_access=false', updatedProject)
        .reply(200, { data: updatedProject })

      return Projects.updateProject({ project: updatedProject }).then(res => {
        expect(res).toEqual(updatedProject)
      })
    })
  })

  describe('updateRulesetForProjects', () => {
    test('should update rulesets on a list of projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateRulesetForProjects', {
          ruleset_id: 'abc',
          project_ids: ['def'],
        })
        .reply(200, { data: { ruleset_id: 'abc' } })

      return Projects.updateRulesetForProjects({
        rulesetId: 'abc',
        projectIds: ['def'],
      }).then(res => {
        expect(res.data.data).toEqual({ ruleset_id: 'abc' })
      })
    })
  })

  describe('updateProjects', () => {
    test('should archive projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateProjects?archive=true')
        .reply(200, {
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })

      return Projects.updateProjects({
        projectIds: ['a', 'b'],
        archive: true,
      }).then(res => {
        expect(res.data).toEqual({
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })
      })
    })

    test('should activate projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateProjects?archive=false')
        .reply(200, {
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })

      return Projects.updateProjects({
        projectIds: ['a', 'b'],
        archive: false,
      }).then(res => {
        expect(res.data).toEqual({
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })
      })
    })

    test('should start monitoring projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateProjects?monitor=true')
        .reply(200, {
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })

      return Projects.updateProjects({
        projectIds: ['a', 'b'],
        monitor: true,
      }).then(res => {
        expect(res.data).toEqual({
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })
      })
    })

    test('should stop monitoring projects', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .put('/v1/project/updateProjects?monitor=false')
        .reply(200, {
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })

      return Projects.updateProjects({
        projectIds: ['a', 'b'],
        monitor: false,
      }).then(res => {
        expect(res.data).toEqual({
          data: {
            succeeded: ['a', 'b'],
            failed: [],
          },
        })
      })
    })
  })

  test('should activate and start monitoring projects', () => {
    nock('http://localhost:8001')
      .matchHeader('Authorization', 'bearer soopersecret')
      .put('/v1/project/updateProjects?monitor=true&archive=false')
      .reply(200, {
        data: {
          succeeded: ['a', 'b'],
          failed: [],
        },
      })

    return Projects.updateProjects({
      projectIds: ['a', 'b'],
      monitor: true,
      archive: false,
    }).then(res => {
      expect(res.data).toEqual({
        data: {
          succeeded: ['a', 'b'],
          failed: [],
        },
      })
    })
  })
})
