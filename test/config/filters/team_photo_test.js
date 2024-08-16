const chai = require('chai')

const { expect } = chai

const teamPhoto = require('../../../config/filters/teamPhoto')

describe('teamPhoto filter', () => {
  context('with a listed team member', () => {
    context('who has a photo', () => {
      const teamMember = 'melody'
      it('uses the photo', async () => {
        expect(await teamPhoto(teamMember)).to.match(/melody/)
        expect(await teamPhoto(teamMember)).to.match(/jpeg/)
      })
    })
    context('who does not have a photo', () => {
      const teamMember = 'mollieruskin'
      it('uses the placeholder', async () => {
        expect(await teamPhoto(teamMember)).to.match(/placeholder/i)
        expect(await teamPhoto(teamMember)).to.match(/18F-Logo/i)
      })
    })
  })
  context('with someone unlisted', () => {
    context('who has a photo', () => {
      const teamMember = 'sally-ride'
      it('uses the photo', async () => {
        expect(await teamPhoto(teamMember)).to.match(/sally-ride/i)
        expect(await teamPhoto(teamMember)).to.match(/jpeg/i)
      })
    })
    context('who does not have a photo', () => {
      const teamMember = 'this-person-does-not-exist'
      it('uses the placeholder', async () => {
        expect(await teamPhoto(teamMember)).to.match(/placeholder/i)
        expect(await teamPhoto(teamMember)).to.match(/18F-Logo/i)
      })
    })
  })
})

