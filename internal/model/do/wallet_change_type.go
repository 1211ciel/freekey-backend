// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// WalletChangeType is the golang structure of table u_wallet_change_type for DAO operations like Where/Data.
type WalletChangeType struct {
	g.Meta      `orm:"table:u_wallet_change_type, do:true"`
	Id          interface{} //
	Title       interface{} //
	SubTitle    interface{} //
	Type        interface{} // 1 add; 2 reduce
	Class       interface{} //
	Desc        interface{} //
	Status      interface{} //
	CountStatus interface{} // Whether this field needs statistics, 1 true 2 false
}
