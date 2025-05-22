package jdbc.common;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

class JDBCUtilTest {

    @Test
    @Disabled("db 접속 연습")
    void testConnection() throws ClassNotFoundException {

        /*
        1. 연결 만들기
        -> url, 사용자 계정(id), 비밀번호(password)
         */

        String url = "jdbc:mysql://localhost:3306/testdb";
        String id = "root";
        String password = "1234";

        // connector 연결하면 쓸 필요 없음
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(url, id, password)) {
            System.out.println("연결 성공!");

            // 객체 생성이 제대로 되었는지 확인
            assertNotNull(conn);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}