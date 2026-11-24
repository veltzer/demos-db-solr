# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `exercises/09_create_config_set_and_core/do_all.sh:9` - the `if !` inverts the test, so it prints "deleted myConfigSetCopy" when the delete failed and vice versa. Drop the `!` so it matches the block on line 3.
- `exercises/09_create_config_set_and_core/do_all.sh:3` - `curl -s` exits 0 on HTTP 4xx/5xx, so the "did not delete" branches (lines 7 and 13) can never trigger for a missing configset. Use `curl -sf` (or check the HTTP status) in both tests.
- `exercises/09_create_config_set_and_core/do_all.sh:37` - `create_collection -c bar -d myconfigset` points `-d` at a configset directory named `myconfigset` that does not exist; the configset uploaded on line 20 is named `myConfigSet`. Use `-n myConfigSet` as `exercise.txt` (line 70) teaches.
- `exercises/00_install_solr/package_start.sh:10` - downloads Solr 8.10.1 from `dlcdn.apache.org/lucene/solr/...`; the CDN only carries current releases and Solr 9+ lives under `/solr/solr/`, so this URL no longer resolves. Use `archive.apache.org/dist/lucene/solr/8.10.1/` or move to a current Solr 9 release (and update `package_stop.sh:4`, which hardcodes the version a second time - share one `ver` variable).

## Medium

- `exercises/09_create_config_set_and_core/do_all.sh:18` - regenerates `myconfigset.zip` in place, overwriting the committed pre-built zip that `exercise.txt` tells Windows users to rely on. Write to a temp file (or another name) instead.
- `scripts/solr_view.sh:2` - `gnome-open` is long deprecated and absent on modern distros; use `xdg-open` like `exercises/00_install_solr/browser_start.sh`.
- `scripts/solr_stop_techproducts.sh:2` - comment says it reverses `solr_start.sh`; it reverses `solr_start_techproducts.sh`.
- `README.md:2` - README is one line; it does not explain the `exercises/` sequence, the expected `~/install/solr` location that most scripts hardcode (e.g. `scripts/solr_start.sh:16`), or the docker vs. package install options.

## Low

- `scripts/create_all/create_all.sh:4` - stale commented path references the old repo name `demos-solr`; line 6 has the typo "corrent".
- `exercises/00_install_solr/docker_solr_stop.sh:13` - typo "stoping".
- `exercises/00_install_solr/browser_start.sh:1` - shebang `#!/usr/bin/bash -e` differs from the `#!/bin/bash` used everywhere else in the repo.
