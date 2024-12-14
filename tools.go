//go:build tools
// +build tools

package main

// TODO: update on Go 1.24 release https://go.googlesource.com/proposal/+/54d6775ff71ccbc00c276db2a4e4841d67011cf4/design/48429-go-tool-modules.md
import (
	_ "cuelang.org/go/cmd/cue"
)

