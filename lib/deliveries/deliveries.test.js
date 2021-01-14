/* eslint-env jest */
import nock from 'nock'
import { Auth } from '../auth/auth'
import { Deliveries } from './deliveries'

describe('Deliveries', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('getDestinations', () => {
    test('should get a list of destinations for a team', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getDeliveryDestinations?id=someteamid')
        .reply(200, { data: expectedDestinationsResponse })

      return Deliveries.getDestinations({ teamId: 'someteamid' }).then(
        response => {
          expect(response).toEqual(expectedDestinationsResponse)
        },
      )
    })
  })

  describe('createDestination', () => {
    test('should create a new destination', () => {
      const destination = {
        access_key: 'tTw7Y9Ncv9JiTVwA94jIimK/HrAi2lWFb6tE5U1FtU8=',
        id: '0732ecf2-79e5-4814-8fe5-1f4fc56f6e50',
        location: 'bucket/folder',
        name: 'abc',
        region: 'us-east-1',
        secret_key: '5Iistkp+T+lgxk5BHvC20PP4JCY+qsFy7D1IZfua+dU=',
        team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
        type: 's3',
      }
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .post('/v1/teams/createDeliveryDestination')
        .reply(200, { data: destination })

      return Deliveries.createDestination({
        access_key: 'asdf',
        location: 'bucket/folder',
        name: 'abc',
        region: 'us-east-1',
        secret_key: 'fdsa',
        team_id: '646fa3e5-e274-4884-aef2-1d47f029c289',
        type: 's3',
      }).then(res => {
        expect(res.data.data).toEqual(destination)
      })
    })
  })

  describe('deleteDestination', () => {
    test('should return an empty string', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .delete('/v1/teams/deleteDeliveryDestination?id=abc')
        .reply(200, { data: '' })

      return Deliveries.deleteDestination('abc').then(res => {
        expect(res.data.data).toBe('')
      })
    })
  })
})

const expectedDestinationsResponse = [
  {
    id: '47c87537-7f83-406e-8592-5a048e6425dc',
    team_id: 'someteamid',
    location: 'bucket-a',
    region: 'us-east-1',
    name: 'prod bucket',
    type: 's3',
  },
  {
    id: 'e64219de-bdea-4606-a8bb-b29dfb28ba0d',
    team_id: 'someteamid',
    location: 'bucket-b',
    region: 'us-east-1',
    name: 'testing bucket',
    type: 's3',
  },
  {
    id: '31e26d47-043e-455d-a3c8-343a500caf31',
    team_id: 'someteamid',
    location: 'bucket-c',
    region: 'us-east-1',
    name: 'messed up',
    type: 's3',
    deleted_at: '1574481579',
  },
]
