package models

import "github.com/google/uuid"

type SolarInput struct {
	ID               uuid.UUID `json:"id"`
	PanelArea        uint      `json:"panel_area"`
	EfficiencyRating uint      `json:"efficiency_rating"`
	PanelAge         uint      `json:"panel_age"`
}
