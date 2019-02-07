source bin/argparse.sh
parse_args "$@"

(export AUTH_TOKEN=${token}; \
 export ASSET_ID=$(wget -O - https://api.github.com/repos/sixclear/${project}/releases/tags/${tag}?access_token=$AUTH_TOKEN | python -c 'import sys, json; print json.load(sys.stdin)["assets"][0]["id"]'); \
 wget --header='Accept:application/octet-stream' -O fabriq-platform-server-release.tar.gz https://api.github.com/repos/sixclear/${project}/releases/assets/$ASSET_ID?access_token=$AUTH_TOKEN)

HASH=$(cksum fabriq-platform-server-release.tar.gz | awk '{print $1}');
DATE=`date +%Y-%m-%d-%T`;

mkdir -p updates/fabriq-platform-server-release-${tag}-${DATE}-${HASH}

tar -C updates/fabriq-platform-server-release-${tag}-${DATE}-${HASH} --strip-components 1 -zxvf fabriq-platform-server-release.tar.gz
