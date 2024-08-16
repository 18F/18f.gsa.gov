const chai = require('chai')

const { expect } = chai

const byAuthor = require('../../../config/filters/byAuthor')

describe('by(Author) filter', () => {
  const posts = [{ data: { authors: ['melody', 'matt-cloyd'] } }]

  context('with an author who has written posts', () => {
    const author = 'melody'
    it('returns posts', async () => expect(await byAuthor(posts, author)).to.have.lengthOf(1))
  })
  context('with an author who has written posts', () => {
    const author = 'no-face'
    it('returns empty array', async () => expect(await byAuthor(posts, author)).to.be.empty )
  })
})
