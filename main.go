package main

import (
	"github.com/gofiber/fiber/v2"
)

const (
	port = ":3000"
)

func jsonContentTypeMiddleware(c *fiber.Ctx) error {
	c.Set("Content-Type", "application/json")
	return c.Next()
}

func main() {
	app := fiber.New()
	app.Use(jsonContentTypeMiddleware)
	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello!")
	})
	app.Get("/healthcheck", func(c *fiber.Ctx) error {
		return c.SendStatus(fiber.StatusOK)
	})

	app.Listen(port)
}
