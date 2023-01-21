package controller

import (
	"context"
	"freekey-backend/api/v1"
	"freekey-backend/internal/consts"
	"freekey-backend/internal/model"
	"freekey-backend/internal/service"
	"freekey-backend/utility/utils/res"
	"freekey-backend/utility/utils/xcaptcha"
	"github.com/gogf/gf/v2/net/ghttp"
	captcha "github.com/mojocn/base64Captcha"
)

type cBase struct {
	Table   string
	ReqPath string
	FileDir string
	DBGroup string
}

var (
	Menu                   = sMenu{}
	Api                    = sApi{}
	Role                   = sRole{}
	RoleMenu               = sRoleMenu{}
	RoleApi                = sRoleApi{}
	Admin                  = cAdmin{}
	Dict                   = cDict{}
	File                   = cFile{}
	OperationLog           = cOperationLog{}
	AdminLoginLog          = cAdminLoginLog{}
	Banner                 = cBanner{}
	Sys                    = cSys{}
	User                   = cUser{}
	UserLoginLog           = cUserLoginLog{}
	Wallet                 = cWallet{}
	WalletChangeType       = cWalletChangeType{}
	WalletChangeLog        = cWalletChangeLog{}
	WalletStatisticsLog    = cWalletStatisticsLog{}
	WalletTopUpApplication = cWalletTopUpApplication{}
)

type sMenu struct{}

