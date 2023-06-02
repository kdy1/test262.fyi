# This workflow will do a clean installation of node dependencies, cache/restore them, build the source code and run tests across different versions of node
# For more information see: https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-nodejs

name: test262 runner

on:
  push:
    branches: [ "main" ]

jobs:
  test262:
    runs-on: ubuntu-latest

    strategy:
      matrix:
        engine: [v8]

    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-node@v3
      with:
        node-version: 18
        cache: 'npm'

    - name: Run test262 with ${{ matrix.engine }}
      run: ./scripts/engines/${{ matrix.engine }}.sh
