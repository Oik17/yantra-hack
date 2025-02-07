package utils

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
)

func EvaluateConstant(T float64, D float64, I float64, RH float64, P float64, Prated float64) float64 {

	C := (1 - (0.004 * (T - 25))) * (1 - (0.05 * D)) * (I / (1000 * 126.7)) * (1 - (0.001 * (RH - 50))) * (P / 1013)
	log.Println(C)
	return Prated * C
}

func ReadCSV(filePath string) ([]map[string]string, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %v", err)
	}
	defer file.Close()

	reader := csv.NewReader(file)

	// Read all rows
	rows, err := reader.ReadAll()
	if err != nil {
		return nil, fmt.Errorf("failed to read CSV data: %v", err)
	}

	// Ensure the CSV has at least a header row and one data row
	if len(rows) < 2 {
		return nil, fmt.Errorf("CSV must have at least a header row and one data row")
	}

	// First row as column headers
	headers := rows[0]

	// Slice to store extracted data
	var data []map[string]string

	// Iterate over the rows (excluding the header row)
	for _, row := range rows[1:] {
		rowData := make(map[string]string)
		for colIdx, colName := range headers {
			if colIdx < len(row) {
				rowData[colName] = row[colIdx]
			} else {
				rowData[colName] = "" // Handle missing values
			}
		}
		data = append(data, rowData)
	}

	log.Println("CSV data successfully read!")
	return data, nil
}
