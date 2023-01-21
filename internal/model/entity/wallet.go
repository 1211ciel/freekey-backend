// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// Wallet is the golang structure for table wallet.
type Wallet struct {
	Id           uint64      `json:"id"           description:""`
	Uid          uint64      `json:"uid"          description:""`
	Balance      float64     `json:"balance"      description:""`
	Pass         string      `json:"pass"         description:""`
	PassErrCount uint        `json:"passErrCount" description:"密码输错次数"`
	Desc         string      `json:"desc"         description:""`
	Status       uint        `json:"status"       description:"金库状态 0 设置密码 1正常,2 锁定"`
	CreatedAt    *gtime.Time `json:"createdAt"    description:""`
	UpdatedAt    *gtime.Time `json:"updatedAt"    description:""`
}
