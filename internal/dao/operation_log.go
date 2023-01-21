// =================================================================================
// This is auto-generated by GoFrame CLI tool only once. Fill this file as you wish.
// =================================================================================

package dao

import (
	"freekey-backend/internal/dao/internal"
)

// internalOperationLogDao is internal type for wrapping internal DAO implements.
type internalOperationLogDao = *internal.OperationLogDao

// operationLogDao is the data access object for table s_operation_log.
// You can define custom methods on it to extend its functionality as you wish.
type operationLogDao struct {
	internalOperationLogDao
}

var (
	// OperationLog is globally public accessible object for table s_operation_log operations.
	OperationLog = operationLogDao{
		internal.NewOperationLogDao(),
	}
)

// Fill with you ideas below.
