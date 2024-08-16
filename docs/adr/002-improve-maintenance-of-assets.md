# 2. Use multiple style bundles to improve long-term maintenance of styling assets

## Status

Approved

## Context

It might be time to think through long-term asset management strategy for the guides repo, particularly with CSS.

Our repo has three types of styles:

1. USWDS base styling
1. USWDS overrides/custom styling shared by all guides
1. USWDS overrides/custom styling unique to a single guide

Currently, we have one SASS file that collects all of these types of styles together in a single bundle for the live site. This means every guide gets custom styling from other guides.

This isn’t good for a few reasons, but mainly that it’ll be harder to maintain as styles get added and removed from individual guides. (For example, a change on one guide can affect styling for all other guides). Another reason is that it makes the CSS bundle larger than it needs to be for each guide, which can slow down page loads.

## Decision

We will change our CSS bundling approach to mimic the three types of styles listed above, with one bundled stylesheet for each type, and some server-side logic that provides each guide its own stylesheets.

We will do this before a lot of styling is added for the methods guide, as methods will need its own stylesheet regardless of this decision.

## Consequences

This approach will make the assets bundling process a bit more complex. Instead of bundling into one css file, we will bundle multiple css files. We can mitigate the risks of this with proper documentation.

## Update 1/4/2023

After migrating the final site (methods), we landed in a place where all guides use the same css bundle except for methods. Since methods was the most visually distinct and had the most custom code of all the guides, I determined that its css should not interfere with the rest of the guides. The rest of the guides were visually similar enough to use a shared bundle.

The methods bundle inherits styling that is common to all guides (like for the header, footer, etc), but the shared bundle does not include any methods custom styling. The impact of this is that USWDS is imported into 2 different bundles. This has a negligible effect on page load time in production, but increases hot reloading in a dev environment by ~8 seconds. This is enough to cause some annoyance when developing styles.

If we determine that hot reloading is too slow, here are the solutions I can think of:
  1. Just use one css bundle and ensure that methods styling does not interfere with the other 9 guides.
  2. Refine our hot reloading process by experimenting with other bundling tools. Others have recommended looking into https://vitejs.dev/

I think the overall idea of the original ADR still stands—it doesn't make sense for guides to download styles they will never need, and there should be a clear place in the repo for all three types of styles. The issue is how to do this in a way that doesn't make builds too long.
