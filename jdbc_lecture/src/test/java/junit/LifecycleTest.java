package junit;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

// @Order 를 사용하기 위해
// @Order : 테스트 메서드의 실행 순서 조작
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class LifecycleTest {

    @BeforeAll
    static void beforeAll() {
        System.out.println("beforeAll : 모든 테스트 전 1회 실행");
    }

    @BeforeEach
    void beforeEach() {
        System.out.println("beforeEach : 각 테스트 전 1회 실행");
    }

    @AfterAll
    static void afterAll() {
        System.out.println("AfterAll : 모든 테스트 후 1회 실행");
    }

    @AfterEach
    void afterEach() {
        System.out.println("afterEach : 각 테스트 후 1회 실행");
    }

    @Test
    @Order(3)
    void testOne() {
        System.out.println("test : 테스트 1 실행");
    }

    @Test
    @Order(2)
    void testTwo() {
        System.out.println("test : 테스트 2 실행");
    }

    @Test
    @Order(1)
    void testThree() {
        System.out.println("test : 테스트 3 실행");
    }
}