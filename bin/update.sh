source bin/argparse.sh
parse_args "$@"

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ ${machine} = "Mac" ]; then
  COMMAND=bin/mac/fetch
fi

if [ ${machine} = "Linux" ]; then
  COMMAND=bin/linux/fetch
fi

${COMMAND} --github-oauth-token="${token}" --repo="https://github.com/sixclear/${project}" --tag="${tag}" --release-asset="fabriq-platform-server-release.tar.gz" .

HASH=$(cksum fabriq-platform-server-release.tar.gz | awk '{print $1}');
DATE=`date +%Y-%m-%d-%T`;

mkdir -p updates/fabriq-platform-server-release-${tag}-${DATE}-${HASH}

tar -C updates/fabriq-platform-server-release-${tag}-${DATE}-${HASH} --strip-components 1 -zxvf fabriq-platform-server-release.tar.gz
