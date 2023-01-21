package model

import "github.com/gogf/gf/v2/os/gtime"

type TopUpCategory struct {
	Id    int    `json:"id" dc:"id"`
	Title string `json:"title" dc:"名称"`
	Desc  string `json:"desc" dc:"说明"`
}
type TopUpItem struct {
	Id          uint64     `json:"id" dc:"id"`
	TransId     string     `json:"trans_id" dc:"交易ID"`
	Uid         uint64     `json:"uid" dc:"用户ID"`
	ChangeType  int        `json:"change_type" dc:"账变类型： 对应值请查询账变类型接口"`
	Description string     `json:"description" dc:"说明"`
	Status      int        `json:"status" dc:"状态 1等待 2成功 3失败"`
	CreatedAt   gtime.Time `json:"created_at" dc:"交易时间"`
}
type ChangeLogItem struct {
	Id        uint64     `json:"id" dc:"id"`
	TransId   string     `json:"trans_id" dc:"交易ID"`
	Amount    float64    `json:"amount" dc:"交易金额"`
	Balance   float64    `json:"balance" dc:"余额"`
	Type      int        `json:"type" dc:"账变类型：对应值请查询账变类型接口"`
	Desc      string     `json:"desc" dc:"说明"`
	CreatedAt gtime.Time `json:"created_at" dc:"交易时间"`
}

type Wallet struct {
	Id           uint64      `json:"id"           description:""`
	Uid          uint64      `json:"uid"          description:""`
	Uname        string      `json:"uname"`
	Balance      float64     `json:"balance"      description:""`
	Pass         string      `json:"pass"         description:""`
	PassErrCount uint        `json:"passErrCount" description:"密码输错次数"`
	Desc         string      `json:"desc"         description:""`
	Status       uint        `json:"status"       description:"金库状态 0 设置密码 1正常,2 锁定"`
	CreatedAt    *gtime.Time `json:"createdAt"    description:""`
	UpdatedAt    *gtime.Time `json:"updatedAt"    description:""`
}

type WalletChangeLog struct {
	Id        uint64      `json:"id"        description:""`
	TransId   string      `json:"transId"   description:""`
	Uname     string      `json:"uname"`
	Amount    float64     `json:"amount"    description:""`
	Balance   float64     `json:"balance"   description:""`
	Type      uint        `json:"type"      description:"1人工充值,2支付宝充值,3微信充值,4paypal充值,5人工扣除"`
	Desc      string      `json:"desc"      description:""`
	CreatedAt *gtime.Time `json:"createdAt" description:""`
}

type WalletStatisticsLog struct {
	Id          uint64      `json:"id"          description:""`
	Uname       string      `json:"uname"`
	T1          float64     `json:"t1"          description:""`
	T2          float64     `json:"t2"          description:""`
	T3          float64     `json:"t3"          description:""`
	T4          float64     `json:"t4"          description:""`
	T5          float64     `json:"t5"          description:""`
	T6          float64     `json:"t6"          description:""`
	T7          float64     `json:"t7"          description:""`
	T8          float64     `json:"t8"          description:""`
	T9          float64     `json:"t9"          description:""`
	T10         float64     `json:"t10"         description:""`
	T11         float64     `json:"t11"         description:""`
	T12         float64     `json:"t12"         description:""`
	T13         float64     `json:"t13"         description:""`
	CreatedDate *gtime.Time `json:"createdDate" description:""`
}

type WalletTopUpApplication struct {
	Id          uint64      `json:"id"          description:""`
	TransId     string      `json:"transId"     description:""`
	Uname       string      `json:"uname"`
	ChangeType  uint        `json:"changeType"  description:""`
	Money       float64     `json:"money"       description:""`
	Ip          string      `json:"ip"          description:""`
	Description string      `json:"description" description:""`
	Admin       string      `json:"admin"         description:""`
	Status      uint        `json:"status"      description:"1 wait 2 success 3 fail"`
	CreatedAt   *gtime.Time `json:"createdAt"   description:""`
	UpdatedAt   *gtime.Time `json:"updatedAt"   description:""`
}
