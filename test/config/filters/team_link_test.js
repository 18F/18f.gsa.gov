const chai = require('chai')

const { expect } = chai

const teamLink = require('../../../config/filters/teamLink')

describe('teamLink filter', () => {
  it('returns the team member name without linking to missing author pages', async () => {
    expect(await teamLink('melody')).to.equal('<span itemprop="name">Melody</span>')
  })
})
