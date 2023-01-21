package cmd

import (
	"context"
	"freekey-backend/internal/controller"
	"freekey-backend/internal/service"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gcmd"
)

var (
	Main = gcmd.Command{
		Name:  "main",
		Usage: "main",
		Brief: "start http server",
		Func: func(ctx context.Context, parser *gcmd.Parser) (err error) {
			service.System.Init(ctx)
			s := g.Server()
			routers(s)
			s.Run()
			return nil
		},
	}
)

func routers(s *ghttp.Server) {
	s.Group("/v1", func(g *ghttp.RouterGroup) { v1Rooters(g) })
	s.Group("/backend", func(g *ghttp.RouterGroup) { sysRouters(g) })
}
func sysRouters(g *ghttp.RouterGroup) {
	g.Middleware(service.System.MiddlewareCORS)
	g.Middleware(service.Admin.MiddlewareActionLog)
	g.Group("/ws", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Admin.GetWs) // 管理员连接
		g.POST("/sendMsg", controller.Admin.SendMsg)
		g.POST("/noticeAdmins", controller.Admin.NoticeAdmins)
	})
	g.Middleware(ghttp.MiddlewareHandlerResponse)
	g.GET("/getCaptcha", controller.Admin.GetCaptcha)
	g.POST("/login", controller.Admin.Login)
	g.Group("/menu", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Menu.GetById)
		g.GET("/list", controller.Menu.List)
		g.POST("/", controller.Menu.Add)
		g.DELETE("/", controller.Menu.Del)
		g.PUT("/", controller.Menu.Update)
		g.PUT("/sort", controller.Menu.Sort)
	})
	g.Group("/api", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.POST("/", controller.Api.Add)
		g.POST("/addGroup", controller.Api.AddGroup)
		g.GET("/", controller.Api.GetById)
		g.GET("/list", controller.Api.List)
		g.DELETE("/", controller.Api.Del)
		g.PUT("/", controller.Api.Update)
	})
	g.Group("/role", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Role.GetById)
		g.GET("/list", controller.Role.List)
		g.GET("/getOptions", controller.Role.GetOptions)
		g.POST("/", controller.Role.Add)
		g.DELETE("/", controller.Role.Del)
		g.PUT("/", controller.Role.Update)
	})
	// --- RoleApi -----------------------------------------------------------------
	g.Group("/roleApi", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.RoleApi.GetById)
		g.GET("/list", controller.RoleApi.List)
		g.GET("/listRoleNoApis", controller.RoleApi.ListRoleNoApis)
		g.POST("/", controller.RoleApi.Add)
		g.POST("/addRoleApis", controller.RoleApi.AddRoleApis)
		g.DELETE("/", controller.RoleApi.Del)
		g.DELETE("/clear", controller.RoleApi.DelClear)
		g.PUT("/", controller.RoleApi.Update)
	})
	// --- RoleMenu -----------------------------------------------------------------
	g.Group("/roleMenu", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.RoleMenu.GetById)
		g.GET("/list", controller.RoleMenu.List)
		g.GET("/listRoleNoMenus", controller.RoleMenu.ListRoleNoMenus)
		g.POST("/addRoleMenus", controller.RoleMenu.AddRoleMenus)
		g.POST("/", controller.RoleMenu.Add)
		g.DELETE("/", controller.RoleMenu.Del)
		g.DELETE("/clear", controller.RoleMenu.DelClear)
		g.PUT("/", controller.RoleMenu.Update)
	})
	// --- Admin -----------------------------------------------------------------
	g.Group("/admin", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Admin.GetById)
		g.GET("/list", controller.Admin.List)
		g.GET("/getInfo", controller.Admin.GetInfo)
		g.GET("/getMenu", controller.Admin.GetMenu)
		g.POST("/", controller.Admin.Add)
		g.DELETE("/", controller.Admin.Del)
		g.PUT("/", controller.Admin.Update)
		g.PUT("/updateUname", controller.Admin.UpdateUname)
		g.PUT("/updatePass", controller.Admin.UpdatePass)
		g.PUT("/updateSelfPass", controller.Admin.UpdateSelfPass)
	})
	// --- Dict -----------------------------------------------------------------
	g.Group("/dict", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Dict.GetById)
		g.GET("/list", controller.Dict.List)
		g.POST("/", controller.Dict.Add)
		g.DELETE("/", controller.Dict.Del)
		g.PUT("/", controller.Dict.Update)
	})
	// --- File -----------------------------------------------------------------
	g.Group("/file", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.File.GetById)
		g.GET("/list", controller.File.List)
		g.POST("/", controller.File.Add)
		g.DELETE("/", controller.File.Del)
		g.PUT("/", controller.File.Update)
		g.POST("/upload", controller.File.Upload)
	})
	// --- OperationLog -----------------------------------------------------------------
	g.Group("/operationLog", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.OperationLog.GetById)
		g.GET("/list", controller.OperationLog.List)
		g.POST("/", controller.OperationLog.Add)
		g.DELETE("/", controller.OperationLog.Del)
		g.DELETE("/delClear", controller.OperationLog.DelClear)
		g.PUT("/", controller.OperationLog.Update)
	})
	// --- AdminLoginLog -----------------------------------------------------------------
	g.Group("/adminLoginLog", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.AdminLoginLog.GetById)
		g.GET("/list", controller.AdminLoginLog.List)
		g.POST("/", controller.AdminLoginLog.Add)
		g.DELETE("/", controller.AdminLoginLog.Del)
		g.DELETE("/delClear", controller.AdminLoginLog.DelClear)
		g.PUT("/", controller.AdminLoginLog.Update)
	})
	// --- Banner -----------------------------------------------------------------
	g.Group("/banner", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Banner.GetById)
		g.GET("/list", controller.Banner.ListForBackend)
		g.POST("/", controller.Banner.Add)
		g.DELETE("/", controller.Banner.Del)
		g.PUT("/", controller.Banner.Update)
	})
	// --- User -----------------------------------------------------------------
	g.Group("/user", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.User.GetById)
		g.GET("/list", controller.User.List)
		g.POST("/", controller.User.Add)
		g.DELETE("/", controller.User.Del)
		g.PUT("/", controller.User.Update)
		g.PUT("/updateUname", controller.User.UpdateUname)
		g.PUT("/updatePass", controller.User.UpdatePassForBackend)
	})
	// --- UserLoginLog -----------------------------------------------------------------
	g.Group("/userLoginLog", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.UserLoginLog.GetById)
		g.GET("/list", controller.UserLoginLog.List)
		g.POST("/", controller.UserLoginLog.Add)
		g.DELETE("/", controller.UserLoginLog.Del)
		g.DELETE("/delClear", controller.UserLoginLog.DelClear)
		g.PUT("/", controller.UserLoginLog.Update)
	})
	// --- Wallet -----------------------------------------------------------------
	g.Group("/wallet", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.Wallet.GetById)
		g.GET("/list", controller.Wallet.List)
		g.POST("/", controller.Wallet.Add)
		g.DELETE("/", controller.Wallet.Del)
		g.PUT("/", controller.Wallet.Update)
		g.PUT("/updatePass", controller.Wallet.UpdatePassForBackend)
		g.PUT("/updateByAdmin", controller.Wallet.UpdateByAdmin)
	})
	// --- WalletChangeType -----------------------------------------------------------------
	g.Group("/walletChangeType", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.WalletChangeType.GetById)
		g.GET("/list", controller.WalletChangeType.List)
		g.GET("/listOptions", controller.WalletChangeType.ListOptions)
		g.POST("/", controller.WalletChangeType.Add)
		g.DELETE("/", controller.WalletChangeType.Del)
		g.PUT("/", controller.WalletChangeType.Update)
	})
	// --- WalletChangeLog -----------------------------------------------------------------
	g.Group("/walletChangeLog", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.WalletChangeLog.GetById)
		g.GET("/list", controller.WalletChangeLog.List)
		g.POST("/", controller.WalletChangeLog.Add)
		g.DELETE("/", controller.WalletChangeLog.Del)
		g.PUT("/", controller.WalletChangeLog.Update)
	})
	// --- WalletStatisticsLog -----------------------------------------------------------------
	g.Group("/walletStatisticsLog", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.WalletStatisticsLog.GetById)
		g.GET("/list", controller.WalletStatisticsLog.List)
		g.POST("/", controller.WalletStatisticsLog.Add)
		g.DELETE("/", controller.WalletStatisticsLog.Del)
		g.PUT("/", controller.WalletStatisticsLog.Update)
	})
	// --- WalletTopUpApplication -----------------------------------------------------------------
	g.Group("/walletTopUpApplication", func(g *ghttp.RouterGroup) {
		g.Middleware(service.Admin.MiddlewareAuth)
		g.GET("/", controller.WalletTopUpApplication.GetById)
		g.GET("/list", controller.WalletTopUpApplication.List)
		g.GET("/getReport", controller.WalletTopUpApplication.GetReport)
		g.POST("/", controller.WalletTopUpApplication.Add)
		g.DELETE("/", controller.WalletTopUpApplication.Del)
		g.PUT("/", controller.WalletTopUpApplication.Update)
		g.PUT("/updateByAdmin", controller.WalletTopUpApplication.UpdateByAdmin)
	})

}

