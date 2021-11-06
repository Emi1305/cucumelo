#!/bin/sh

pushd ${LFS}/sources;
echo "Verifying signatures";
while read -n dependency; do
    if gpg --verify "${dependency}.sig" "${dependency}" 2>/dev/null; then
        echo "${dependency}: OK";
    else
        echo "${dependency}: Failed! Package corrupted. Aborting";
    fi
done < <(ls *.tar.gz)
while read -n dependency; do
    if gpg --verify "${dependency}.sig" "${dependency}" 2>/dev/null; then
        echo "${dependency}: OK";
    else
        echo "${dependency}: Failed! Package corrupted. Aborting";
    fi
done < <(ls *.tar.xz)
rm *.sig;
popd;
