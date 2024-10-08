package main

import (
	"go-api/controller"
	"go-api/db"
	"go-api/repository"
	"go-api/usecase"

	"github.com/gin-gonic/gin"
)

func main() {

	server := gin.Default()

	dbConnection, err := db.ConnectDB()
	if err != nil {
		panic(err)
	}

	//Camada repository
	ProductRepository := repository.NewProductRepository(dbConnection)

	//Camada usecase
	ProductUsecase := usecase.NewProductUsecase(ProductRepository)

	//Camada de controllers
	ProductController := controller.NewProducController(ProductUsecase)

	server.GET("/ping", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"message": "pong",
		})
	})

	server.GET("/products", ProductController.GetProducts)
	server.GET("/product/:productId", ProductController.GetProductById)
	server.POST("/product", ProductController.CreateProduct)

	server.Run(":8000")

}
