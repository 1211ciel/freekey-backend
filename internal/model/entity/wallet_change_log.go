// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// WalletChangeLog is the golang structure for table wallet_change_log.
type WalletChangeLog struct {
	Id        uint64      `json:"id"        description:""`
	TransId   string      `json:"transId"   description:""`
	Uid       uint64      `json:"uid"       description:""`
	Amount    float64     `json:"amount"    description:""`
	Balance   float64     `json:"balance"   description:""`
	Type      uint        `json:"type"      description:"1人工充值,2支付宝充值,3微信充值,4paypal充值,5人工扣除"`
	Desc      string      `json:"desc"      description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
}
