package controllers

import (
	"net/http"

	"github.com/Oik17/yantra-hack/internal/models"
	"github.com/Oik17/yantra-hack/internal/services"
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

