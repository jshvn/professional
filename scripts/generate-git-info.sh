#!/bin/sh
# Generate gitHeadInfo.gin for gitinfo2 package
# This script is based on the post-xxx-sample.txt from gitinfo2
# It can be run manually, from git hooks, or in CI/CD pipelines

# Get the first tag found in the history from the current HEAD
FIRSTTAG=$(git describe --tags --always --dirty='-*' 2>/dev/null)
# Get the first tag in history that looks like a Release
RELTAG=$(git describe --tags --long --always --dirty='-*' --match '[0-9]*.*' 2>/dev/null)

# Generate the gitHeadInfo.gin file
git --no-pager log -1 --date=short --decorate=short \
    --pretty=format:"\usepackage[%
        shash={%h},
        lhash={%H},
        authname={%an},
        authemail={%ae},
        authsdate={%ad},
        authidate={%ai},
        authudate={%at},
        commname={%cn},
        commemail={%ce},
        commsdate={%cd},
        commidate={%ci},
        commudate={%ct},
        refnames={%d},
        firsttagdescribe={$FIRSTTAG},
        reltag={$RELTAG}
    ]{gitexinfo}" HEAD > .git/gitHeadInfo.gin

echo "Generated .git/gitHeadInfo.gin"
