package com.example.ui.validation;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * [패턴 2] 실시간 점증 컨트롤러
 * 사용자가 입력한 이메일의 중복 여부를 실시간으로 체크
 */

@WebServlet("/patterns/p2-validation")
public class ValidationServlet extends HttpServlet {
    
    // 중복 테스트를 할 가상의 이메일 데이터 셋
    private static final Set<String> existingEmails = Set.of(
        "test@example.com",
        "admin@example.com",
        "user@example.com"
    );

    // GET 방식으로 들어오는 경우에 동작
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // email 중복 여부 검사 동작
        // 1. request 객체로 전달된 email을 받기
        String email = req.getParameter("email");

        // 2. 기본 유효성 검사(email 타입 여부 확인)
        // 1) email 존재 여부 검사
        if(email == null || email.isBlank()) {
            // 아무것도 입력 안했을 때 메시지 처리
            resp.getWriter().write(""); // 빈 메시지 처리
            return;
        }
        if(!email.contains("@")) {
            req.setAttribute("isValid", false);
            req.setAttribute("message", "올바른 이메일 형식이 아닙니다.");
        } else if(existingEmails.contains(email)) { // 3. 중복 검사
            // 4. 결과 처리(사용 중)
            req.setAttribute("isValid", false);
            req.setAttribute("message", "이미 사용 중인 이메일 입니다.");

        } else {
            // 4. 결과 처리(미사용)
            req.setAttribute("isValid", true);
            req.setAttribute("message", "사용 가능한 이메일 입니다.");
        }

        req.getRequestDispatcher("/WEB-INF/fragments/validation/validation-result.jsp").forward(req, resp);
    }

    
}
