#!/bin/sh

mkdir -p ${LFS}/etc ${LFS}/var ${LFS}/usr/bin ${LFS}/usr/lib ${LFS}/usr/sbin;
for i in bin lib sbin; do
    ln -s usr/$i ${LFS}/${i};
done
