package services

import (
	"github.com/Oik17/yantra-hack/internal/database"
	"github.com/Oik17/yantra-hack/internal/models"
	"github.com/google/uuid"
)

func InputSolar(input models.SolarInput) error {
	db := database.DB.Db
	_, err := db.Exec(`INSERT INTO solar_inputs VALUES $1, $2, $3, $4`, uuid.New(), input.PanelArea, input.EfficiencyRating, input.PanelAge)
	if err!=nil{
		return err
	}
	return nil
}
