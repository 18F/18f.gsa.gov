document.addEventListener('DOMContentLoaded', () => {
  Array.from(document.querySelectorAll('a[href]'))
    // Filter out localhost and links to targets in the same page
    .filter(({ href }) => !['localhost', ''].includes(new URL(href).hostname))
    // Filter out .gov and .mil links
    .filter(({ href }) => !/\.(gov|mil)$/i.test(new URL(href).hostname))
    // Filter out social and logo links
    .filter(
      (anchor) =>
        !['usa-social-link', 'usa-identifier__logo'].some((c) =>
          anchor.className.includes(c)
        )
    )
    // For all the remaining anchors, add the external link class
    .forEach((anchor) => {
      anchor.className = [anchor.className, 'usa-link--external'].join(' ')
    })
})
