#!/usr/bin/env bash
#
# Functional assertions.
#

assert_test_coverage() {
  local dir="${1:-$(pwd)}"
  pushd "${dir}" >/dev/null || exit 1

  assert_file_exists ".logs/coverage/phpunit/cobertura.xml"
  assert_file_not_contains ".logs/coverage/phpunit/cobertura.xml" 'coverage line-rate="0"'

  assert_file_exists ".logs/coverage/phpunit/.coverage-html/index.html"
  assert_file_contains ".logs/coverage/phpunit/.coverage-html/index.html" "33.33% covered"

  popd >/dev/null || exit 1
}
