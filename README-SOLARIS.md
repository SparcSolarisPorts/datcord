# Datcord on Oracle Solaris 11.4 / SPARC64

Build with:

```sh
./build-solaris.sh
```

## Current Firefox source for Solaris

Use Oracle Solaris Userland as the source of truth for the Firefox release and
Solaris/SPARC patch set:

https://github.com/oracle/solaris-userland/tree/master/components/desktop/firefox

Patches:

https://github.com/oracle/solaris-userland/tree/master/components/desktop/firefox/patches

Neutron's Solaris source-preparation script reads Oracle's current `ESR`,
`COMPONENT_VERSION`, and `COMPONENT_ARCHIVE_HASH` from that Makefile. It then
downloads the matching Mozilla source, verifies it, applies Oracle's patches,
and only then applies Neutron's patches.

On a Solaris system you can also inspect the Firefox package visible from your
configured IPS publishers with:

```sh
pkg info -r web/browser/firefox
```

The initial port produces a relocatable `.tar.bz2`; a native IPS package and a
Solaris tray backend can be added after runtime validation.
