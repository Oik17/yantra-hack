package routes

import (
	"github.com/Oik17/yantra-hack/internal/controllers"
	"github.com/labstack/echo/v4"
)

func SolarRoutes(e *echo.Echo) {
	r := e.Group("/solar")
	r.POST("/post", controllers.SolarInput)
}
