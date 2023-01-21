package logic

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gctx"
	"testing"
)

func Test_lMenu_GetById(t *testing.T) {
	g.Dump(Menu.GetById(nil, 1))
}

func Test_lAdmin_ListMenus(t *testing.T) {
	g.Dump(Admin.ListMenus(nil, 1, -1))
}

func Test_lRoleMenu_ListRoleNoMenus(t *testing.T) {
	g.Dump(RoleMenu.ListRoleNoMenus(nil, 22))
}

func Test_lRole_GetOptions(t *testing.T) {
	g.Dump(Role.GetOptions(nil))
}

func Test_lWallet_GetStatisticsTodayLog(t *testing.T) {
	ctx := gctx.New()
	begin, _ := g.DB("sys").Begin(ctx)
	g.Dump(Wallet.GetStatisticsTodayLog(ctx, begin, 16))
}

func Test_lWalletStatisticsLog_GetReport(t *testing.T) {
	g.Dump(WalletStatisticsLog.GetReport(nil, "user333", "", ""))
}

func Test_lApi_AddGroup(t *testing.T) {
	g.Dump(Api.AddGroup(nil, "字典", "dict"))
}
