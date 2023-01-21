// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// User is the golang structure of table u_user for DAO operations like Where/Data.
type User struct {
	g.Meta         `orm:"table:u_user, do:true"`
	Id             interface{} //
	Uname          interface{} //
	Pass           interface{} //
	Nickname       interface{} //
	Icon           interface{} //
	Summary        interface{} //
	Desc           interface{} //
	JoinIp         interface{} // 注册IP
	Device         interface{} // 设备名称
	Phone          interface{} //
	Email          interface{} //
	Status         interface{} //
	PassErrorCount interface{} // 密码错误次数
	CreatedAt      *gtime.Time //
	UpdatedAt      *gtime.Time //
}