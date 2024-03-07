# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/downloads/libmemcached"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/build-libmemcached"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix/tmp"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/downloads"
  "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/mayuqiang/Desktop/M2 thesis/code/firm/benchmarks/1-social-network/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp${cfgdir}") # cfgdir has leading slash
endif()
