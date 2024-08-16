const chai = require('chai')
const Token = require('markdown-it/lib/token')

const { expect } = chai


const { externalize } = require('../../lib/links')

describe('.externalize', () => {
  context('link', () => {
    context('internal', () => {
      const token = new Token()
      token.attrPush([ 'href', 'https://18f.gsa.gov/blog' ])
      externalize(token)
      it('returns the token', async () => expect(token.attrGet('class')).to.not.match(/external/))
    })

    context('external', () => {
      const token = new Token()
      token.attrPush([ 'href', 'http://homestarrunner.com' ])
      externalize(token)
      it('marks the link as external', async () => expect(token.attrGet('class')).to.match(/external/))
    })
  })

  context('mailto', () => {
    context('internal', () => {
      const token = new Token()
      token.attrPush([ 'href', 'mailto:gsa-vulnerability-reports@gsa.gov' ])
      externalize(token)
      it('returns the token', async () => expect(token.attrGet('class')).to.not.match(/external/))
    })
    context('external', () => {
      const token = new Token()
      token.attrPush([ 'href', 'mailto:help@homestarrunner.com' ])
      externalize(token)
      it('marks the link as external', async () => expect(token.attrGet('class')).to.match(/external/))
    })
  })

  context('path', () => {
    const token = new Token()
    token.attrPush([ 'href', '/' ])
    externalize(token)
    it('returns the token', async () => expect(token.attrGet('class')).to.not.match(/external/))
  })
})


