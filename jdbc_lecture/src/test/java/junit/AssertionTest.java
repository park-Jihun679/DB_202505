package junit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

public class AssertionTest {

    @Test
    void assertTests() {
        // 두 값이 동일한지 확인
//        assertEquals(4, 2*2, "곱셈 결과 확인");

        // 조건식이 true 인지
//        assertTrue(5 == 1, "조건이 참인지 확인");

        assertNotNull(new Object(), "객체가 null 이 아님을 확인");

        Exception exception = assertThrows(ArithmeticException.class, () -> {
            int result = 1/0;
        });

        assertEquals("/ by zero", exception.getMessage());
    }



}
