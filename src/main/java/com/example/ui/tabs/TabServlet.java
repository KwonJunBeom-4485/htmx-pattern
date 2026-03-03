package com.example.ui.tabs;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/patterns/p5-tabs")
public class TabServlet extends HttpServlet {

    // GET 메서드로 요청 시 작업을 정의
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 파라미터의 type 값을 통해서 보여질 fragment jsp를 결정(info.jsp, setting.jsp, logs.jsp)
        String type = req.getParameter("type");

        // 타입에 대한 파라미터가 없는 경우, default 설정
        if (type == null)
            type = "info";

        // 각 탭 별 필요한 데이터 세팅 후 전달...
        switch (type) {
            case "info":
                req.setAttribute("serverTime", LocalDateTime.now());
                req.setAttribute("version", "Jakarta EE 11 / HTMX 2.0");
                break;
            case "settings":
                req.setAttribute("notifications", true);
                req.setAttribute("theme", "Dark Mode");
                break;
            case "logs":
                req.setAttribute("logs", List.of(
                        "17:19:23 - 사용자 로그인 성공",
                        "17:19:24 - 데이터베이스 연결 성공",
                        "17:19:29 - 데이터 로드 성공",
                        "17:19:31 - 시스템 리소스 사용률 (CPU 97.2% | Memory 99%)"));
                break;
        }

        // 해당 타입의 JSP 조건으로 이동
        String fragmentsPath = "/WEB-INF/fragments/tabs/" + type + ".jsp";
        req.getRequestDispatcher(fragmentsPath).forward(req, resp);
    }

}
