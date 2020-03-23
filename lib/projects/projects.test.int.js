/* eslint-env jest */

import { Auth } from '../auth/auth'
import { Sessions } from '../sessions/sessions'
import { Projects } from './projects'

describe('Projects', () => {
  beforeAll(() => {
    global.document = {}
  })

  describe('GetProject', () => {
    beforeAll(() => {
      return Sessions.login('ion', 'channel').then(session => {
        Auth.setToken(session.jwt)
      })
    })

    test('should get a project', () => {
      return Projects.getProject({
        id: '8ca10aea-7451-4fba-920e-e0abab735071',
        teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      }).then(projectResp => {
        expect(projectResp).not.toBeUndefined()
        expect(projectResp.project).not.toBeUndefined()
        expect(projectResp.meta).not.toBeUndefined()

        expect(projectResp.meta.total_count).toEqual(1)

        const project = projectResp.project
        expect(project.id).toEqual(expectedProject.id)
        expect(project.name).toEqual(expectedProject.name)
        expect(project.type).toEqual(expectedProject.type)
        expect(project.source).toEqual(expectedProject.source)
        expect(project.branch).toEqual(expectedProject.branch)
        expect(project.active).toEqual(expectedProject.active)
        expect(project.private).toEqual(expectedProject.private)
        expect(project.created_at).toEqual(expectedProject.created_at)
        expect(project.updated_at).toEqual(expectedProject.updated_at)
      })
    })

    test('should return an error on a not found', () => {
      return Projects.getProject({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toEqual('Request failed with status code 404')
      })
    })

    test('should return an error on a bad response', () => {
      return Projects.getProject({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response.message).toEqual('Request failed with status code 404')
      })
    })
  })

  describe('GetProjects', () => {
    test('should get a users projects', () => {
      return Sessions.login('ion', 'channel').then(session => {
        Auth.setToken(session.jwt)

        return Projects.getProjects({
          teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
        }).then(projectsResp => {
          expect(projectsResp).not.toBeUndefined()
          expect(projectsResp.projects).not.toBeUndefined()
          expect(projectsResp.meta).not.toBeUndefined()

          expect(projectsResp.meta.total_count >= 1).toBeTruthy()

          const projects = projectsResp.projects
          expect(projects.length >= 1).toBeTruthy()

          expect(projectsResp.meta.total_count).toEqual(projects.length)
        })
      })
    })

    test('should return an error on a bad jwt', () => {
      Auth.clearToken()

      return Projects.getProjects({
        teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      }).catch(response => {
        expect(response.message).toEqual('Request failed with status code 400')
        expect(response.response.status).toEqual(400)
      })
    })
  })

  describe('UpdateProject', () => {
    test('should fail with 400', () => {
      return Sessions.login('ion', 'channel').then(session => {
        Auth.setToken(session.jwt)
        return Projects.updateProject({ project: expectedProject }).catch(
          err => {
            if (err) {
              expect(err.message).toEqual('Request failed with status code 400')
            }
          },
        )
      })
    })
  })
})

const expectedProject = {
  id: '8ca10aea-7451-4fba-920e-e0abab735071',
  team_id: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
  ruleset_id: '3b3372ec-8ac9-4a75-9db0-27cdfa9f9c6f',
  name: 'cat-project',
  type: 'git',
  source: 'cat-hub',
  branch: 'cat-master',
  chat_channel: '',
  description: 'foo project',
  should_monitor: false,
  poc_name: 'foobar',
  poc_email: 'foo@bar.com',
  monitor_frequency: 'daily',
  active: true,
  private: false,
  aliases: [],
  tags: [],
  created_at: '2018-05-31T16:59:32.969012Z',
  updated_at: '2018-05-31T16:59:32.969012Z',
}
