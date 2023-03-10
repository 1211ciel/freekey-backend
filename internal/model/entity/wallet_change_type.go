// =================================================================================
// Code generated by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// WalletChangeType is the golang structure for table wallet_change_type.
type WalletChangeType struct {
	Id          uint64 `json:"id"          description:""`
	Title       string `json:"title"       description:""`
	SubTitle    string `json:"subTitle"    description:""`
	Type        uint   `json:"type"        description:"1 add; 2 reduce"`
	Class       string `json:"class"       description:""`
	Desc        string `json:"desc"        description:""`
	Status      uint   `json:"status"      description:""`
	CountStatus int    `json:"countStatus" description:"Whether this field needs statistics, 1 true 2 false"`
}
