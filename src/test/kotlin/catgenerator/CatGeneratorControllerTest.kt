package catgenerator

import io.micronaut.http.HttpRequest
import io.micronaut.http.client.HttpClient
import io.micronaut.http.client.annotation.Client
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import io.micronaut.test.extensions.junit5.annotation.MicronautTest
import org.junit.jupiter.api.Test


@MicronautTest
class CatGeneratorControllerTest(@Client("/") val client : HttpClient ) {


    @Test
    fun testIndex() {
        var request: HttpRequest<Any> = HttpRequest.GET("/")
        val body = client.toBlocking().retrieve(request)
        assertNotNull(body)
        assertEquals("Go to /hello", body)
    }

    @Test
    fun testHello() {
        var request: HttpRequest<Any> = HttpRequest.GET("/hello")
        val body = client.toBlocking().retrieve(request)
        assertNotNull(body)
        assertEquals("Hello World of Cats", body)
    }
}