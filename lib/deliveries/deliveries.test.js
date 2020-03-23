/* eslint-env jest */
import nock from 'nock'
import { Auth } from '../auth/auth'
import { Deliveries } from './deliveries'

describe('Deliveries', () => {
  beforeAll(() => {
    global.document = {}
    Auth.setToken('soopersecret')
  })

  describe('Get Destinations', () => {
    test('should get a list of destinations for a team', () => {
      nock('http://localhost:8001')
        .matchHeader('Authorization', 'bearer soopersecret')
        .get('/v1/teams/getDeliveryDestinations?id=someteamid')
        .reply(200, { data: expectedDestinationsResponse })

      return Deliveries.getDestinations({ teamId: 'someteamid' }).then(
        (response) => {
          expect(response).toEqual(expectedDestinationsResponse)
        },
      )
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