func (s sMenu) GetById(ctx context.Context, req *v1.GetMenuReq) (res *v1.GetMenuRes, err error) {
	data, err := service.Menu.GetMenuById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetMenuRes{Data: data}, nil
}
func (s sMenu) List(ctx context.Context, req *v1.ListMenuReq) (res *v1.ListMenuRes, err error) {
	Menu, pageRes, err := service.Menu.ListMenu(ctx, req)
	return &v1.ListMenuRes{List: Menu, PageRes: pageRes}, nil
}
func (s sMenu) Add(ctx context.Context, req *v1.AddMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.Menu.AddMenu(ctx, req.Menu); err != nil {
		return nil, err
	}
	return
}
func (s sMenu) Del(ctx context.Context, req *v1.DelMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.Menu.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (s sMenu) Update(ctx context.Context, req *v1.UpdateMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.Menu.UpdateMenu(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (s sMenu) Sort(ctx context.Context, req *v1.MenuSortReq) (res *v1.DefaultRes, err error) {
	if err = service.System.UpdateMenuSort(ctx, req.Sort, req.Id); err != nil {
		return nil, err
	}
	return
}

type sApi struct{}

func (s sApi) GetById(ctx context.Context, req *v1.GetApiReq) (res *v1.GetApiRes, err error) {
	data, err := service.Api.GetApiById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetApiRes{Data: data}, nil
}
func (s sApi) List(ctx context.Context, req *v1.ListApiReq) (res *v1.ListApiRes, err error) {
	Api, pageRes, err := service.Api.List(ctx, req)
	return &v1.ListApiRes{List: Api, PageRes: pageRes}, nil
}
func (s sApi) Add(ctx context.Context, req *v1.AddApiReq) (res *v1.DefaultRes, err error) {
	if err = service.Api.AddApi(ctx, req.Api); err != nil {
		return nil, err
	}
	return
}
func (s sApi) AddGroup(ctx context.Context, req *v1.AddApiGroupReq) (res *v1.AddApiGroupRes, err error) {
	count, err := service.Api.AddGroup(ctx, req.Group, req.Url)
	if err != nil {
		return nil, err
	}
	return &v1.AddApiGroupRes{Count: count}, nil
}
func (s sApi) Del(ctx context.Context, req *v1.DelApiReq) (res *v1.DefaultRes, err error) {
	if err = service.Api.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (s sApi) Update(ctx context.Context, req *v1.UpdateApiReq) (res *v1.DefaultRes, err error) {
	if err = service.Api.UpdateApi(ctx, req); err != nil {
		return nil, err
	}
	return
}

type sRole struct{}

func (s sRole) GetById(ctx context.Context, req *v1.GetRoleReq) (res *v1.GetRoleRes, err error) {
	data, err := service.Role.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetRoleRes{Data: data}, nil
}
func (s sRole) List(ctx context.Context, req *v1.ListRoleReq) (res *v1.ListRoleRes, err error) {
	Role, pageRes, err := service.Role.List(ctx, req)
	return &v1.ListRoleRes{List: Role, PageRes: pageRes}, nil
}
func (s sRole) Add(ctx context.Context, req *v1.AddRoleReq) (res *v1.DefaultRes, err error) {
	if err = service.Role.Add(ctx, req.Role); err != nil {
		return nil, err
	}
	return
}
func (s sRole) Del(ctx context.Context, req *v1.DelRoleReq) (res *v1.DefaultRes, err error) {
	if err = service.Role.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (s sRole) Update(ctx context.Context, req *v1.UpdateRoleReq) (res *v1.DefaultRes, err error) {
	if err = service.Role.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

func (s sRole) GetOptions(ctx context.Context, _ *v1.GetRoleOptionsReq) (res *v1.GetRoleOptionsRes, err error) {
	options, err := service.Role.GetOptions(ctx)
	if err != nil {
		return nil, err
	}
	return &v1.GetRoleOptionsRes{options}, err
}

// --- RoleMenu -----------------------------------------------------------------

type sRoleMenu struct{}

func (s sRoleMenu) GetById(ctx context.Context, req *v1.GetRoleMenuReq) (res *v1.GetRoleMenuRes, err error) {
	data, err := service.RoleMenu.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetRoleMenuRes{Data: data}, nil
}
func (s sRoleMenu) List(ctx context.Context, req *v1.ListRoleMenuReq) (res *v1.ListRoleMenuRes, err error) {
	RoleMenu, pageRes, err := service.RoleMenu.List(ctx, req)
	return &v1.ListRoleMenuRes{List: RoleMenu, PageRes: pageRes}, nil
}
func (s sRoleMenu) ListRoleNoMenus(ctx context.Context, req *v1.ListRoleNoMenusReq) (res []*v1.ListRoleNoMenusRes, err error) {
	return service.RoleMenu.ListRoleNoMenus(ctx, req.Rid)
}
func (s sRoleMenu) Add(ctx context.Context, req *v1.AddRoleMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleMenu.Add(ctx, req.RoleMenu); err != nil {
		return nil, err
	}
	return
}
func (s sRoleMenu) Del(ctx context.Context, req *v1.DelRoleMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleMenu.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (s sRoleMenu) DelClear(ctx context.Context, req *v1.DelClearRoleMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleMenu.DelClear(ctx, req.Rid); err != nil {
		return nil, err
	}
	return
}
func (s sRoleMenu) Update(ctx context.Context, req *v1.UpdateRoleMenuReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleMenu.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (s sRoleMenu) AddRoleMenus(ctx context.Context, req *v1.AddRoleMenusReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleMenu.AddMenus(ctx, req.Rid, req.Mids); err != nil {
		return nil, err
	}
	return
}

// --- RoleApi -----------------------------------------------------------------

type sRoleApi struct{}

func (s sRoleApi) GetById(ctx context.Context, req *v1.GetRoleApiReq) (res *v1.GetRoleApiRes, err error) {
	data, err := service.RoleApi.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetRoleApiRes{Data: data}, nil
}
func (s sRoleApi) List(ctx context.Context, req *v1.ListRoleApiReq) (res *v1.ListRoleApiRes, err error) {
	RoleApi, pageRes, err := service.RoleApi.List(ctx, req)
	return &v1.ListRoleApiRes{List: RoleApi, PageRes: pageRes}, nil
}
func (s sRoleApi) ListRoleNoApis(ctx context.Context, req *v1.ListRoleNoApisReq) (res []*v1.ListRoleNoApisRes, err error) {
	return service.RoleApi.ListRoleNoApis(ctx, req.Rid)
}
func (s sRoleApi) Add(ctx context.Context, req *v1.AddRoleApiReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleApi.Add(ctx, req.RoleApi); err != nil {
		return nil, err
	}
	return
}
func (s sRoleApi) AddRoleApis(ctx context.Context, req *v1.AddRoleApisReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleApi.AddRoleApis(ctx, req.Rid, req.Apis); err != nil {
		return nil, err
	}
	return
}
func (s sRoleApi) Del(ctx context.Context, req *v1.DelRoleApiReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleApi.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (s sRoleApi) DelClear(ctx context.Context, req *v1.DelRoleApiClearReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleApi.DelClear(ctx, req.Rid); err != nil {
		return nil, err
	}
	return
}
func (s sRoleApi) Update(ctx context.Context, req *v1.UpdateRoleApiReq) (res *v1.DefaultRes, err error) {
	if err = service.RoleApi.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

type cSys struct{}

func (c cSys) UploadImg(ctx context.Context, req *v1.UploadFileReq) (res *v1.UploadFileRes, err error) {
	return service.File.Upload(ctx, req.Group)
}
func (c cSys) GetDictByKey(ctx context.Context, req *v1.DictReq) (res *v1.DictRes, err error) {
	data, err := service.Dict.GetByKey(ctx, req.Key)
	if err != nil {
		return nil, err
	}
	return &v1.DictRes{Value: data}, nil
}
func (c cSys) ListAllDict(ctx context.Context, _ *v1.AllDictReq) (res v1.AllDictRes, err error) {
	allDict, err := service.System.ListAllDict(ctx)
	if err != nil {
		return nil, err
	}
	res = allDict
	return
}

// --- Admin-----------------------------------------------------------------

type cAdmin struct{}

func (c cAdmin) Add(ctx context.Context, req *v1.AddAdminReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.Add(ctx, req.Admin); err != nil {
		return nil, err
	}
	return
}
func (c cAdmin) GetCaptcha(_ context.Context, req *v1.CaptchaReq) (res *v1.CaptchaRes, err error) {
	var driver = xcaptcha.NewDriver().ConvertFonts()
	cc := captcha.NewCaptcha(driver, xcaptcha.Store)
	_, content, answer := cc.Driver.GenerateIdQuestionAnswer()
	item, _ := cc.Driver.DrawCaptcha(content)
	_ = cc.Store.Set(req.Id, answer)
	return &v1.CaptchaRes{Img: item.EncodeB64string()}, nil
}
func (c cAdmin) Login(ctx context.Context, req *v1.AdminLoginReq) (res *v1.AdminLoginRes, err error) {
	token, err := service.Admin.Login(ctx, req)
	if err != nil {
		return nil, err
	}
	return &v1.AdminLoginRes{Token: token}, nil
}
func (c cAdmin) GetInfo(ctx context.Context, _ *v1.AdminInfoReq) (res *v1.AdminInfoRes, err error) {
	info, err := service.Admin.GetInfo(ctx)
	if err != nil {
		return nil, err
	}
	return &v1.AdminInfoRes{Info: info, Menus: info.Menus}, nil
}
func (c cAdmin) GetMenu(ctx context.Context, req *v1.GetMenuReqByPathReq) (res *v1.GetMenuRes, err error) {
	menu, err := service.Admin.GetMenu(ctx, req.Path)
	if err != nil {
		return nil, err
	}
	return &v1.GetMenuRes{Data: menu}, nil
}
func (c cAdmin) GetById(ctx context.Context, req *v1.GetAdminReq) (res *v1.GetAdminRes, err error) {
	data, err := service.Admin.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetAdminRes{Data: data}, nil
}
func (c cAdmin) List(ctx context.Context, req *v1.ListAdminReq) (res *v1.ListAdminRes, err error) {
	Admin, pageRes, err := service.Admin.List(ctx, req)
	return &v1.ListAdminRes{List: Admin, PageRes: pageRes}, nil
}
func (c cAdmin) Del(ctx context.Context, req *v1.DelAdminReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cAdmin) Update(ctx context.Context, req *v1.UpdateAdminReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cAdmin) UpdateUname(ctx context.Context, req *v1.UpdateAdminUnameReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.UpdateUname(ctx, req.Id, req.Uname); err != nil {
		return nil, err
	}
	return
}
func (c cAdmin) UpdatePass(ctx context.Context, req *v1.UpdateAdminPassReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.UpdatePwdWithoutOld(ctx, req.Id, req.Pass); err != nil {
		return nil, err
	}
	return
}
func (c cAdmin) UpdateSelfPass(ctx context.Context, req *v1.UpdateAdminPassSelfReq) (res *v1.DefaultRes, err error) {
	if err = service.Admin.UpdateAdminPassSelf(ctx, req.Pass); err != nil {
		return nil, err
	}
	return
}

func (c cAdmin) GetWs(r *ghttp.Request) {
	service.Ws.GetAdminWs(r)
}

func (c cAdmin) SendMsg(r *ghttp.Request) {

	var (
		ctx = r.Context()
		d   model.AdminMsg
	)
	if err := r.Parse(&d); err != nil {
		res.Err(err, r)
	}
	if err := service.Admin.SendMsg(ctx, &d); err != nil {
		res.Err(err, r)
	}
	res.Ok(r)
}

func (c cAdmin) NoticeAdmins(r *ghttp.Request) {
	var (
		ctx = r.Context()
		d   model.AdminMsg
	)
	if err := r.Parse(&d); err != nil {
		res.Err(err, r)
	}
	if err := service.Admin.NoticeAdmins(ctx, &d); err != nil {
		res.Err(err, r)
	}
	res.Ok(r)
}

// --- Dict-----------------------------------------------------------------

type cDict struct{}

func (c cDict) GetById(ctx context.Context, req *v1.GetDictReq) (res *v1.GetDictRes, err error) {
	data, err := service.Dict.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetDictRes{Data: data}, nil
}
func (c cDict) List(ctx context.Context, req *v1.ListDictReq) (res *v1.ListDictRes, err error) {
	Dict, pageRes, err := service.Dict.List(ctx, req)
	return &v1.ListDictRes{List: Dict, PageRes: pageRes}, nil
}
func (c cDict) Add(ctx context.Context, req *v1.AddDictReq) (res *v1.DefaultRes, err error) {
	if err = service.Dict.Add(ctx, req.Dict); err != nil {
		return nil, err
	}
	return
}
func (c cDict) Del(ctx context.Context, req *v1.DelDictReq) (res *v1.DefaultRes, err error) {
	if err = service.Dict.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cDict) Update(ctx context.Context, req *v1.UpdateDictReq) (res *v1.DefaultRes, err error) {
	if err = service.Dict.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- File-----------------------------------------------------------------

type cFile struct{}

func (c cFile) GetById(ctx context.Context, req *v1.GetFileReq) (res *v1.GetFileRes, err error) {
	data, err := service.File.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetFileRes{Data: data}, nil
}
func (c cFile) List(ctx context.Context, req *v1.ListFileReq) (res *v1.ListFileRes, err error) {
	File, pageRes, err := service.File.List(ctx, req)
	return &v1.ListFileRes{List: File, PageRes: pageRes}, nil
}
func (c cFile) Add(ctx context.Context, req *v1.AddFileReq) (res *v1.DefaultRes, err error) {
	if err = service.File.Add(ctx, req.File); err != nil {
		return nil, err
	}
	return
}
func (c cFile) Del(ctx context.Context, req *v1.DelFileReq) (res *v1.DefaultRes, err error) {
	if err = service.File.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cFile) Update(ctx context.Context, req *v1.UpdateFileReq) (res *v1.DefaultRes, err error) {
	if err = service.File.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cFile) Upload(ctx context.Context, _ *v1.UploadFileReq) (res *v1.UploadFilesRes, err error) {
	return service.File.Uploads(ctx)
}

// --- OperationLog-----------------------------------------------------------------

type cOperationLog struct{}

func (c cOperationLog) GetById(ctx context.Context, req *v1.GetOperationLogReq) (res *v1.GetOperationLogRes, err error) {
	data, err := service.OperationLog.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetOperationLogRes{Data: data}, nil
}
func (c cOperationLog) List(ctx context.Context, req *v1.ListOperationLogReq) (res *v1.ListOperationLogRes, err error) {
	OperationLog, pageRes, err := service.OperationLog.List(ctx, req)
	return &v1.ListOperationLogRes{List: OperationLog, PageRes: pageRes}, nil
}
func (c cOperationLog) Add(ctx context.Context, req *v1.AddOperationLogReq) (res *v1.DefaultRes, err error) {
	if err = service.OperationLog.Add(ctx, req.OperationLog); err != nil {
		return nil, err
	}
	return
}
func (c cOperationLog) Del(ctx context.Context, req *v1.DelOperationLogReq) (res *v1.DefaultRes, err error) {
	if err = service.OperationLog.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cOperationLog) DelClear(ctx context.Context, _ *v1.DelClearOperationLogReq) (res *v1.DefaultRes, err error) {
	if err = service.OperationLog.DelClear(ctx); err != nil {
		return nil, err
	}
	return
}
func (c cOperationLog) Update(ctx context.Context, req *v1.UpdateOperationLogReq) (res *v1.DefaultRes, err error) {
	if err = service.OperationLog.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- AdminLoginLog-----------------------------------------------------------------

type cAdminLoginLog struct{}

func (c cAdminLoginLog) GetById(ctx context.Context, req *v1.GetAdminLoginLogReq) (res *v1.GetAdminLoginLogRes, err error) {
	data, err := service.AdminLoginLog.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetAdminLoginLogRes{Data: data}, nil
}
func (c cAdminLoginLog) List(ctx context.Context, req *v1.ListAdminLoginLogReq) (res *v1.ListAdminLoginLogRes, err error) {
	AdminLoginLog, pageRes, err := service.AdminLoginLog.List(ctx, req)
	return &v1.ListAdminLoginLogRes{List: AdminLoginLog, PageRes: pageRes}, nil
}
func (c cAdminLoginLog) Add(ctx context.Context, req *v1.AddAdminLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.AdminLoginLog.Add(ctx, req.AdminLoginLog); err != nil {
		return nil, err
	}
	return
}
func (c cAdminLoginLog) Del(ctx context.Context, req *v1.DelAdminLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.AdminLoginLog.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}

func (c cAdminLoginLog) DelClear(ctx context.Context, _ *v1.DelClearAdminLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.AdminLoginLog.DelClear(ctx); err != nil {
		return nil, err
	}
	return
}
func (c cAdminLoginLog) Update(ctx context.Context, req *v1.UpdateAdminLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.AdminLoginLog.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- Banner-----------------------------------------------------------------
type cBanner struct{ cBase }

func (c cBanner) Add(ctx context.Context, req *v1.AddBannerReq) (res *v1.DefaultRes, err error) {
	if err = service.Banner.Add(ctx, req.Banner); err != nil {
		return nil, err
	}
	return
}
func (c cBanner) GetById(ctx context.Context, req *v1.GetBannerReq) (res *v1.GetBannerRes, err error) {
	data, err := service.Banner.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetBannerRes{Data: data}, nil
}
func (c cBanner) List(ctx context.Context, _ *v1.BannersReq) (res []*v1.BannerRes, err error) {
	return service.System.ListBanners(ctx)
}
func (c cBanner) ListForBackend(ctx context.Context, req *v1.ListBannerReq) (res *v1.ListBannerRes, err error) {
	Banner, pageRes, err := service.Banner.List(ctx, req)
	return &v1.ListBannerRes{List: Banner, PageRes: pageRes}, nil
}
func (c cBanner) Del(ctx context.Context, req *v1.DelBannerReq) (res *v1.DefaultRes, err error) {
	if err = service.Banner.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cBanner) Update(ctx context.Context, req *v1.UpdateBannerReq) (res *v1.DefaultRes, err error) {
	if err = service.Banner.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- User-----------------------------------------------------------------

type cUser struct{ cBase }

func (c cUser) Add(ctx context.Context, req *v1.AddUserReq) (res *v1.DefaultRes, err error) {
	if err = service.User.Add(ctx, req.User); err != nil {
		return nil, err
	}
	return
}
func (c cUser) Register(ctx context.Context, req *v1.RegisterReq) (*v1.LoginRes, error) {
	if len(req.Uname) < 3 || len(req.Uname) > 12 {
		return nil, consts.ErrUnameFormat
	}
	return service.User.Register(ctx, req)
}
func (c cUser) Login(ctx context.Context, req *v1.LoginReq) (*v1.LoginRes, error) {
	return service.User.Login(ctx, req)
}

func (c cUser) GetById(ctx context.Context, req *v1.GetUserReq) (res *v1.GetUserRes, err error) {
	data, err := service.User.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetUserRes{Data: data}, nil
}
func (c cUser) Info(ctx context.Context, _ *v1.UserInfoReq) (*v1.LoginRes, error) {
	return service.User.GetUserInfo(ctx)
}
func (c cUser) List(ctx context.Context, req *v1.ListUserReq) (res *v1.ListUserRes, err error) {
	User, pageRes, err := service.User.List(ctx, req)
	return &v1.ListUserRes{List: User, PageRes: pageRes}, nil
}
func (c cUser) Icons(ctx context.Context, _ *v1.IconsReq) (res *v1.IconsRes, err error) {
	icons, err := service.User.ListIcons(ctx)
	if err != nil {
		return nil, err
	}
	res = &v1.IconsRes{Icons: icons, ImgPrefix: consts.ImgPrefix}
	return
}

func (c cUser) Del(ctx context.Context, req *v1.DelUserReq) (res *v1.DefaultRes, err error) {
	if err = service.User.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}

func (c cUser) Update(ctx context.Context, req *v1.UpdateUserReq) (res *v1.DefaultRes, err error) {
	if err = service.User.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cUser) UpdateUname(ctx context.Context, req *v1.UpdateUnameReq) (res *v1.DefaultRes, err error) {
	if err = service.User.UpdateUname(ctx, req.Uname, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cUser) UpdatePassForBackend(ctx context.Context, req *v1.UpdatePassForBackendReq) (res *v1.DefaultRes, err error) {
	if err = service.User.UpdatePassByAdmin(ctx, req.Pass, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cUser) UpdatePassByUser(ctx context.Context, req *v1.UpdatePassReq) (res *v1.DefaultRes, err error) {
	if err := service.User.UpdatePassByUser(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cUser) UpdateNickname(ctx context.Context, req *v1.UpdateNicknameReq) (res *v1.DefaultRes, err error) {
	if err := service.User.UpdateNickname(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cUser) UpdateIcon(ctx context.Context, req *v1.UpdateIconReq) (res *v1.DefaultRes, err error) {
	if err = service.User.UpdateIcon(ctx, req.Icon); err != nil {
		return nil, err
	}
	return
}

// --- UserLoginLog-----------------------------------------------------------------

type cUserLoginLog struct{}

func (c cUserLoginLog) GetById(ctx context.Context, req *v1.GetUserLoginLogReq) (res *v1.GetUserLoginLogRes, err error) {
	data, err := service.UserLoginLog.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetUserLoginLogRes{Data: data}, nil
}
func (c cUserLoginLog) List(ctx context.Context, req *v1.ListUserLoginLogReq) (res *v1.ListUserLoginLogRes, err error) {
	UserLoginLog, pageRes, err := service.UserLoginLog.List(ctx, req)
	return &v1.ListUserLoginLogRes{List: UserLoginLog, PageRes: pageRes}, nil
}
func (c cUserLoginLog) Add(ctx context.Context, req *v1.AddUserLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.UserLoginLog.Add(ctx, req.UserLoginLog); err != nil {
		return nil, err
	}
	return
}
func (c cUserLoginLog) Del(ctx context.Context, req *v1.DelUserLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.UserLoginLog.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cUserLoginLog) Update(ctx context.Context, req *v1.UpdateUserLoginLogReq) (res *v1.DefaultRes, err error) {
	if err = service.UserLoginLog.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

func (c cUserLoginLog) DelClear(ctx context.Context, _ *v1.DelClearUserLoginLogsReq) (res *v1.DefaultRes, err error) {
	if err = service.UserLoginLog.DelClear(ctx); err != nil {
		return nil, err
	}
	return
}

// --- Wallet-----------------------------------------------------------------

type cWallet struct{}

func (c cWallet) Add(ctx context.Context, req *v1.AddWalletReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.Add(ctx, req.Wallet); err != nil {
		return nil, err
	}
	return
}

func (c cWallet) TopUpCategory(ctx context.Context, _ *v1.TopUpCategoryReq) (res []*v1.TopUpCategoryRes, err error) {
	return service.Wallet.ListTopUpCategory(ctx)
}
func (c cWallet) CreateTopUp(ctx context.Context, req *v1.CreateTopUpReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.AddTopUp(ctx, req, service.User.GetUidFromCtx(ctx)); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) GetById(ctx context.Context, req *v1.GetWalletReq) (res *v1.GetWalletRes, err error) {
	data, err := service.Wallet.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetWalletRes{Data: data}, nil
}
func (c cWallet) GetInfo(ctx context.Context, _ *v1.WalletInfoReq) (res *v1.WalletInfoRes, err error) {
	return service.Wallet.GetInfo(ctx)
}
func (c cWallet) List(ctx context.Context, req *v1.ListWalletReq) (res *v1.ListWalletRes, err error) {
	Wallet, pageRes, err := service.Wallet.List(ctx, req)
	return &v1.ListWalletRes{List: Wallet, PageRes: pageRes}, nil
}
func (c cWallet) ListTopUp(ctx context.Context, req *v1.ListTopUpReq) (res *v1.ListTopUpRes, err error) {
	items, page, err := service.Wallet.ListTopUp(ctx, req)
	if err != nil {
		return nil, err
	}
	res = &v1.ListTopUpRes{
		PageRes: page,
		Items:   items,
	}
	return
}
func (c cWallet) ListChangeTypes(ctx context.Context, _ *v1.ListChangeTypesReq) (res []*v1.ListChangeTypesRes, err error) {
	return service.Wallet.ListChangeTypes(ctx)
}
func (c cWallet) ListChangeLogs(ctx context.Context, req *v1.ListChangeLogReq) (res *v1.ListChangeLogRes, err error) {
	items, pageRes, err := service.Wallet.ListChangeLogs(ctx, req)
	if err != nil {
		return nil, err
	}
	res = &v1.ListChangeLogRes{
		PageRes: pageRes,
		Items:   items,
	}
	return
}
func (c cWallet) Del(ctx context.Context, req *v1.DelWalletReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) Update(ctx context.Context, req *v1.UpdateWalletReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) SetPass(ctx context.Context, req *v1.WalletSetPassReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.UpdateSetPass(ctx, req, service.User.GetUidFromCtx(ctx)); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) UpdatePass(ctx context.Context, req *v1.WalletUpdatePassReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.UpdatePass(ctx, req, service.User.GetUidFromCtx(ctx)); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) UpdatePassForBackend(ctx context.Context, req *v1.UpdatePassForBackendReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.UpdatePassForBackend(ctx, req.Id, req.Pass); err != nil {
		return nil, err
	}
	return
}
func (c cWallet) UpdateByAdmin(ctx context.Context, req *v1.UpdateWalletByAdminReq) (res *v1.DefaultRes, err error) {
	if err = service.Wallet.UpdateByAdmin(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- WalletChangeType-----------------------------------------------------------------

type cWalletChangeType struct{}

func (c cWalletChangeType) GetById(ctx context.Context, req *v1.GetWalletChangeTypeReq) (res *v1.GetWalletChangeTypeRes, err error) {
	data, err := service.WalletChangeType.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetWalletChangeTypeRes{Data: data}, nil
}
func (c cWalletChangeType) List(ctx context.Context, req *v1.ListWalletChangeTypeReq) (res *v1.ListWalletChangeTypeRes, err error) {
	WalletChangeType, pageRes, err := service.WalletChangeType.List(ctx, req)
	return &v1.ListWalletChangeTypeRes{List: WalletChangeType, PageRes: pageRes}, nil
}
func (c cWalletChangeType) ListOptions(ctx context.Context, _ *v1.ListWalletChangeTypeOptionsReq) (res []*v1.ListWalletChangeTypeOptionsRes, err error) {
	return service.WalletChangeType.ListOptions(ctx)
}
func (c cWalletChangeType) Add(ctx context.Context, req *v1.AddWalletChangeTypeReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeType.Add(ctx, req.WalletChangeType); err != nil {
		return nil, err
	}
	return
}
func (c cWalletChangeType) Del(ctx context.Context, req *v1.DelWalletChangeTypeReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeType.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cWalletChangeType) Update(ctx context.Context, req *v1.UpdateWalletChangeTypeReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeType.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- WalletChangeLog-----------------------------------------------------------------

type cWalletChangeLog struct{}

func (c cWalletChangeLog) GetById(ctx context.Context, req *v1.GetWalletChangeLogReq) (res *v1.GetWalletChangeLogRes, err error) {
	data, err := service.WalletChangeLog.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetWalletChangeLogRes{Data: data}, nil
}
func (c cWalletChangeLog) List(ctx context.Context, req *v1.ListWalletChangeLogReq) (res *v1.ListWalletChangeLogRes, err error) {
	WalletChangeLog, pageRes, err := service.WalletChangeLog.List(ctx, req)
	return &v1.ListWalletChangeLogRes{List: WalletChangeLog, PageRes: pageRes}, nil
}
func (c cWalletChangeLog) Add(ctx context.Context, req *v1.AddWalletChangeLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeLog.Add(ctx, req.WalletChangeLog); err != nil {
		return nil, err
	}
	return
}
func (c cWalletChangeLog) Del(ctx context.Context, req *v1.DelWalletChangeLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeLog.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cWalletChangeLog) Update(ctx context.Context, req *v1.UpdateWalletChangeLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletChangeLog.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- WalletStatisticsLog-----------------------------------------------------------------

type cWalletStatisticsLog struct{}

func (c cWalletStatisticsLog) GetById(ctx context.Context, req *v1.GetWalletStatisticsLogReq) (res *v1.GetWalletStatisticsLogRes, err error) {
	data, err := service.WalletStatisticsLog.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetWalletStatisticsLogRes{Data: data}, nil
}
func (c cWalletStatisticsLog) List(ctx context.Context, req *v1.ListWalletStatisticsLogReq) (res *v1.ListWalletStatisticsLogRes, err error) {
	WalletStatisticsLog, pageRes, err := service.WalletStatisticsLog.List(ctx, req)
	return &v1.ListWalletStatisticsLogRes{List: WalletStatisticsLog, PageRes: pageRes}, nil
}
func (c cWalletStatisticsLog) Add(ctx context.Context, req *v1.AddWalletStatisticsLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletStatisticsLog.Add(ctx, req.WalletStatisticsLog); err != nil {
		return nil, err
	}
	return
}
func (c cWalletStatisticsLog) Del(ctx context.Context, req *v1.DelWalletStatisticsLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletStatisticsLog.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cWalletStatisticsLog) Update(ctx context.Context, req *v1.UpdateWalletStatisticsLogReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletStatisticsLog.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

// --- WalletTopUpApplication-----------------------------------------------------------------

type cWalletTopUpApplication struct{}

func (c cWalletTopUpApplication) GetById(ctx context.Context, req *v1.GetWalletTopUpApplicationReq) (res *v1.GetWalletTopUpApplicationRes, err error) {
	data, err := service.WalletTopUpApplication.GetById(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &v1.GetWalletTopUpApplicationRes{Data: data}, nil
}
func (c cWalletTopUpApplication) List(ctx context.Context, req *v1.ListWalletTopUpApplicationReq) (res *v1.ListWalletTopUpApplicationRes, err error) {
	WalletTopUpApplication, pageRes, err := service.WalletTopUpApplication.List(ctx, req)
	return &v1.ListWalletTopUpApplicationRes{List: WalletTopUpApplication, PageRes: pageRes}, nil
}
func (c cWalletTopUpApplication) Add(ctx context.Context, req *v1.AddWalletTopUpApplicationReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletTopUpApplication.Add(ctx, req.WalletTopUpApplication); err != nil {
		return nil, err
	}
	return
}
func (c cWalletTopUpApplication) Del(ctx context.Context, req *v1.DelWalletTopUpApplicationReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletTopUpApplication.Del(ctx, req.Id); err != nil {
		return nil, err
	}
	return
}
func (c cWalletTopUpApplication) Update(ctx context.Context, req *v1.UpdateWalletTopUpApplicationReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletTopUpApplication.Update(ctx, req); err != nil {
		return nil, err
	}
	return
}

func (c cWalletTopUpApplication) UpdateByAdmin(ctx context.Context, req *v1.UpdateWalletTopUpApplicationByAdminReq) (res *v1.DefaultRes, err error) {
	if err = service.WalletTopUpApplication.UpdateByAdmin(ctx, req.Id, req.Type); err != nil {
		return nil, err
	}
	return
}

func (c cWalletTopUpApplication) GetReport(ctx context.Context, req *v1.GetReportReq) (res *v1.GetReportRes, err error) {
	return service.WalletStatisticsLog.GetReport(ctx, req.Uname, req.Begin, req.End)
}
