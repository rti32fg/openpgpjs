# SPDX-License-Identifier: AGPL-3.0

#    -----------------------------------------------------
#    Copyright © 2024, 2025, 2026  Pellegrino Prevete
#
#    All rights reserved
#    -----------------------------------------------------
#
#    This program is free software: you can redistribute
#    it and/or modify it under the terms of the
#    GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of
#    the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it
#    will be useful, but WITHOUT ANY WARRANTY;
#    without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Affero General Public License for
#    more details.
#
#    You should have received a copy of the
#    GNU Affero General Public License
#    along with this program.
#    If not, see <https://www.gnu.org/licenses/>.

SHELL=bash
_PROJECT=openpgpjs
_PROJECT_NPM=@themartiancompany/$(_PROJECT)

NPM_FILES=\
  "dist" \
  "lightweight"
  "COPYING" \
  "AUTHORS.rst" \
  "SECURITY.md" \
  "Makefile" \
  "dist" \
  "evm-contract-call" \
  "evm-contract-call.webpack.config.cjs" \
  "evm-contract-deployment-address" \
  "evm-contract-deployment-address.webpack.config.cjs" \
  "evm-contract-deployment-networks" \
  "evm-contract-deployment-networks.webpack.config.cjs" \
  "evm-contract-deployment-versions" \
  "evm-contract-deployment-versions.webpack.config.cjs" \
  "evm-contract-deployments-dir" \
  "evm-contract-deployments-dir.webpack.config.cjs" \
  "lib" \
  "libevm-contract-call" \
  "libevm-contract-call.webpack.config.cjs" \
  "libevm-contract-deployment-address" \
  "libevm-contract-deployment-address.webpack.config.cjs" \
  "libevm-contract-deployment-networks" \
  "libevm-contract-deployment-networks.webpack.config.cjs" \
  "libevm-contract-deployment-versions" \
  "libevm-contract-deployment-versions.webpack.config.cjs" \
  "libevm-contract-deployments-dir" \
  "libevm-contract-deployments-dir.webpack.config.cjs" \
  "$(_PROJECT_NPM)" \
  "eslint.config.mjs" \
  "fs-worker.webpack.config.cjs" \
  "package.json" \
  "webpack.config.cjs"

all: build-npm

build-npm:

	mkdir \
	  -p \
	  "build"; \
	for _file in $(NPM_FILES); do \
	  if [[ -d "$${_file}" ]]; then \
	    mkdir \
	     -p \
	     "build/$${_file}"; \
	    cp \
	      -r \
	      "$${_file}/"* \
	      "build/$${_file}"; \
	  elif [[ -e "$${_file}" ]]; then \
	    cp \
	      "$${_file}" \
	      "build"; \
	  fi; \
	done

	npm \
	  install \
	    --legacy-peer-deps \
	    --include="dev"

publish-npm:

	npm \
	  publish \
	  --access="public"

.PHONY: build-npm publish-npm
