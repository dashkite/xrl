import assert from "@dashkite/assert"
import {test, success} from "@dashkite/amen"
import print from "@dashkite/amen-console"

import XRL from "../src"

do ->

  print await test "XRL", [

    test "join", [

      test "base + absolute path", ->
        assert.equal "https://acme.com/foo/bar",
          XRL.join "https://acme.com", "/foo/bar"

      test "absolute url + absolute path", ->
        # maybe should be an error?
        # or https://acme.com/bar?
        assert.equal "https://acme.com/foo/bar",
          XRL.join "https://acme.com/foo", "/bar"

      test "path + path", ->
        assert.equal "/foo/bar",
          XRL.join "/foo", "/bar"

      test "base + array of path", ->
        assert.equal "https://acme.org/foo/bar",
          XRL.join [
            "https://acme.org"
            "foo"
            "bar"
          ]
    ]

    test "pop", [

      test "absolute URL", ->
        assert.equal "https://acme.org/foo",
          XRL.pop "https://acme.org/foo/bar"


      test "path", ->
        assert.equal "/foo",
          XRL.pop "/foo/bar"

    ]


  ]

  process.exit if success then 0 else 1
