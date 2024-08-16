const chai = require('chai')

const { expect } = chai

const { isExternalLink } = require('../../lib/links')

describe('.isExternalLink', () => {
  context('with a local path', () => {
    const hrefs = ['/', '/path/to/something']
    hrefs.forEach(href => {
      it('returns false', async () => expect(isExternalLink(href)).to.be.false)
    })
  })

  context('with a mailto', () => {
    context('to a dot gov address', () => {
      const href = 'mailto:gsa-vulnerability-reports@gsa.gov'
      it('returns false', async () => expect(isExternalLink(href)).to.be.false)
    })
    context('to an external address', () => {
      const href = 'mailto:help@homestarrunner.com'
      it('returns true', async () => expect(isExternalLink(href)).to.be.true)
    })
  })

  context('with another site', () => {
    context('to a dot gov address', () => {
      const href = 'https://nara.gov'
      it('returns false', async () => expect(isExternalLink(href)).to.be.false)
    })
    context('to an external address', () => {
      const href = 'http://homestarrunner.com'
      it('returns true', async () => expect(isExternalLink(href)).to.be.true)
    })
    context('to an address without http', () => {
      const href = 'homestarrunner.com'
      it('throws an error', async () => expect(() => isExternalLink(href)).to.throw())
    })
  })
})
