const chai = require('chai')

const { expect } = chai

const redirect = require('../../lib/redirect')

describe('.redirect', () => {
  context('from', () => {
    context('a link', () => {
      const pages = [ { data: { redirect_from: '/that/' }, url: '/this/' } ]
      const expected = [{ to: '/this/', from: '/that/' }]
      it('redirects', async () => expect(redirect(pages)).to.eql(expected))
    })
    context('a list', () => {
      const pages = [ { data: { redirect_from: ['/thing1/', '/thing2/'] }, url: '/cat/' } ]
      const expected = [{ to: '/cat/', from: '/thing1/' }, { to: '/cat/', from: '/thing2/' }]
      it('redirects', async () => expect(redirect(pages)).to.eql(expected))
    })
  })
  context('to', () => {
    context('an internal link', () => {
      const pages = [ { data: { redirect_to: '/that/', formerly: '/this/' } } ]
      const expected = [{ to: '/that/', from: '/this/' }]
      it('redirects', async () => expect(redirect(pages)).to.eql(expected))
    })
    context('an external site', () => {
      const pages = [ { data: { redirect_to: 'https://that.com', formerly: '/this/' } } ]
      const expected = [{ to: 'https://that.com', from: '/this/' }]
      it('redirects', async () => expect(redirect(pages)).to.eql(expected))
    })
    context('a list', () => {
      const pages = [ { data: { redirect_to: ['/thing1/', '/thing2/'] } } ]
      it('throws an error', async () => expect(() => redirect(pages)).to.throw())
    })
    context('with a permalink', () => {
      const pages = [ { data: { redirect_to: '/that/', permalink: '/this/' } } ]
      it('throws an error', async () => expect(() => redirect(pages)).to.throw(TypeError))
    })
  })
  context('to and from', () => {
    context('a link', () => {
      const pages = [ { data: { redirect_from: '/this', redirect_to: '/that' } } ]
      it('throws an error', async () => expect(() => redirect(pages)).to.throw(TypeError))
    })
    context('a list', () => {
      const pages = [ { data: { redirect_from: ['/this', '/thus'], redirect_to: ['/that', '/them'] } } ]
      it('throws an error', async () => expect(() => redirect(pages)).to.throw(TypeError))
    })
  })
})


