module.exports = (data) => {
  const all = data.reduce((redirects, page) => {
    if (page.data.redirect_from && page.data.redirect_to) {
      throw new TypeError('A page cannot have both redirect_from and redirect_to specified. Please delete one of these keys.')
    }

    if (page.data.redirect_to && page.data.permalink) {
      const msg = `
        A page cannot have both a redirect_to and a permalink in the frontmatter.

        The reasons for this are complex and we don't have the time.
        More info in lib/redirect.js.

        If you want this page to redirect, please change

            permalink: ${page.data.permalink}

        to:

            formerly: ${page.data.permalink}

      `
      throw new TypeError(msg)
    }

    if (Array.isArray(page.data.redirect_to)) {
      const msg = `
        A page cannot redirect to a list of pages.

        If your redirect_to in ${page.inputPath} looks like

            redirect_to:
              - ${page.data.redirect_to[0]}

        please change it to

            redirect_to: ${page.data.redirect_to[0]}

      `
      throw new TypeError(msg)
    }

    if (page.data.redirect_from) {
      [ page.data.redirect_from ].flat().forEach(url => {
        redirects.push({ to: page.url, from: url });
      })
    } else if (page.data.redirect_to) {
      redirects.push({ to: page.data.redirect_to, from: page.data.formerly });
    }
    return (redirects);
  }, []);

  return all.filter(({ to, from })=> to !== from);
}
