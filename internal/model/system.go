package model

import (
	"context"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

type Admin struct {
	Id           int `json:"id"           description:""`
	Rid          int
	Uname        string  `json:"uname"        description:""`
	UnreadMsgNum uint    `json:"unreadMsgNum" description:""`
	Nickname     string  `json:"nickname"     description:""`
	Email        string  `json:"email"        description:""`
	Phone        string  `json:"phone"        description:""`
	Menus        []*Menu `json:"menus"`
}

type AdminMsg struct {
	FromUname string `json:"from_uname"`
	Position  string `json:"position"`
	ToUname   string `json:"to_uname"`
	ToUid     uint64 `json:"to_uid"`
	Msg       string `v:"required" json:"msg"`
	Type      string `v:"required" d:"info" json:"type"` // 用于通知类型
}

type Menu struct {
	Id       int     `json:"id"        description:""`
	Pid      int     `json:"pid"       description:""`
	Icon     string  `json:"icon"      description:""`
	BgImg    string  `json:"bgImg"     description:""`
	Name     string  `json:"name"      description:""`
	Path     string  `json:"path"      description:""`
	Sort     float64 `json:"sort"      description:""`
	Type     int     `json:"type"      description:"1normal 2group"`
	Desc     string  `json:"desc"      description:""`
	FilePath string  `json:"filePath"  description:""`
	Status   int     `json:"status"    description:""`
	Children []*Menu `json:"children"`
}

type Search struct {
	T1           string
	T2           string
	T3           string
	T4           string
	T5           string
	T6           string
	Page, Size   int
	OrderBy      string
	SearchFields string
	Fields       []Field // 条件查询的字段
	Begin        string  // 查询时间的开始
	End          string  // 查询时间的结束
}

type Field struct {
	Name      string
	QueryName string
	Type      int // 0 no,1 = ,2 like,3 >, 4 <, 5>=,6 <=,7 != ,8 date,9 date begin
	Value     interface{}
}

// FilterConditions 过滤需要查询的字段
func (s *Search) FilterConditions(ctx context.Context) []Field {
	request := g.RequestFromCtx(ctx)
	data := make([]Field, 0)
	for _, field := range s.Fields {
		if field.QueryName == "" {
			field.QueryName = field.Name
		}
		query := request.GetQuery(field.QueryName)
		if !query.IsEmpty() {
			field.Value = query
		}
		data = append(data, field)
	}
	return data
}

type RoleMenu struct {
	Id       int    `json:"id"`
	RoleName string `json:"role_name"`
	MenuName string `json:"menu_name"`
	Type     int    `json:"type"`
}
type RoleApi struct {
	Id       uint64 `json:"id"`
	RoleName string `json:"role_name"`
	Path     string `json:"path"`
	Group    string `json:"group"`
	Method   string `json:"method"`
	Desc     string `json:"desc"`
}

type OperationLog struct {
	Id        int         `json:"id"        description:""`
	Uid       int         `json:"uid"       description:""`
	Uname     string      `json:"uname"`
	Content   string      `json:"content"   description:""`
	Response  string      `json:"response"  description:""`
	Method    string      `json:"method"    description:""`
	Uri       string      `json:"uri"       description:""`
	Ip        string      `json:"ip"        description:""`
	UseTime   int         `json:"useTime"   description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
}
type AdminLoginLog struct {
	Id        int         `json:"id"        description:""`
	Uid       int         `json:"uid"       description:"{\"label\":\"用户id\",\"searchType\":1,\"hide\":1,\"disabled\":1,\"required\":1}"`
	Uname     string      `json:"uname"`
	Ip        string      `json:"ip"        description:"{\"label\":\"登录IP\",\"notShow\":0,\"fieldType\":\"text\",\"editHide\":0,\"editDisabled\":0,\"required\":1}"`
	Area      string      `json:"area"      description:"{\"searchType\":2,\"hide\":1}"`
	Status    int         `json:"status"    description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
	UpdatedAt *gtime.Time `json:"updatedAt" description:""`
}

type UserLoginLog struct {
	Id        uint64      `json:"id"        description:""`
	Uid       uint64      `json:"uid"       description:""`
	Uname     string      `json:"uname"`
	Ip        string      `json:"ip"        description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
	UpdatedAt *gtime.Time `json:"updatedAt" description:""`
}
