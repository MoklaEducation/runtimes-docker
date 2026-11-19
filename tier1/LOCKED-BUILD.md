# Offline Tier 1 candidate

`install-locked.sh` installs Tier 1 from the hash-verified input bundle supplied
by `lab`. It runs without a network against the lab-pinned Debian parent.
`/inputs` contains the retained Debian packages and PyPy archive and is mounted
read-only. Keep dependency updates in sync with the lab input lock and bundle.

The upstream `Dockerfile` is kept for reference. Change `install-locked.sh`
for changes to the offline Tier 1 candidate.