func v1Rooters(g *ghttp.RouterGroup) {
	g.Middleware(ghttp.MiddlewareHandlerResponse, service.System.MiddlewareCORS)
	g.Group("/user", func(g *ghttp.RouterGroup) {
		g.POST("/register", controller.User.Register)
		g.POST("/login", controller.User.Login)
		g.GET("/icons", controller.User.Icons)
		g.Middleware(service.User.MiddlewareAuth)
		g.GET("/info", controller.User.Info)
		g.POST("/updatePass", controller.User.UpdatePassByUser)
		g.POST("/updateNickname", controller.User.UpdateNickname)
		g.POST("/updateIcon", controller.User.UpdateIcon)
	})
	g.Group("/wallet", func(g *ghttp.RouterGroup) {
		g.Middleware(service.User.MiddlewareAuth)
		g.POST("/setPass", controller.Wallet.SetPass)
		g.POST("/updatePass", controller.Wallet.UpdatePass)
		g.GET("/topUpCategory", controller.Wallet.TopUpCategory)
		g.POST("/createTopUp", controller.Wallet.CreateTopUp)
		g.GET("/listTopUp", controller.Wallet.ListTopUp)
		g.GET("/listChangeTypes", controller.Wallet.ListChangeTypes)
		g.GET("/listChangeLogs", controller.Wallet.ListChangeLogs)
		g.GET("/getInfo", controller.Wallet.GetInfo)
	})
	g.Group("/sys", func(g *ghttp.RouterGroup) {
		g.GET("/allDict", controller.Sys.ListAllDict)
		g.GET("/dict", controller.Sys.GetDictByKey)
		g.GET("/banners", controller.Banner.List)
		g.Middleware(service.User.MiddlewareAuth)
		g.POST("/uploadImg", controller.Sys.UploadImg)
	})
}
