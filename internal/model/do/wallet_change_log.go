// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// WalletChangeLog is the golang structure of table u_wallet_change_log for DAO operations like Where/Data.
type WalletChangeLog struct {
	g.Meta    `orm:"table:u_wallet_change_log, do:true"`
	Id        interface{} //
	TransId   interface{} //
	Uid       interface{} //
	Amount    interface{} //
	Balance   interface{} //
	Type      interface{} // 1人工充值,2支付宝充值,3微信充值,4paypal充值,5人工扣除
	Desc      interface{} //
	CreatedAt *gtime.Time //
}