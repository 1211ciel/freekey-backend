package service

import (
	"context"
	v1 "freekey-backend/api/v1"
	"freekey-backend/internal/consts"
	"freekey-backend/internal/dao"
	"freekey-backend/internal/logic"
	"freekey-backend/internal/model"
	"freekey-backend/internal/model/do"
	"freekey-backend/internal/model/entity"
	"freekey-backend/utility/utils/xjwt"
	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/glog"
	"net/http"
)

var (
	System                 = sSystem{}
	Menu                   = sMenu{}
	Role                   = sRole{}
	RoleApi                = sRoleApi{}
	Api                    = sApi{}
	Admin                  = sAdmin{}
	Dict                   = sDict{}
	File                   = sFile{}
	OperationLog           = sOperationLog{}
	AdminLoginLog          = sAdminLoginLog{}
	Banner                 = sBanner{}
	Gen                    = sGen{}
	Ws                     = sWs{}
	User                   = sUser{}
	UserLoginLog           = sUserLoginLog{}
	Wallet                 = sWallet{}
	WalletChangeType       = sWalletChangeType{}
	WalletChangeLog        = sWalletChangeLog{}
	WalletStatisticsLog    = sWalletStatisticsLog{}
	WalletTopUpApplication = sWalletTopUpApplication{}
)

type sMenu struct{}

