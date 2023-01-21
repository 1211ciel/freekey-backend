package main

import (
	_ "freekey-backend/internal/packed"

	"github.com/gogf/gf/v2/os/gctx"

	"freekey-backend/internal/cmd"
)

func main() {
	cmd.Main.Run(gctx.New())
}
