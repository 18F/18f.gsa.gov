module.exports = {
  defaults: {
    concurrency: 1,
    standard: "WCAG2AA",
    runners: ["htmlcs"],
    // ignore iframes because we don't use them and DAP inserts an iframe
    // that causes intermittent pa11y errors
    hideElements: "iframe, div[style*='display: none;'], [data-pa11y-ignore], a[href*='/TODO/"
  }
}
