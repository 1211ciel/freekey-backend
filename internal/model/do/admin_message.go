// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// AdminMessage is the golang structure of table s_admin_message for DAO operations like Where/Data.
type AdminMessage struct {
	g.Meta    `orm:"table:s_admin_message, do:true"`
	Id        interface{} //
	Aid       interface{} //
	Type      interface{} // 1 系统消息
	Title     interface{} //
	Content   interface{} //
	Url       interface{} //
	CreatedAt *gtime.Time //
}
