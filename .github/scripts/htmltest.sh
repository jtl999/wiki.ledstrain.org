#!/bin/bash

testDir="${RUNNER_TMPDIR}"/hugo-htmltest
configFile="${RUNNER_TMPDIR}"/.htmltest.yml

hugo -d "${testDir}"

wget 'https://raw.githubusercontent.com/ledstrain/wiki.ledstrain.org/master/.github/config/htmltest.yml' -O "${configFile}"
curl https://htmltest.wjdp.uk | bash
chmod +x './bin/htmltest'
./bin/htmltest --conf "${configFile}" --skip-external "${testDir}"
