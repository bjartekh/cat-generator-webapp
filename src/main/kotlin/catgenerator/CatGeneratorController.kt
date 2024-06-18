package catgenerator

import io.micronaut.http.MediaType
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.annotation.Produces


@Controller
class CatGeneratorController {


    @Get("/")
    fun index() : String {
        return "Go to /hello"
    }

    @Get("/hello")
    @Produces(MediaType.TEXT_PLAIN)
    fun hello() = "Hello World of Cats"

}