package v1

import (
	"freekey-backend/internal/model"
	"freekey-backend/internal/model/do"
	"freekey-backend/internal/model/entity"
	"github.com/gogf/gf/v2/frame/g"
)

type CaptchaReq struct {
	g.Meta `tags:"后台" dc:"获取验证码"`
	Id     string `v:"required" in:"query" dc:"随机验证码ID" `
}
type CaptchaRes struct {
	Img string `json:"img" dc:"图片 (base64)"`
}
type GetMenuReqByPathReq struct {
	g.Meta `tags:"后台" dc:"获取默认菜单"`
	Path   string `v:"required" dc:"查询路径"`
	Authorization
}
type MenuSortReq struct {
	g.Meta `tags:"后台-菜单" dc:"菜单排序"`
	Sort   int    `v:"required" dc:"排序的数字"`
	Id     uint64 `v:"required" dc:"一级菜单ID"`
}

// AddMenuReq 添加
type AddMenuReq struct {
	g.Meta `tags:"后台菜单" dc:"添加"`
	*entity.Menu
}

// GetMenuReq 获取
type GetMenuReq struct {
	g.Meta `tags:"后台菜单" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetMenuRes struct {
	Data *entity.Menu `json:"data"`
}

// ListMenuReq 集合
type ListMenuReq struct {
	g.Meta `tags:"后台菜单" dc:"查询列表数据"`
	PageReq
	Pid  int64
	Name string
}
type ListMenuRes struct {
	List []*entity.Menu `json:"list"`
	*PageRes
}

// DelMenuReq 删除
type DelMenuReq struct {
	g.Meta `tags:"后台菜单" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateMenuReq 修改
type UpdateMenuReq struct {
	g.Meta `tags:"后台菜单" dc:"修改菜单"`
	*entity.Menu
}

// --- Role  -------------------------------------------

// AddApiReq 添加
type AddApiReq struct {
	g.Meta `tags:"后台-api" dc:"添加"`
	*entity.Api
}
type AddApiGroupReq struct {
	Group string `v:"required"`
	Url   string `v:"required"`
}
type AddApiGroupRes struct {
	Count int `json:"count"`
}

// GetApiReq 获取
type GetApiReq struct {
	g.Meta `tags:"后台-api" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetApiRes struct {
	Data *entity.Api `json:"data"`
}

// ListApiReq 集合
type ListApiReq struct {
	g.Meta `tags:"后台-api" dc:"查询列表数据"`
	PageReq
	Url    string
	Method string
	Group  string
	Type   string
}
type ListApiRes struct {
	List []*entity.Api `json:"list"`
	*PageRes
}

// DelApiReq 删除
type DelApiReq struct {
	g.Meta `tags:"后台-api" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateApiReq 修改
type UpdateApiReq struct {
	g.Meta `tags:"后台-api" dc:"修改菜单"`
	*entity.Api
}

// AddRoleReq 添加
type AddRoleReq struct {
	g.Meta `tags:"后台-角色" dc:"添加"`
	*entity.Role
}

// GetRoleReq 获取
type GetRoleReq struct {
	g.Meta `tags:"后台-角色" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetRoleRes struct {
	Data *entity.Role `json:"data"`
}
type GetRoleOptionsReq struct{}
type GetRoleOptionsRes struct {
	Options string `json:"options"`
}

// ListRoleReq 集合
type ListRoleReq struct {
	g.Meta `tags:"后台-角色" dc:"查询列表数据"`
	PageReq
}
type ListRoleRes struct {
	List []*entity.Role `json:"list"`
	*PageRes
}

// DelRoleReq 删除
type DelRoleReq struct {
	g.Meta `tags:"后台-角色" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateRoleReq 修改
type UpdateRoleReq struct {
	g.Meta `tags:"后台-角色" dc:"修改菜单"`
	*entity.Role
}

//--- RoleApi ---------------------------------------------------------

// AddRoleApiReq 添加
type AddRoleApiReq struct {
	g.Meta `tags:"后台-角色" dc:"添加"`
	*entity.RoleApi
}
type AddRoleApisReq struct {
	g.Meta `tags:"后台-角色" dc:"批量添加角色"`
	Rid    int   `v:"required"`
	Apis   []int `v:"required"`
}

// GetRoleApiReq 获取
type GetRoleApiReq struct {
	g.Meta `tags:"后台-角色" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetRoleApiRes struct {
	Data *entity.RoleApi `json:"data"`
}

// ListRoleApiReq 集合
type ListRoleApiReq struct {
	g.Meta `tags:"后台-角色" dc:"查询列表数据"`
	PageReq
	Rid int
}
type ListRoleApiRes struct {
	List []*model.RoleApi `json:"list"`
	*PageRes
}

type ListRoleNoApisReq struct {
	g.Meta `tag:"后台-角色" dc:"查询角色可以使用的api"`
	Rid    uint64 `v:"required"`
}
type ListRoleNoApisRes struct {
	Id     uint64 `json:"id"`
	Url    string `json:"url"`
	Method string `json:"method"`
	Group  string `json:"group"`
	Type   int    `json:"type"`
	Desc   string `json:"desc"`
}

type ListRoleNoMenusReq struct {
	g.Meta `tag:"后台-角色" dc:"查询角色没有的权限的菜单"`
	Rid    int
}
type ListRoleNoMenusRes struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
	Type int    `json:"type"`
}

// DelRoleApiReq 删除
type DelRoleApiReq struct {
	g.Meta `tags:"后台-角色" dc:"删除"`
	Id     uint64 `v:"required"`
}
type DelRoleApiClearReq struct {
	g.Meta `tag:"后台-角色" dc:"清空角色禁用api"`
	Rid    uint64 `v:"required"`
}

// UpdateRoleApiReq 修改
type UpdateRoleApiReq struct {
	g.Meta `tags:"后台-角色" dc:"修改菜单"`
	*entity.RoleApi
}

//--- RoleMenu ---------------------------------------------------------

// AddRoleMenuReq 添加
type AddRoleMenuReq struct {
	g.Meta `tags:"后台-角色菜单" dc:"添加"`
	*entity.RoleMenu
}

type AddRoleMenusReq struct {
	g.Meta `tag:"后台角色" dc:"批量添加角色菜单"`
	Rid    int   `v:"required"`
	Mids   []int `v:"required"`
}

// GetRoleMenuReq 获取
type GetRoleMenuReq struct {
	g.Meta `tags:"后台-角色菜单" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetRoleMenuRes struct {
	Data *entity.RoleMenu `json:"data"`
}

// ListRoleMenuReq 集合
type ListRoleMenuReq struct {
	g.Meta `tags:"后台-角色菜单" dc:"查询列表数据"`
	PageReq
	Rid int
}
type ListRoleMenuRes struct {
	List []*model.RoleMenu `json:"list"`
	*PageRes
}

// DelRoleMenuReq 删除
type DelRoleMenuReq struct {
	g.Meta `tags:"后台-角色菜单" dc:"删除"`
	Id     uint64 `v:"required"`
}
type DelClearRoleMenuReq struct {
	g.Meta `tag:"后台-角色菜单" dc:"清空"`
	Rid    uint64 `v:"required"`
}

// UpdateRoleMenuReq 修改
type UpdateRoleMenuReq struct {
	g.Meta `tags:"后台-角色菜单" dc:"修改菜单"`
	*entity.RoleMenu
}

//--- Admin ---------------------------------------------------------

// AddAdminReq 添加
type AddAdminReq struct {
	g.Meta `tags:"后台-管理员" dc:"添加"`
	*entity.Admin
}
type AdminLoginReq struct {
	g.Meta  `tags:"后台" dc:"管理员登录"`
	Uname   string `v:"required" dc:"用户名"`
	Pass    string `v:"required" dc:"密码"`
	Id      string `v:"required" dc:"验证码ID"`
	Captcha string `v:"required" dc:"验证码"`
}
type AdminLoginRes struct {
	Token string `json:"token"`
}

// GetAdminReq 获取
type GetAdminReq struct {
	g.Meta `tags:"后台-管理员" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetAdminRes struct {
	Data *entity.Admin `json:"data"`
}
type AdminInfoReq struct {
	g.Meta `tags:"后台" dc:"获取管理员信息"`
	Authorization
}
type AdminInfoRes struct {
	Info  *model.Admin  `json:"info"`
	Menus []*model.Menu `json:"menus"`
}

// ListAdminReq 集合
type ListAdminReq struct {
	g.Meta `tags:"后台-管理员" dc:"查询列表数据"`
	PageReq
	Id     uint64
	Uname  string
	Status uint64
	Rid    uint64
}
type ListAdminRes struct {
	List []*entity.Admin `json:"list"`
	*PageRes
}

// DelAdminReq 删除
type DelAdminReq struct {
	g.Meta `tags:"后台-管理员" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateAdminReq 修改
type UpdateAdminReq struct {
	g.Meta `tags:"后台-管理员" dc:"修改菜单"`
	*entity.Admin
}
type UpdateAdminUnameReq struct {
	g.Meta `tags:"后台-管理员" dc:"修改用户名"`
	Uname  string `v:"required"`
	Id     uint64 `v:"required"`
}
type UpdateAdminPassReq struct {
	g.Meta `tags:"后台-管理员" dc:"修改密码"`
	Pass   string `v:"required"`
	Id     uint64 `v:"required"`
}
type UpdateAdminPassSelfReq struct {
	Pass string `v:"required"`
}

//--- Dict ---------------------------------------------------------

// AddDictReq 添加
type AddDictReq struct {
	g.Meta `tags:"后台-字典" dc:"添加"`
	*entity.Dict
}

// GetDictReq 获取
type GetDictReq struct {
	g.Meta `tags:"后台-字典" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetDictRes struct {
	Data *entity.Dict `json:"data"`
}

// ListDictReq 集合
type ListDictReq struct {
	g.Meta `tags:"后台-字典" dc:"查询列表数据"`
	PageReq
}
type ListDictRes struct {
	List []*entity.Dict `json:"list"`
	*PageRes
}

// DelDictReq 删除
type DelDictReq struct {
	g.Meta `tags:"后台-字典" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateDictReq 修改
type UpdateDictReq struct {
	g.Meta `tags:"后台-字典" dc:"修改菜单"`
	*entity.Dict
}

//--- File ---------------------------------------------------------

// AddFileReq 添加
type AddFileReq struct {
	g.Meta `tags:"后台-文件" dc:"添加"`
	*entity.File
}

// GetFileReq 获取
type GetFileReq struct {
	g.Meta `tags:"后台-文件" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetFileRes struct {
	Data *entity.File `json:"data"`
}

// ListFileReq 集合
type ListFileReq struct {
	g.Meta `tags:"后台-文件" dc:"查询列表数据"`
	Id     int
	PageReq
	Url   string
	Group int
}
type ListFileRes struct {
	List []*entity.File `json:"list"`
	*PageRes
}

// DelFileReq 删除
type DelFileReq struct {
	g.Meta `tags:"后台-文件" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateFileReq 修改
type UpdateFileReq struct {
	g.Meta `tags:"后台-文件" dc:"修改菜单"`
	*entity.File
}

//--- OperationLog ---------------------------------------------------------

// AddOperationLogReq 添加
type AddOperationLogReq struct {
	g.Meta `tags:"后台-操作日志" dc:"添加"`
	*entity.OperationLog
}

// GetOperationLogReq 获取
type GetOperationLogReq struct {
	g.Meta `tags:"后台-操作日志" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetOperationLogRes struct {
	Data *entity.OperationLog `json:"data"`
}

// ListOperationLogReq 集合
type ListOperationLogReq struct {
	g.Meta `tags:"后台-操作日志" dc:"查询列表数据"`
	PageReq
	Uname    string
	Ip       string
	Method   string
	Content  string
	Uri      string
	Response string
}
type ListOperationLogRes struct {
	List []*model.OperationLog `json:"list"`
	*PageRes
}

// DelOperationLogReq 删除
type DelOperationLogReq struct {
	g.Meta `tags:"后台-操作日志" dc:"删除"`
	Id     uint64 `v:"required"`
}
type DelClearOperationLogReq struct{}

// UpdateOperationLogReq 修改
type UpdateOperationLogReq struct {
	g.Meta `tags:"后台-操作日志" dc:"修改菜单"`
	*entity.OperationLog
}

//--- AdminLoginLog ---------------------------------------------------------

// AddAdminLoginLogReq 添加
type AddAdminLoginLogReq struct {
	g.Meta `tags:"后台-登录日志" dc:"添加"`
	*entity.AdminLoginLog
}

// GetAdminLoginLogReq 获取
type GetAdminLoginLogReq struct {
	g.Meta `tags:"后台-登录日志" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetAdminLoginLogRes struct {
	Data *entity.AdminLoginLog `json:"data"`
}

// ListAdminLoginLogReq 集合
type ListAdminLoginLogReq struct {
	g.Meta `tags:"后台-登录日志" dc:"查询列表数据"`
	PageReq
	Uname string
	Ip    string
}
type ListAdminLoginLogRes struct {
	List []*model.AdminLoginLog `json:"list"`
	*PageRes
}

// DelAdminLoginLogReq 删除
type DelAdminLoginLogReq struct {
	g.Meta `tags:"后台-登录日志" dc:"删除"`
	Id     uint64 `v:"required"`
}
type DelClearAdminLoginLogReq struct {
}

// UpdateAdminLoginLogReq 修改
type UpdateAdminLoginLogReq struct {
	g.Meta `tags:"后台-登录日志" dc:"修改菜单"`
	*entity.AdminLoginLog
}

//--- Banner ---------------------------------------------------------

// AddBannerReq 添加
type AddBannerReq struct {
	g.Meta `tags:"后台-banner" dc:"添加"`
	*entity.Banner
}

// GetBannerReq 获取
type GetBannerReq struct {
	g.Meta `tags:"后台-banner" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetBannerRes struct {
	Data *entity.Banner `json:"data"`
}

// ListBannerReq 集合
type ListBannerReq struct {
	g.Meta `tags:"后台-banner" dc:"查询列表数据"`
	PageReq
}
type ListBannerRes struct {
	List []*entity.Banner `json:"list"`
	*PageRes
}

// DelBannerReq 删除
type DelBannerReq struct {
	g.Meta `tags:"后台-banner" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateBannerReq 修改
type UpdateBannerReq struct {
	g.Meta `tags:"后台-banner" dc:"修改菜单"`
	*entity.Banner
}

//--- User ---------------------------------------------------------

// AddUserReq 添加
type AddUserReq struct {
	g.Meta `tags:"后台-用户" dc:"添加"`
	*entity.User
}

// GetUserReq 获取
type GetUserReq struct {
	g.Meta `tags:"后台-用户" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetUserRes struct {
	Data *entity.User `json:"data"`
}

// ListUserReq 集合
type ListUserReq struct {
	g.Meta `tags:"后台-用户" dc:"查询列表数据"`
	PageReq
	Uname  string
	JoinIp string
	Status int
	Id     uint64
	Desc   string
}
type ListUserRes struct {
	List []*entity.User `json:"list"`
	*PageRes
}

// DelUserReq 删除
type DelUserReq struct {
	g.Meta `tags:"后台-用户" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateUserReq 修改
type UpdateUserReq struct {
	g.Meta `tags:"后台-用户" dc:"修改菜单"`
	*entity.User
}
type UpdateUnameReq struct {
	Uname string `v:"required"`
	Id    uint64 `v:"required"`
}
type UpdatePassForBackendReq struct {
	Id   uint64 `v:"required"`
	Pass string `v:"required"`
}

//--- UserLoginLog ---------------------------------------------------------

// AddUserLoginLogReq 添加
type AddUserLoginLogReq struct {
	g.Meta `tags:"后台-用户登录日志" dc:"添加"`
	*entity.UserLoginLog
}

// GetUserLoginLogReq 获取
type GetUserLoginLogReq struct {
	g.Meta `tags:"后台-用户登录日志" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetUserLoginLogRes struct {
	Data *entity.UserLoginLog `json:"data"`
}

// ListUserLoginLogReq 集合
type ListUserLoginLogReq struct {
	g.Meta `tags:"后台-用户登录日志" dc:"查询列表数据"`
	PageReq
	Uname string
	Ip    string
}
type ListUserLoginLogRes struct {
	List []*model.UserLoginLog `json:"list"`
	*PageRes
}

// DelUserLoginLogReq 删除
type DelUserLoginLogReq struct {
	g.Meta `tags:"后台-用户登录日志" dc:"删除"`
	Id     uint64 `v:"required"`
}
type DelClearUserLoginLogsReq struct{}

// UpdateUserLoginLogReq 修改
type UpdateUserLoginLogReq struct {
	g.Meta `tags:"后台-用户登录日志" dc:"修改菜单"`
	*entity.UserLoginLog
}

//--- WalletChangeType ---------------------------------------------------------

// AddWalletChangeTypeReq 添加
type AddWalletChangeTypeReq struct {
	g.Meta `tags:"后台-账变类型" dc:"添加"`
	*entity.WalletChangeType
}

// GetWalletChangeTypeReq 获取
type GetWalletChangeTypeReq struct {
	g.Meta `tags:"后台-账变类型" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetWalletChangeTypeRes struct {
	Data *entity.WalletChangeType `json:"data"`
}

// ListWalletChangeTypeReq 集合
type ListWalletChangeTypeReq struct {
	g.Meta `tags:"后台-账变类型" dc:"查询列表数据"`
	PageReq
}
type ListWalletChangeTypeRes struct {
	List []*entity.WalletChangeType `json:"list"`
	*PageRes
}

type ListWalletChangeTypeOptionsReq struct{}
type ListWalletChangeTypeOptionsRes struct {
	Id       uint64 `json:"id"          description:""`
	Title    string `json:"title"       description:""`
	SubTitle string `json:"subTitle"    description:""`
	Type     uint   `json:"type"        description:"1 add; 2 reduce"`
	Class    string `json:"class"       description:""`
	Desc     string `json:"desc"        description:""`
	Status   uint   `json:"status"      description:""`
}

// DelWalletChangeTypeReq 删除
type DelWalletChangeTypeReq struct {
	g.Meta `tags:"后台-账变类型" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateWalletChangeTypeReq 修改
type UpdateWalletChangeTypeReq struct {
	g.Meta `tags:"后台-账变类型" dc:"修改菜单"`
	*entity.WalletChangeType
}

//--- Wallet ---------------------------------------------------------

// AddWalletReq 添加
type AddWalletReq struct {
	g.Meta `tags:"后台-用户钱包" dc:"添加"`
	*entity.Wallet
}

// GetWalletReq 获取
type GetWalletReq struct {
	g.Meta `tags:"后台-用户钱包" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetWalletRes struct {
	Data *entity.Wallet `json:"data"`
}

// ListWalletReq 集合
type ListWalletReq struct {
	g.Meta `tags:"后台-用户钱包" dc:"查询列表数据"`
	PageReq
	Uname   string
	Balance float64
	Desc    string
	Status  string
}
type ListWalletRes struct {
	List []*model.Wallet `json:"list"`
	*PageRes
}

// DelWalletReq 删除
type DelWalletReq struct {
	g.Meta `tags:"后台-用户钱包" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateWalletReq 修改
type UpdateWalletReq struct {
	g.Meta `tags:"后台-用户钱包" dc:"修改菜单"`
	*do.Wallet
}
type UpdateWalletPassReq struct {
	Id   int64  `v:"required"`
	Pass string `v:"required"`
}
type UpdateWalletByAdminReq struct {
	Uid   uint64
	Money float64
	Type  int
	Desc  string
}

//--- WalletChangeLog ---------------------------------------------------------

// AddWalletChangeLogReq 添加
type AddWalletChangeLogReq struct {
	g.Meta `tags:"后台-账变记录" dc:"添加"`
	*do.WalletChangeLog
}

// GetWalletChangeLogReq 获取
type GetWalletChangeLogReq struct {
	g.Meta `tags:"后台-账变记录" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetWalletChangeLogRes struct {
	Data *entity.WalletChangeLog `json:"data"`
}

// ListWalletChangeLogReq 集合
type ListWalletChangeLogReq struct {
	g.Meta `tags:"后台-账变记录" dc:"查询列表数据"`
	PageReq
	TransId string
	Uname   string
	Type    string
	Desc    string
}
type ListWalletChangeLogRes struct {
	List []*model.WalletChangeLog `json:"list"`
	*PageRes
}

// DelWalletChangeLogReq 删除
type DelWalletChangeLogReq struct {
	g.Meta `tags:"后台-账变记录" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateWalletChangeLogReq 修改
type UpdateWalletChangeLogReq struct {
	g.Meta `tags:"后台-账变记录" dc:"修改菜单"`
	*do.WalletChangeLog
}

//--- WalletStatisticsLog ---------------------------------------------------------

// AddWalletStatisticsLogReq 添加
type AddWalletStatisticsLogReq struct {
	g.Meta `tags:"后台-账变统计" dc:"添加"`
	*do.WalletStatisticsLog
}

// GetWalletStatisticsLogReq 获取
type GetWalletStatisticsLogReq struct {
	g.Meta `tags:"后台-账变统计" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetWalletStatisticsLogRes struct {
	Data *entity.WalletStatisticsLog `json:"data"`
}

type GetReportReq struct {
	Uname, Begin, End string
}

type GetReportRes struct {
	T1  float64 `json:"t1"          description:""`
	T2  float64 `json:"t2"          description:""`
	T3  float64 `json:"t3"          description:""`
	T4  float64 `json:"t4"          description:""`
	T5  float64 `json:"t5"          description:""`
	T6  float64 `json:"t6"          description:""`
	T7  float64 `json:"t7"          description:""`
	T8  float64 `json:"t8"          description:""`
	T9  float64 `json:"t9"          description:""`
	T10 float64 `json:"t10"         description:""`
	T11 float64 `json:"t11"         description:""`
	T12 float64 `json:"t12"         description:""`
	T13 float64 `json:"t13"         description:""`
}

// ListWalletStatisticsLogReq 集合
type ListWalletStatisticsLogReq struct {
	g.Meta `tags:"后台-账变统计" dc:"查询列表数据"`
	PageReq
	Uname string
	Begin string
	End   string
}
type ListWalletStatisticsLogRes struct {
	List []*model.WalletStatisticsLog `json:"list"`
	*PageRes
}

// DelWalletStatisticsLogReq 删除
type DelWalletStatisticsLogReq struct {
	g.Meta `tags:"后台-账变统计" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateWalletStatisticsLogReq 修改
type UpdateWalletStatisticsLogReq struct {
	g.Meta `tags:"后台-账变统计" dc:"修改菜单"`
	*do.WalletStatisticsLog
}

//--- WalletTopUpApplication ---------------------------------------------------------

// AddWalletTopUpApplicationReq 添加
type AddWalletTopUpApplicationReq struct {
	g.Meta `tags:"后台-充值订单" dc:"添加"`
	*do.WalletTopUpApplication
}

// GetWalletTopUpApplicationReq 获取
type GetWalletTopUpApplicationReq struct {
	g.Meta `tags:"后台-充值订单" dc:"查询一条数据"`
	Id     uint64 `v:"required"`
}
type GetWalletTopUpApplicationRes struct {
	Data *entity.WalletTopUpApplication `json:"data"`
}

// ListWalletTopUpApplicationReq 集合
type ListWalletTopUpApplicationReq struct {
	g.Meta `tags:"后台-充值订单" dc:"查询列表数据"`
	PageReq
	Uname       string
	TransId     string
	ChangeType  string
	Ip          string
	Admin       string
	Description string
	Status      string
	Begin       string
	End         string
}
type ListWalletTopUpApplicationRes struct {
	List []*model.WalletTopUpApplication `json:"list"`
	*PageRes
}

// DelWalletTopUpApplicationReq 删除
type DelWalletTopUpApplicationReq struct {
	g.Meta `tags:"后台-充值订单" dc:"删除"`
	Id     uint64 `v:"required"`
}

// UpdateWalletTopUpApplicationReq 修改
type UpdateWalletTopUpApplicationReq struct {
	g.Meta `tags:"后台-充值订单" dc:"修改菜单"`
	*do.WalletTopUpApplication
}
type UpdateWalletTopUpApplicationByAdminReq struct {
	Id   uint64
	Type int
}
