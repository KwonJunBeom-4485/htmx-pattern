package com.example.ui.scroll;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.example.ui.common.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * [패턴 3] 무한 스크롤 컨트롤러
 * 페이지 번호(page)를 받아 해당 순번의 회원 목록 조각을 반환
 */
@WebServlet("/patterns/p3-scroll")
public class ScrollServlet extends HttpServlet {
    private static final int PAGE_SIZE = 10;
    private static final int MAX_MEMBERS = 50; // 최대 50명까지 제한(테스트를 위해)

    // page 값을 받아서 출력하는 GET 방식의 메서드
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 현재 페이지 파라미터 확인(기본 값 1)
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

        // 데이터 생성 구간 계산(페이지네이션 - 페이지 작업은 PAGE_SIZE로 전체 데이터를 나눠서 구분)
        // 50개의 데이터(시작 값이 0)를 나누는 경우, PAGE 값은? 0 ~ 4 이렇게 나오기 때문에 +1로 페이지 표기
        int startId = (currentPage - 1) * PAGE_SIZE + 1; // 시작 데이터의 id 값(primary key - index 값)

        // 데이터 저장할 List 선언
        List<Member> members = new ArrayList<>();

        // 데이터가 최대 사이즈 값(MAX_MEMBERS)를 넘기지 않는 경우에만 생성.
        if (startId <= MAX_MEMBERS) {
            for (int i = 0; i < PAGE_SIZE; i++) { // PAGE_SIZE 크기만큼 출력해야 하기 때문에
                long id = startId + i;
                if (id > MAX_MEMBERS)
                    break;

                // auth는 사용자를 관리자와 일반으로 구분
                members.add(Member.of(id, "사용자" + id, "user" + id + "@example.com", (id % 3 == 0) ? "Admin" : "User"));

            }
        }

        // 사용자 정보와 페이지 정보를 전달하기 위해서 저장.
        req.setAttribute("members", members);
        req.setAttribute("nextPage", currentPage + 1);
        req.setAttribute("hasMore", (startId + PAGE_SIZE) <= MAX_MEMBERS);

        // 지연 시간 효과를 줘서 실제 작업하는 것처럼 만들어줌.(실무에선 존재x)
        try { Thread.sleep(500); } catch(InterruptedException e) {}

        // 포워드 처리...
        req.getRequestDispatcher("/WEB-INF/fragments/scroll/member-rows.jsp").forward(req, resp);
    }

}
