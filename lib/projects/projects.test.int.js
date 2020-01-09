/* eslint-env jest */

import { Auth } from '../auth/auth'
import { Sessions } from '../sessions/sessions'
import { Projects } from './projects'
import { expect } from 'chai'

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
        expect(projectResp).to.not.be.an('error')
        expect(projectResp).to.not.be.an('undefined')
        expect(projectResp.project).to.not.be.an('undefined')
        expect(projectResp.meta).to.not.be.an('undefined')

        expect(projectResp.meta.total_count).to.equal(1)

        const project = projectResp.project
        expect(project.id).to.equal(expectedProject.id)
        expect(project.name).to.equal(expectedProject.name)
        expect(project.type).to.equal(expectedProject.type)
        expect(project.source).to.equal(expectedProject.source)
        expect(project.branch).to.equal(expectedProject.branch)
        expect(project.active).to.equal(expectedProject.active)
        expect(project.private).to.equal(expectedProject.private)
        expect(project.created_at).to.equal(expectedProject.created_at)
        expect(project.updated_at).to.equal(expectedProject.updated_at)
      })
    })

    test('should return an error on a not found', () => {
      return Projects.getProject({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response).to.be.a('error')
        expect(response.message).to.contain('Request failed')
      })
    })

    test('should return an error on a bad response', () => {
      return Projects.getProject({
        id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc',
      }).catch(response => {
        expect(response).to.be.a('error')
        expect(response.message).to.contain('Request failed')
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
          expect(projectsResp).to.not.be.an('error')
          expect(projectsResp).to.not.be.an('undefined')
          expect(projectsResp.projects).to.not.be.an('undefined')
          expect(projectsResp.meta).to.not.be.an('undefined')

          expect(projectsResp.meta.total_count).to.be.at.least(1)

          const projects = projectsResp.projects
          expect(projects.length).to.be.at.least(1)

          expect(projectsResp.meta.total_count).to.equal(projects.length)
        })
      })
    })

    test('should return an error on a bad jwt', () => {
      Auth.clearToken()

      return Projects.getProjects({
        teamId: 'bbd16a1b-05b5-40f8-9bc8-b3e8fcf9116c',
      }).catch(response => {
        expect(response).to.be.a('error')
        expect(response.message).to.contain('Request failed')
        expect(response.response.status).to.equal(400)
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
              expect(err.message).to.equal(
                'Request failed with status code 400',
              )
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
  name: 'cat-project',
  type: 'git',
  source: 'cat-hub',
  branch: 'cat-master',
  active: true,
  private: false,
  created_at: '2018-05-31T16:59:32.969012Z',
  updated_at: '2018-05-31T16:59:32.969012Z',
}
