package utils

import (
	"fmt"
	"log"

	"github.com/xuri/excelize/v2"
)

func EvaluateConstant(T float64, D float64, I float64, RH float64, P float64, Prated float64) float64 {

	C := (1 - (0.004 * (T - 25))) * (1 - (0.05 * D)) * (I / 1000) * (1 - (0.001 * (RH - 50))) * (P / 101.3)
	log.Println(C)
	return Prated * C
}

func ReadExcel(filePath, sheetName string) ([]map[string]string, error) {
	f, err := excelize.OpenFile(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %v", err)
	}
	defer f.Close()

	rows, err := f.GetRows(sheetName)
	if err != nil {
		return nil, fmt.Errorf("failed to get rows: %v", err)
	}

	if len(rows) < 2 {
		return nil, fmt.Errorf("sheet must have at least a header row and one data row")
	}

	columns := rows[0]

	var data []map[string]string

	for _, row := range rows[1:] {
		rowData := make(map[string]string)
		for colIdx, colName := range columns {
			if colIdx < len(row) {
				rowData[colName] = row[colIdx]
			} else {
				rowData[colName] = ""
			}
		}
		data = append(data, rowData)
	}

	log.Println("Excel data successfully read!")
	return data, nil
}
