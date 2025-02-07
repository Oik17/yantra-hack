package main

import (
	"net/http"

	routes "github.com/Oik17/yantra-hack/internal/routers"
	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, map[string]string{"message": "Hello, Echo!"})
	})

	routes.WeatherRoutes(e)
	e.Start(":8080")
}
