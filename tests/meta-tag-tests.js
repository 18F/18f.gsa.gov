/* eslint no-unused-expressions: "off" */
const chai = require('chai');
const yaml = require('js-yaml');
const fs = require('fs');
const path = require('path');
const childProcess = require('child_process');
const jsdom = require('jsdom');
const projectSettings = require('../package.json');

const { JSDOM } = jsdom;
const { expect } = chai;

const REDIRECTS_FILE = path.resolve(__dirname, '..', '_data', 'redirect_bases.yaml');
const redirectsData = fs.readFileSync(REDIRECTS_FILE, 'utf8');
const redirects = yaml.load(redirectsData);
const GUIDE_NAMES = fs
  .readdirSync(path.resolve(__dirname, '..', 'content'), { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((dirEntry) => dirEntry.name);
const REDIRECTED_GUIDE_NAMES = Object.keys(redirects);
const REPLATFORMED_GUIDE_NAMES = GUIDE_NAMES.filter(
  (name) => !REDIRECTED_GUIDE_NAMES.includes(name),
);

const runEleventy = async (envName = '') => {
  childProcess.execSync('npx @11ty/eleventy', {
    cwd: path.resolve(__dirname, '..'),
    timeout: projectSettings.mocha.timeout,
    env: { ...process.env, NODE_ENV: envName },
  });
};

const getGuideIndexPath = (guideName) =>
  path.resolve(__dirname, '..', '_site', guideName, 'index.html');

const getDomForGuide = (guideName) => {
  const guidePath = getGuideIndexPath(guideName);
  const html = fs.readFileSync(guidePath, 'utf8');
  return new JSDOM(html, { url: 'https://localhost/', referrer: 'https://localhost/' });
};

const getDomForIndexPage = () => {
  const indexPath = path.resolve(__dirname, '..', '_site', 'index.html');
  const html = fs.readFileSync(indexPath, 'utf8');
  return new JSDOM(html, { url: 'https://localhost/', referrer: 'https://localhost/' });
};

describe('Redirection and indexing tests', () => {
  describe('In a production environment', () => {
    before(async () => {
      await runEleventy('production');
    });

    describe('The index page', () => {
      let document;
      before(() => {
        const dom = getDomForIndexPage();
        document = dom.window.document;
      });

      it('has a robots meta tag with "noindex, nofollow"', () => {
        const robotsMeta = document.querySelector('meta[name="robots"]');

        expect(robotsMeta).to.exist;
        expect(robotsMeta.getAttribute('content')).to.equal('noindex, nofollow');
      });

      it('has a redirect meta tag to the expected url', () => {
        const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

        expect(redirectMeta).to.exist;

        const expectedContent = '0;URL=\'https://18f.gsa.gov/guides\'';

        expect(redirectMeta.getAttribute('content')).to.equal(expectedContent);
      });
    });

    describe('The replatformed guide named', () => {
      REPLATFORMED_GUIDE_NAMES.forEach((replatformedGuide) => {
        let document;
        beforeEach(() => {
          const dom = getDomForGuide(replatformedGuide);
          document = dom.window.document;
        });

        describe(`${replatformedGuide}`, () => {
          it('does NOT have a robots meta tag', () => {
            const robotsMeta = document.querySelector('meta[name="robots"]');

            expect(robotsMeta).to.not.exist;
          });

          it('does NOT have a redirect tag', () => {
            const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

            expect(redirectMeta).to.not.exist;
          });
        });
      });
    });

    describe('The redirected guide named', () => {
      REDIRECTED_GUIDE_NAMES.forEach((redirectedGuide) => {
        let document;
        beforeEach(() => {
          const dom = getDomForGuide(redirectedGuide);
          document = dom.window.document;
        });

        describe(`${redirectedGuide}`, () => {
          it('has a robots meta tag with noindex', () => {
            const robotMeta = document.querySelector('meta[name="robots"]');

            expect(robotMeta).to.exist;
            expect(robotMeta.getAttribute('content')).to.equal('noindex');
          });

          it('has a meta redirect to the correct site', () => {
            const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

            expect(redirectMeta).to.exist;

            const redirectUrl = redirects[redirectedGuide];
            const expectedContent = `0;URL='${redirectUrl}'`;

            expect(redirectMeta.getAttribute('content')).to.equal(expectedContent);
          });
        });
      });
    });
  });

  describe('In a non-production environment', () => {
    before(async () => {
      await runEleventy('dev');
    });

    describe('The index page', () => {
      let document;
      before(() => {
        const dom = getDomForIndexPage();
        document = dom.window.document;
      });

      it('has a robots meta tag with "noindex, nofollow"', () => {
        const robotsMeta = document.querySelector('meta[name="robots"]');

        expect(robotsMeta).to.exist;
        expect(robotsMeta.getAttribute('content')).to.equal('noindex, nofollow');
      });

      it('does not have a redirect meta tag', () => {
        const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

        expect(redirectMeta).to.not.exist;
      });
    });

    describe('The replatformed guide', () => {
      REPLATFORMED_GUIDE_NAMES.forEach((replatformedGuide) => {
        let document;
        beforeEach(() => {
          const dom = getDomForGuide(replatformedGuide);
          document = dom.window.document;
        });

        describe(`${replatformedGuide}`, () => {
          it('has a robots meta tag with "noindex, nofollow"', () => {
            const robotsMeta = document.querySelector('meta[name="robots"]');

            expect(robotsMeta).to.exist;
            expect(robotsMeta.getAttribute('content')).to.equal('noindex, nofollow');
          });

          it('does not have a redirect meta tag', () => {
            const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

            expect(redirectMeta).to.not.exist;
          });
        });
      });
    });

    describe('The draft guide', () => {
      REDIRECTED_GUIDE_NAMES.forEach((draftGuideName) => {
        let document;
        beforeEach(() => {
          const dom = getDomForGuide(draftGuideName);
          document = dom.window.document;
        });

        describe(`${draftGuideName}`, () => {
          it('has a robots meta tag with "noindex, nofollow"', () => {
            const robotsMeta = document.querySelector('meta[name="robots"]');

            expect(robotsMeta).to.exist;
            expect(robotsMeta.getAttribute('content')).to.equal('noindex, nofollow');
          });

          it('does not have a redirect meta tag', () => {
            const redirectMeta = document.querySelector('meta[http-equiv="refresh"]');

            expect(redirectMeta).to.not.exist;
          });
        });
      });
    });
  });
});
