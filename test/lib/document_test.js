const chai = require('chai')

const { expect } = chai

const { Document } = require('../../lib/document')

describe('Document', () => {
  const inputPath = './content/posts/2014-03-12-coming-soon.md'
  const layout = 'post'
  const post = { inputPath, layout }
  const dir = { layouts: 'templates/layouts' }

  describe('shouldScan', () => {
    context('with matching source files', () => {
      const changedFiles = ['content/posts/2014-03-12-coming-soon.md']
      const doc = new Document(post, dir, changedFiles)
      it('returns true', async () => expect(doc.shouldScan()).to.be.true)
    })
    context('without matching source files', () => {
      const doc = new Document(post, dir, [])
      it('returns false', async () => expect(doc.shouldScan()).to.be.false)
    })
    context('with matching layout files', () => {
      const changedFiles = ['templates/layouts/post.html']
      const doc = new Document(post, dir, changedFiles)
      it('returns true', async () => expect(doc.shouldScan()).to.be.true)
    })
    context('without matching layout files', () => {
      const changedFiles = ['./_sass/_components']
      const doc = new Document(post, dir, changedFiles)
      it('returns false', async () => expect(doc.shouldScan()).to.be.false)
    })
    context('with matching source and layout files', () => {
      const changedFiles = [
        'content/posts/2014-03-12-coming-soon.md',
        'templates/layouts/post.html'
      ]
      const doc = new Document(post, dir, changedFiles)
      it('returns true', async () => expect(doc.shouldScan()).to.be.true)
    })
  })
})
