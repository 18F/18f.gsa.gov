(function() {

  // Parse and return a domain string from a string
  // returns null if string pattern is not a domain
  function matchDomain(href) {
    const hrefDomain = href.match(/^(?:https?:\/\/)?(?:[^@\/\n]+@)?(?:www\.)?([^:\/?\n]+)/g);
    if (!hrefDomain) return null;
    return hrefDomain[0];
  }

  // Selects only .gov and .mil domains with true
  // returns false is not
  function isNonGovDomain(domain) {
    if (!domain) return false;
    const segments = domain.split('.');
    const tld = segments[segments.length - 1];
    return !(
      (tld === 'mil') ||
      (tld === 'gov') ||
      (tld === 'http://localhost') ||
      (tld === '1')
    );
  }

  // Ignore if class has className
  // IE use for social-link-ico
  function anchorHasClass(element, className) {
    return element.className.includes(className);
  }

  // Select anchor tags, filter non gov domains and add style
  function styleExternalLinks() {
    const anchors = document.getElementsByTagName('a');
    const totalAnchors = anchors.length;

    for (let step = 0; step < totalAnchors; step++) {
      const a = anchors[step];
      const isSocialLink = anchorHasClass(a, 'usa-social-link');
      const isLogo = anchorHasClass(a, 'usa-identifier__logo');
      const domain = matchDomain(a.href);
      const shouldGetIcon = isNonGovDomain(domain)
        && !isSocialLink
        && !isLogo;

      if (shouldGetIcon) {
        a.className = a.className + ' ' + 'usa-link--external';
        a.setAttribute('title', 'external link"')
      }
    }
  }

  // Run code
  styleExternalLinks();
})();
