// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// UserLoginLog is the golang structure for table user_login_log.
type UserLoginLog struct {
	Id        uint64      `json:"id"        description:""`
	Uid       uint64      `json:"uid"       description:""`
	Ip        string      `json:"ip"        description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
	UpdatedAt *gtime.Time `json:"updatedAt" description:""`
}
