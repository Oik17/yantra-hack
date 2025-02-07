package controllers

import (
	"log"
	"net/http"

	"github.com/Oik17/yantra-hack/internal/models"
	"github.com/Oik17/yantra-hack/internal/services"
	"github.com/Oik17/yantra-hack/internal/utils"
	"github.com/labstack/echo/v4"
)

//Panel area(size)
//Efficiency reating
//Age of panel

func SolarInput(c echo.Context) error {
	var input models.SolarInput
	if err := c.Bind(&input); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Failed to input",
			"data":    err.Error(),
			"status":  "false",
		})
	}

	err := services.InputSolar(input)
	if err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Failed to input",
			"data":    err.Error(),
			"status":  "false",
		})
	}
	return c.JSON(http.StatusOK, map[string]string{
		"message": "Successfully updated data",
		"data":    "Successfully updated data",
		"status":  "True",
	})

}

func GetAllSolar(c echo.Context) error {
	solar, err := services.GetAllSolar()
	if err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Failed to input",
			"data":    err.Error(),
			"status":  "false",
		})
	}
	return c.JSON(http.StatusOK, solar)

}

func CalcSolar(c echo.Context) error {
	var input struct {
		T      float64 `json:"t"`
		D      float64 `json:"D"`
		I      float64 `json:"I"`
		RH     float64 `json:"RH"`
		P      float64 `json:"P"`
		Prated float64 `json:"p_rated"`
	}
	if err := c.Bind(&input); err != nil {
		return c.JSON(http.StatusBadRequest, map[string]string{
			"message": "Bad input request",
			"data":    err.Error(),
			"status":  "false",
		})
	}
	log.Println(input.T, input.D, input.I, input.RH, input.P, input.Prated)
	Pactual := utils.EvaluateConstant(input.T, input.D, input.I, input.RH, input.P, input.Prated)
	log.Println(Pactual)
	return c.JSON(http.StatusOK, map[string]float64{
		"data": Pactual,
	})
}