func (s sMenu) AddMenu(ctx context.Context, menu *entity.Menu) error {
	return logic.Menu.AddMenu(ctx, menu)
}
func (s sMenu) GetMenuById(ctx context.Context, id uint64) (*entity.Menu, error) {
	return logic.Menu.GetById(ctx, id)
}
func (s sMenu) ListMenu(ctx context.Context, req *v1.ListMenuReq) ([]*entity.Menu, *v1.PageRes, error) {
	menu, total, err := logic.Menu.ListMenu(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sMenu) Del(ctx context.Context, id uint64) error {
	return logic.Menu.Del(ctx, id)
}
func (s sMenu) UpdateMenu(ctx context.Context, data *v1.UpdateMenuReq) error {
	return logic.Menu.Update(ctx, data)
}

type sApi struct{}

func (s sApi) AddApi(ctx context.Context, menu *entity.Api) error {
	return logic.Api.AddApi(ctx, menu)
}
func (s sApi) GetApiById(ctx context.Context, id uint64) (*entity.Api, error) {
	return logic.Api.GetById(ctx, id)
}
func (s sApi) List(ctx context.Context, req *v1.ListApiReq) ([]*entity.Api, *v1.PageRes, error) {
	menu, total, err := logic.Api.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sApi) Del(ctx context.Context, id uint64) error {
	return logic.Api.Del(ctx, id)
}
func (s sApi) UpdateApi(ctx context.Context, data *v1.UpdateApiReq) error {
	return logic.Api.Update(ctx, data)
}

func (s sApi) AddGroup(ctx context.Context, group string, url string) (int, error) {
	return logic.Api.AddGroup(ctx, group, url)
}

type sSystem struct{}

func (s sSystem) Init(ctx context.Context) {
	// set log
	g.Log().SetFlags(glog.F_FILE_LONG | glog.F_TIME_DATE | glog.F_TIME_MILLI)
	// bind funcMap
	// set imgPrefix
	get, err := g.Cfg().Get(ctx, "server.imgPrefix")
	if err != nil {
		panic(err)
	}
	consts.ImgPrefix = get.String()
	// setWhiteIps
	if err = logic.Dict.UpdateWhiteIps(ctx); err != nil {
		panic(err)
	}
	xjwt.Init()
}
func (s sSystem) Add(ctx context.Context, table, data interface{}, dbGroup ...string) error {
	return logic.System.Add(ctx, table, data, dbGroup...)
}

func (s sSystem) GetById(ctx context.Context, table, id interface{}, dbGroup ...string) (gdb.Record, error) {
	return logic.System.GetById(ctx, table, id, dbGroup...)
}
func (s sSystem) GetNodeInfo(ctx context.Context, path string) (*entity.Menu, error) {
	return logic.System.GetNodeInfo(ctx, path)
}
func (s sSystem) GetMsgFromSession(r *ghttp.Request) string {
	return logic.System.GetMsgFromSession(r)
}
func (s sSystem) GetAdminId(ctx context.Context) (int, error) {
	session, err := Admin.GetInfoFromSession(ghttp.RequestFromCtx(ctx).Session)
	if err != nil {
		return 0, err
	}
	return session.Id, nil
}
func (s sSystem) List(ctx context.Context, c *model.Search, dbGroup ...string) (int, gdb.List, error) {
	return logic.System.List(ctx, c, dbGroup...)
}
func (s sSystem) ListAllDict(ctx context.Context) (g.Map, error) {
	return logic.System.ListAllDict(ctx)
}
func (s sSystem) ListBanners(ctx context.Context) ([]*v1.BannerRes, error) {
	return logic.System.ListBanners(ctx)
}

func (s sSystem) Del(ctx context.Context, table, id interface{}, dbGroup ...string) error {
	return logic.System.Del(ctx, table, id, dbGroup...)
}
func (s sSystem) Update(ctx context.Context, table, id, data interface{}, dbGroup ...string) error {
	return logic.System.Update(ctx, table, id, data, dbGroup...)
}
func (s sSystem) UpdateMenuSort(ctx context.Context, sort int, id uint64) error {
	return logic.Menu.UpdateGroupSort(ctx, sort, id)
}
func (s sSystem) MiddlewareCORS(r *ghttp.Request) {
	logic.System.MiddlewareCORS(r)
}
func (s sSystem) MiddlewareWhiteIp(r *ghttp.Request) {
	logic.System.MiddlewareWhiteIp(r)
}

type sRole struct{}

func (s sRole) DelMenus(ctx context.Context, rid interface{}) error {
	return logic.Role.DelMenus(ctx, rid)
}
func (s sRole) Add(ctx context.Context, menu *entity.Role) error {
	return logic.Role.AddRole(ctx, menu)
}
func (s sRole) GetById(ctx context.Context, id uint64) (*entity.Role, error) {
	return logic.Role.GetById(ctx, id)
}
func (s sRole) List(ctx context.Context, req *v1.ListRoleReq) ([]*entity.Role, *v1.PageRes, error) {
	menu, total, err := logic.Role.ListRole(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sRole) Del(ctx context.Context, id uint64) error {
	return logic.Role.Del(ctx, id)
}
func (s sRole) Update(ctx context.Context, data *v1.UpdateRoleReq) error {
	return logic.Role.Update(ctx, data)
}

func (s sRole) GetOptions(ctx context.Context) (string, error) {
	return logic.Role.GetOptions(ctx)
}

// --- RoleMenu -----------------------------------------------------------------

var RoleMenu = sRoleMenu{}

type sRoleMenu struct{}

func (s sRoleMenu) Add(ctx context.Context, menu *entity.RoleMenu) error {
	return logic.RoleMenu.AddRoleMenu(ctx, menu)
}
func (s sRoleMenu) AddMenus(ctx context.Context, rid int, menuIds []int) error {
	return logic.RoleMenu.AddMenus(ctx, rid, menuIds)
}
func (s sRoleMenu) GetById(ctx context.Context, id uint64) (*entity.RoleMenu, error) {
	return logic.RoleMenu.GetById(ctx, id)
}
func (s sRoleMenu) List(ctx context.Context, req *v1.ListRoleMenuReq) ([]*model.RoleMenu, *v1.PageRes, error) {
	menu, total, err := logic.RoleMenu.ListRoleMenu(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sRoleMenu) ListRoleNoMenus(ctx context.Context, rid int) ([]*v1.ListRoleNoMenusRes, error) {
	return logic.RoleMenu.ListRoleNoMenus(ctx, rid)
}
func (s sRoleMenu) Del(ctx context.Context, id uint64) error {
	return logic.RoleMenu.Del(ctx, id)
}
func (s sRoleMenu) DelClear(ctx context.Context, rid uint64) error {
	return logic.RoleMenu.DelClear(ctx, rid)
}
func (s sRoleMenu) Update(ctx context.Context, data *v1.UpdateRoleMenuReq) error {
	return logic.RoleMenu.Update(ctx, data)
}

// --- RoleApi -----------------------------------------------------------------

type sRoleApi struct{}

func (s sRoleApi) Add(ctx context.Context, menu *entity.RoleApi) error {
	return logic.RoleApi.AddRoleApi(ctx, menu)
}
func (s sRoleApi) AddRoleApis(ctx context.Context, rid int, apiIds []int) error {
	return logic.RoleApi.AddRoleApis(ctx, rid, apiIds)
}
func (s sRoleApi) GetById(ctx context.Context, id uint64) (*entity.RoleApi, error) {
	return logic.RoleApi.GetById(ctx, id)
}
func (s sRoleApi) List(ctx context.Context, req *v1.ListRoleApiReq) ([]*model.RoleApi, *v1.PageRes, error) {
	menu, total, err := logic.RoleApi.ListRoleApi(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sRoleApi) ListRoleNoApis(ctx context.Context, rid interface{}) ([]*v1.ListRoleNoApisRes, error) {
	return logic.RoleApi.ListRoleNoApis(ctx, rid)
}
func (s sRoleApi) Del(ctx context.Context, id uint64) error {
	return logic.RoleApi.Del(ctx, id)
}

func (s sRoleApi) DelClear(ctx context.Context, rid uint64) error {
	return logic.RoleApi.DelClear(ctx, rid)
}
func (s sRoleApi) Update(ctx context.Context, data *v1.UpdateRoleApiReq) error {
	return logic.RoleApi.Update(ctx, data)
}

// --- Admin -----------------------------------------------------------------

type sAdmin struct{}

func (s sAdmin) Add(ctx context.Context, menu *entity.Admin) error {
	return logic.Admin.Add(ctx, menu)
}
func (s sAdmin) AddMessage(ctx context.Context, uname string, title string, url string, t int) error {
	return logic.Admin.AddMessage(ctx, uname, title, url, t)
}

func (s sAdmin) GetById(ctx context.Context, id uint64) (*entity.Admin, error) {
	return logic.Admin.GetById(ctx, id)
}
func (s sAdmin) GetUidFromCtx(ctx context.Context) uint64 {
	return logic.Admin.GetUidFromCtx(ctx)
}
func (s sAdmin) GetInfoFromSession(r *ghttp.Session) (*model.Admin, error) {
	return logic.Session.GetAdmin(r)
}
func (s sAdmin) GetInfo(ctx context.Context) (*model.Admin, error) {
	return logic.Admin.GetInfo(ctx, logic.Admin.GetUidFromCtx(ctx))
}
func (s sAdmin) GetMenu(ctx context.Context, path string) (*entity.Menu, error) {
	return logic.Menu.GetMenuByPath(ctx, path)
}
func (s sAdmin) List(ctx context.Context, req *v1.ListAdminReq) ([]*entity.Admin, *v1.PageRes, error) {
	menu, total, err := logic.Admin.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}

func (s sAdmin) ListNotifications(ctx context.Context, page int, size int) (int, []*entity.AdminMessage, error) {
	session, err := s.GetInfoFromSession(ghttp.RequestFromCtx(ctx).Session)
	if err != nil {
		return 0, nil, err
	}

	return logic.Admin.ListNotifications(ctx, page, size, session.Id)
}

func (s sAdmin) Del(ctx context.Context, id uint64) error {
	return logic.Admin.Del(ctx, id)
}
func (s sAdmin) DelNotification(ctx context.Context, id uint64) error {
	session, err := s.GetInfoFromSession(ghttp.RequestFromCtx(ctx).Session)
	if err != nil {
		return err
	}
	return logic.System.DelFun(ctx, "sys", func(ctx context.Context, db gdb.DB) error {
		if _, err = db.Model(dao.AdminMessage.Table()).Delete("id = ? and aid = ?", id, session.Id); err != nil {
			return err
		}
		return nil
	})
}
func (s sAdmin) DelOperationLogs(ctx context.Context) error {
	return logic.Admin.DelOperationLogs(ctx)
}
func (s sAdmin) DelNotifications(ctx context.Context) error {
	session, err := s.GetInfoFromSession(ghttp.RequestFromCtx(ctx).Session)
	if err != nil {
		return err
	}
	return logic.Admin.DelNotifications(ctx, session.Id)
}
func (s sAdmin) DelLoginLogs(ctx context.Context) error {
	return logic.Admin.DelLoginLogs(ctx)
}
func (s sAdmin) Logout(ctx context.Context) error {
	return logic.Session.DelAdmin(ctx)
}

func (s sAdmin) Login(ctx context.Context, req *v1.AdminLoginReq) (string, error) {
	return logic.Admin.Login(ctx, req.Id, req.Uname, req.Pass, req.Captcha)
}
func (s sAdmin) Update(ctx context.Context, data *v1.UpdateAdminReq) error {
	return logic.Admin.Update(ctx, data)
}
func (s sAdmin) UpdatePwd(ctx context.Context, pwd, pwd2 string) error {
	return logic.Admin.UpdatePwd(ctx, pwd, pwd2)
}
func (s sAdmin) UpdateUname(ctx context.Context, id, uname interface{}) error {
	return logic.Admin.UpdateUname(ctx, id, uname)
}
func (s sAdmin) UpdatePwdWithoutOld(ctx context.Context, id, pwd interface{}) error {
	return logic.Admin.UpdatePwdWithoutOldPwd(ctx, id, pwd)
}

func (s sAdmin) MiddlewareAuth(r *ghttp.Request) {
	logic.Admin.MiddlewareAuth(r)
}
func (s sAdmin) MiddlewareLock(r *ghttp.Request) {
	logic.Admin.MiddlewareLock(r)
}
func (s sAdmin) MiddlewareActionLog(r *ghttp.Request) {
	logic.Admin.MiddlewareAction(r)
}

func (s sAdmin) UpdateAdminPassSelf(ctx context.Context, pass string) error {
	return logic.Admin.UpdateAdminPassSelf(ctx, s.GetUidFromCtx(ctx), pass)
}

func (s sAdmin) SendMsg(ctx context.Context, d *model.AdminMsg) error {
	return logic.Admin.SendMsg(ctx, d)
}

func (s sAdmin) NoticeAdmins(ctx context.Context, d *model.AdminMsg) error {
	return logic.Admin.NoticeAdmins(ctx, d)
}

// --- Dict -----------------------------------------------------------------
type sDict struct{}

func (s sDict) Add(ctx context.Context, in *entity.Dict) error {
	return logic.Dict.AddDict(ctx, in)
}
func (s sDict) GetById(ctx context.Context, id uint64) (*entity.Dict, error) {
	return logic.Dict.GetById(ctx, id)
}
func (s sDict) GetByKey(ctx context.Context, key string) (string, error) {
	return logic.Dict.GetByKeyString(ctx, key)
}
func (s sDict) GetApiGroupOptions(ctx context.Context) (string, error) {
	return logic.Dict.TakeApiGroupOptions(ctx)
}
func (s sDict) List(ctx context.Context, req *v1.ListDictReq) ([]*entity.Dict, *v1.PageRes, error) {
	menu, total, err := logic.Dict.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sDict) Del(ctx context.Context, id uint64) error {
	return logic.Dict.Del(ctx, id)
}
func (s sDict) Update(ctx context.Context, data *v1.UpdateDictReq) error {
	return logic.Dict.Update(ctx, data)
}
func (s sDict) UpdateWhiteIps(ctx context.Context, v ...string) error {
	return logic.Dict.UpdateWhiteIps(ctx, v...)
}

// --- File -----------------------------------------------------------------

type sFile struct{}

func (s sFile) Add(ctx context.Context, in *entity.File) error {
	return logic.File.AddFile(ctx, in)
}
func (s sFile) Uploads(ctx context.Context) (*v1.UploadFilesRes, error) {
	return logic.File.Uploads(ctx)
}
func (s sFile) Upload(ctx context.Context, group int) (*v1.UploadFileRes, error) {
	return logic.File.Upload(ctx, group)
}
func (s sFile) GetById(ctx context.Context, id uint64) (*entity.File, error) {
	return logic.File.GetById(ctx, id)
}
func (s sFile) List(ctx context.Context, req *v1.ListFileReq) ([]*entity.File, *v1.PageRes, error) {
	menu, total, err := logic.File.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sFile) Del(ctx context.Context, id uint64) error {
	return logic.File.Del(ctx, id)
}
func (s sFile) Update(ctx context.Context, data *v1.UpdateFileReq) error {
	return logic.File.Update(ctx, data)
}

// --- OperationLog -----------------------------------------------------------------

type sOperationLog struct{}

func (s sOperationLog) Add(ctx context.Context, in *entity.OperationLog) error {
	return logic.OperationLog.AddOperationLog(ctx, in)
}
func (s sOperationLog) GetById(ctx context.Context, id uint64) (*entity.OperationLog, error) {
	return logic.OperationLog.GetById(ctx, id)
}
func (s sOperationLog) List(ctx context.Context, req *v1.ListOperationLogReq) ([]*model.OperationLog, *v1.PageRes, error) {
	menu, total, err := logic.OperationLog.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sOperationLog) Del(ctx context.Context, id uint64) error {
	return logic.OperationLog.Del(ctx, id)
}
func (s sOperationLog) DelClear(ctx context.Context) error {
	return logic.OperationLog.DelClear(ctx)
}
func (s sOperationLog) Update(ctx context.Context, data *v1.UpdateOperationLogReq) error {
	return logic.OperationLog.Update(ctx, data)
}

// --- AdminLoginLog -----------------------------------------------------------------

type sAdminLoginLog struct{}

func (s sAdminLoginLog) Add(ctx context.Context, in *entity.AdminLoginLog) error {
	return logic.AdminLoginLog.Add(ctx, in)
}
func (s sAdminLoginLog) GetById(ctx context.Context, id uint64) (*entity.AdminLoginLog, error) {
	return logic.AdminLoginLog.GetById(ctx, id)
}
func (s sAdminLoginLog) List(ctx context.Context, req *v1.ListAdminLoginLogReq) ([]*model.AdminLoginLog, *v1.PageRes, error) {
	menu, total, err := logic.AdminLoginLog.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sAdminLoginLog) Del(ctx context.Context, id uint64) error {
	return logic.AdminLoginLog.Del(ctx, id)
}

func (s sAdminLoginLog) DelClear(ctx context.Context) error {
	return logic.AdminLoginLog.DelClear(ctx)
}
func (s sAdminLoginLog) Update(ctx context.Context, data *v1.UpdateAdminLoginLogReq) error {
	return logic.AdminLoginLog.Update(ctx, data)
}

type sGen struct{}

func (s sGen) GenMenuLevel1(ctx context.Context) (string, error) {
	return logic.Gen.MenuLeve1(ctx)
}
func (s sGen) GetTables(ctx context.Context, db string) (string, error) {
	return logic.Gen.TakeTables(ctx, db)
}
func (s sGen) Gen(ctx context.Context, table, group, menu, prefix, apiGroup, htmlGroup, dbGroup string) error {
	return logic.Gen.Gen(ctx, table, group, menu, prefix, apiGroup, htmlGroup, dbGroup)
}

type sWs struct{}

func (s sWs) GetUserWs(r *ghttp.Request) {
	logic.Ws.GetUserWs(r)
}
func (s sWs) GetAdminWs(r *ghttp.Request) {
	logic.Ws.GetAdminWs(r)
}
func (s sWs) NoticeUser(ctx context.Context, uid int, msg interface{}) error {
	return logic.Ws.NoticeUser(ctx, uid, msg)
}
func (s sWs) NoticeUsers(ctx context.Context, msg interface{}) error {
	return logic.Ws.NoticeUsers(ctx, msg)
}
func (s sWs) NoticeAdmin(ctx context.Context, msg interface{}, adminId uint64) error {
	return logic.Ws.NoticeAdmin(ctx, msg, adminId)
}
func (s sWs) NoticeAdmins(ctx context.Context, msg interface{}) error {
	return logic.Ws.NoticeAdmins(ctx, msg)
}

// --- User -----------------------------------------------------------------

type sUser struct{}

func (s sUser) Add(ctx context.Context, in *entity.User) error {
	return logic.User.Add(ctx, in)
}
func (s sUser) Register(ctx context.Context, input *v1.RegisterReq) (*v1.LoginRes, error) {
	return logic.User.AddForApi(ctx, input)
}
func (s sUser) Login(ctx context.Context, input *v1.LoginReq) (*v1.LoginRes, error) {
	loginVo, err := logic.User.Login(ctx, input)
	if err != nil {
		return nil, err
	}
	return loginVo, err
}

func (s sUser) GetUserInfo(ctx context.Context) (*v1.LoginRes, error) {
	uid := logic.User.GetUidFromCtx(ctx)
	return logic.User.GetInfo(ctx, uid)
}
func (s sUser) GetById(ctx context.Context, id uint64) (*entity.User, error) {
	return logic.User.GetById(ctx, id)
}
func (s sUser) GetUidFromCookie(ctx context.Context) uint64 {
	return logic.User.GetUidFromCookie(ctx)
}
func (s sUser) GetUidFromCtx(ctx context.Context) uint64 {
	return ghttp.RequestFromCtx(ctx).Get(consts.TokenUserIdKey).Uint64()
}
func (s sUser) List(ctx context.Context, req *v1.ListUserReq) ([]*entity.User, *v1.PageRes, error) {
	menu, total, err := logic.User.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sUser) ListIcons(ctx context.Context) ([]string, error) {
	return logic.File.ListIcons(ctx)
}

func (s sUser) Del(ctx context.Context, id uint64) error {
	return logic.User.Del(ctx, id)
}
func (s sUser) Logout(ctx context.Context) {
	logic.User.Logout(ctx)
}
func (s sUser) DelLoginLogs(ctx context.Context) error {
	return logic.User.DelLoinLogs(ctx)
}

func (s sUser) Update(ctx context.Context, data *v1.UpdateUserReq) error {
	return logic.User.Update(ctx, data)
}
func (s sUser) UpdateUname(ctx context.Context, uname string, id uint64) error {
	return logic.User.UpdateUname(ctx, uname, id)
}
func (s sUser) UpdatePassByAdmin(ctx context.Context, pass string, id uint64) error {
	return logic.User.UpdatePass(ctx, pass, id)
}
func (s sUser) UpdatePassByUser(ctx context.Context, in *v1.UpdatePassReq) error {
	id := logic.User.GetUidFromCtx(ctx)
	return logic.User.UpdatePassByUser(ctx, in, id)
}
func (s sUser) UpdateNickname(ctx context.Context, in *v1.UpdateNicknameReq) error {
	return logic.User.UpdateNickname(ctx, in.Nickname, s.GetUidFromCtx(ctx))
}
func (s sUser) UpdateIcon(ctx context.Context, icon string) error {
	return logic.User.UpdateIcon(ctx, icon, s.GetUidFromCtx(ctx))
}
func (s sUser) MiddlewareAuth(c *ghttp.Request) {
	userInfo, err := xjwt.UserInfo(c)
	if err != nil {
		c.Response.WriteStatus(http.StatusForbidden, consts.ErrAuth.Error())
		c.Exit()
	}
	c.SetParam(consts.TokenUserIdKey, userInfo.Uid)
	c.Middleware.Next()
}

// --- UserLoginLog -----------------------------------------------------------------

type sUserLoginLog struct{}

func (s sUserLoginLog) Add(ctx context.Context, in *entity.UserLoginLog) error {
	return logic.UserLoginLog.Add(ctx, in)
}
func (s sUserLoginLog) GetById(ctx context.Context, id uint64) (*entity.UserLoginLog, error) {
	return logic.UserLoginLog.GetById(ctx, id)
}
func (s sUserLoginLog) List(ctx context.Context, req *v1.ListUserLoginLogReq) ([]*model.UserLoginLog, *v1.PageRes, error) {
	menu, total, err := logic.UserLoginLog.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sUserLoginLog) Del(ctx context.Context, id uint64) error {
	return logic.UserLoginLog.Del(ctx, id)
}
func (s sUserLoginLog) Update(ctx context.Context, data *v1.UpdateUserLoginLogReq) error {
	return logic.UserLoginLog.Update(ctx, data)
}

func (s sUserLoginLog) DelClear(ctx context.Context) error {
	return logic.UserLoginLog.DelClear(ctx)
}

// --- Banner -----------------------------------------------------------------

type sBanner struct{}

func (s sBanner) Add(ctx context.Context, in *entity.Banner) error {
	return logic.Banner.AddBanner(ctx, in)
}
func (s sBanner) GetById(ctx context.Context, id uint64) (*entity.Banner, error) {
	return logic.Banner.GetById(ctx, id)
}
func (s sBanner) List(ctx context.Context, req *v1.ListBannerReq) ([]*entity.Banner, *v1.PageRes, error) {
	menu, total, err := logic.Banner.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sBanner) Del(ctx context.Context, id uint64) error {
	return logic.Banner.Del(ctx, id)
}
func (s sBanner) Update(ctx context.Context, data *v1.UpdateBannerReq) error {
	return logic.Banner.Update(ctx, data)
}

// --- Wallet -----------------------------------------------------------------

type sWallet struct{}

func (s sWallet) Add(ctx context.Context, in *entity.Wallet) error {
	return logic.Wallet.Add(ctx, in)
}
func (s sWallet) AddTopUp(ctx context.Context, req *v1.CreateTopUpReq, uid uint64) error {
	return logic.Wallet.AddTopUp(ctx, req.Money, req.ChangeTypeId, uid)
}

func (s sWallet) GetById(ctx context.Context, id uint64) (*entity.Wallet, error) {
	return logic.Wallet.GetById(ctx, id)
}
func (s sWallet) GetInfo(ctx context.Context) (*v1.WalletInfoRes, error) {
	return logic.Wallet.GetInfo(ctx, User.GetUidFromCtx(ctx))
}
func (s sWallet) GetChangeTypeOptions(ctx context.Context) (string, error) {
	return logic.Wallet.GetChangeTypeOptions(ctx)
}
func (s sWallet) GetChangeTypeTopUpOptions(ctx context.Context) (string, error) {
	return logic.Wallet.GetChangeTypeTopUpOptions(ctx)
}
func (s sWallet) GetChangeTypeDeductOptions(ctx context.Context) (string, error) {
	return logic.Wallet.GetChangeTypeDeductOptions(ctx)
}
func (s sWallet) GetStatisticsLogFieldsNeedToBeCountedOptions(ctx context.Context) (string, error) {
	return logic.Wallet.TakeStatisticsLogFieldsNeedToBeCountedOptionsIntoStr(ctx)
}
func (s sWallet) GetStatisticsLogFieldsNeedToBeCountedOptionsIntoArray(ctx context.Context) ([]string, error) {
	return logic.Wallet.TakeStatisticsLogFieldsNeedToBeCountedOptionsIntoArray(ctx)
}

func (s sWallet) List(ctx context.Context, req *v1.ListWalletReq) ([]*model.Wallet, *v1.PageRes, error) {
	menu, total, err := logic.Wallet.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWallet) ListTopUpCategory(ctx context.Context) ([]*v1.TopUpCategoryRes, error) {
	return logic.Wallet.ListTopUpCategory(ctx)
}
func (s sWallet) ListTopUp(ctx context.Context, req *v1.ListTopUpReq) ([]*model.TopUpItem, *v1.PageRes, error) {
	total, items, err := logic.Wallet.ListTopUpByUid(ctx, req.Page, req.Size, req.Status, User.GetUidFromCtx(ctx))
	if err != nil {
		return nil, nil, err
	}
	return items, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWallet) ListChangeTypes(ctx context.Context) ([]*v1.ListChangeTypesRes, error) {
	return logic.Wallet.ListChangeTypes(ctx)
}
func (s sWallet) ListChangeLogs(ctx context.Context, req *v1.ListChangeLogReq) ([]*model.ChangeLogItem, *v1.PageRes, error) {
	total, items, err := logic.Wallet.ListChangeLogs(ctx, req.Page, req.Size, req.Type, User.GetUidFromCtx(ctx))
	if err != nil {
		return nil, nil, err
	}

	return items, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}

func (s sWallet) Del(ctx context.Context, id uint64) error {
	return logic.Wallet.Del(ctx, id)
}
func (s sWallet) DelChangeLogs(ctx context.Context) error {
	return logic.Wallet.DelChangeLogs(ctx)
}
func (s sWallet) DelStatisticsLogs(ctx context.Context) error {
	return logic.Wallet.DelStatisticsLogs(ctx)
}
func (s sWallet) Update(ctx context.Context, data *v1.UpdateWalletReq) error {
	return logic.Wallet.Update(ctx, data)
}
func (s sWallet) UpdatePassByAdmin(ctx context.Context, pass string, uid uint64) error {
	return logic.Wallet.UpdatePassByAdmin(ctx, pass, uid)
}
func (s sWallet) UpdatePass(ctx context.Context, req *v1.WalletUpdatePassReq, uid uint64) error {
	return logic.Wallet.UpdatePass(ctx, req.OldPass, req.NewPass, uid)
}
func (s sWallet) UpdateSetPass(ctx context.Context, req *v1.WalletSetPassReq, uid uint64) error {
	return logic.Wallet.UpdateSetPass(ctx, req.Pass, uid)
}

func (s sWallet) UpdatePassForBackend(ctx context.Context, id uint64, pass string) error {
	return logic.Wallet.UpdatePassByAdmin(ctx, pass, id)
}

func (s sWallet) UpdateByAdmin(ctx context.Context, req *v1.UpdateWalletByAdminReq) error {
	return logic.Wallet.UpdateByAdmin(ctx, req)
}

// --- WalletChangeType -----------------------------------------------------------------

type sWalletChangeType struct{}

func (s sWalletChangeType) Add(ctx context.Context, in *entity.WalletChangeType) error {
	return logic.WalletChangeType.AddWalletChangeType(ctx, in)
}
func (s sWalletChangeType) GetById(ctx context.Context, id uint64) (*entity.WalletChangeType, error) {
	return logic.WalletChangeType.GetById(ctx, id)
}
func (s sWalletChangeType) List(ctx context.Context, req *v1.ListWalletChangeTypeReq) ([]*entity.WalletChangeType, *v1.PageRes, error) {
	menu, total, err := logic.WalletChangeType.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWalletChangeType) ListOptions(ctx context.Context) ([]*v1.ListWalletChangeTypeOptionsRes, error) {
	return logic.WalletChangeType.ListOptions(ctx)
}
func (s sWalletChangeType) Del(ctx context.Context, id uint64) error {
	return logic.WalletChangeType.Del(ctx, id)
}
func (s sWalletChangeType) Update(ctx context.Context, data *v1.UpdateWalletChangeTypeReq) error {
	return logic.WalletChangeType.Update(ctx, data)
}

// --- WalletChangeLog -----------------------------------------------------------------

type sWalletChangeLog struct{}

func (s sWalletChangeLog) Add(ctx context.Context, in *do.WalletChangeLog) error {
	return logic.WalletChangeLog.Add(ctx, in)
}
func (s sWalletChangeLog) GetById(ctx context.Context, id uint64) (*entity.WalletChangeLog, error) {
	return logic.WalletChangeLog.GetById(ctx, id)
}
func (s sWalletChangeLog) List(ctx context.Context, req *v1.ListWalletChangeLogReq) ([]*model.WalletChangeLog, *v1.PageRes, error) {
	menu, total, err := logic.WalletChangeLog.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWalletChangeLog) Del(ctx context.Context, id uint64) error {
	return logic.WalletChangeLog.Del(ctx, id)
}
func (s sWalletChangeLog) Update(ctx context.Context, data *v1.UpdateWalletChangeLogReq) error {
	return logic.WalletChangeLog.Update(ctx, data)
}

// --- WalletStatisticsLog -----------------------------------------------------------------

type sWalletStatisticsLog struct{}

func (s sWalletStatisticsLog) Add(ctx context.Context, in *do.WalletStatisticsLog) error {
	return logic.WalletStatisticsLog.Add(ctx, in)
}
func (s sWalletStatisticsLog) GetById(ctx context.Context, id uint64) (*entity.WalletStatisticsLog, error) {
	return logic.WalletStatisticsLog.GetById(ctx, id)
}
func (s sWalletStatisticsLog) GetReport(ctx context.Context, uname string, begin string, end string) (*v1.GetReportRes, error) {
	return logic.WalletStatisticsLog.GetReport(ctx, uname, begin, end)
}
func (s sWalletStatisticsLog) List(ctx context.Context, req *v1.ListWalletStatisticsLogReq) ([]*model.WalletStatisticsLog, *v1.PageRes, error) {
	menu, total, err := logic.WalletStatisticsLog.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWalletStatisticsLog) Del(ctx context.Context, id uint64) error {
	return logic.WalletStatisticsLog.Del(ctx, id)
}
func (s sWalletStatisticsLog) Update(ctx context.Context, data *v1.UpdateWalletStatisticsLogReq) error {
	return logic.WalletStatisticsLog.Update(ctx, data)
}

// --- WalletTopUpApplication -----------------------------------------------------------------
type sWalletTopUpApplication struct{}

func (s sWalletTopUpApplication) Add(ctx context.Context, in *do.WalletTopUpApplication) error {
	return logic.WalletTopUpApplication.Add(ctx, in)
}
func (s sWalletTopUpApplication) GetById(ctx context.Context, id uint64) (*entity.WalletTopUpApplication, error) {
	return logic.WalletTopUpApplication.GetById(ctx, id)
}
func (s sWalletTopUpApplication) List(ctx context.Context, req *v1.ListWalletTopUpApplicationReq) ([]*model.WalletTopUpApplication, *v1.PageRes, error) {
	menu, total, err := logic.WalletTopUpApplication.List(ctx, req)
	if err != nil {
		return nil, nil, err
	}
	return menu, Common.GetPageInfo(req.Page, req.Size, int64(total)), nil
}
func (s sWalletTopUpApplication) Del(ctx context.Context, id uint64) error {
	return logic.WalletTopUpApplication.Del(ctx, id)
}
func (s sWalletTopUpApplication) Update(ctx context.Context, data *v1.UpdateWalletTopUpApplicationReq) error {
	return logic.WalletTopUpApplication.Update(ctx, data)
}
func (s sWalletTopUpApplication) UpdateByAdmin(ctx context.Context, id uint64, t int) error {
	return logic.WalletTopUpApplication.UpdateByAdmin(ctx, id, t)
}
