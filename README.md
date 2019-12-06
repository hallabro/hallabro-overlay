![Ebuild validation](https://github.com/hallabro/hallabro-overlay/workflows/Validate/badge.svg)

hallabro-overlay
================

Portage overlay containing various ebuilds.

Suggested method of installation
================================

1. Install `eselect-repository` if not installed:

```bash
emerge eselect-repository
```

2. Add the repository:

```bash
eselect repository add \
    hallabro-overlay \
    git \
    https://github.com/hallabro/hallabro-overlay.git
```

3. All done!
