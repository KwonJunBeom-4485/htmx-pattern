package com.example.ui.edit;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.concurrent.ConcurrentHashMap;

import com.example.ui.common.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * [패턴 1] 인라인 편집 컨트롤러
 * GET : 상세 보기 또는 편집 폼 변환(View Mode -> (Swap) -> Edit Mode)
 * POST : 데이터 업데이트 후 상세 보기 반환(Edit Mode -> VIew Mode)
 */

@WebServlet("/patterns/p1-edit")
public class InlineEditServlet extends HttpServlet {

    // DB를 구성해서 작업해도 되지만, 인메모리 형태로 저장소 처리를 해볼거에요~
    private static final ConcurrentHashMap<Long, Member> repository = new ConcurrentHashMap<>();

    // 서블릿 초기 시 동작 : 초기화자
    @Override
    public void init() throws ServletException {
        // 서블릿이 생성 되었을 때 최초의 사용자의 추가 작업을 진행하려고 함(샘플 데이터 생성)
        repository.put(1L, new Member(1L, "홍길동", "hong@test.com", "Admin", "active", new Timestamp(System.currentTimeMillis())));
    }

    // 메서드 GET일 때
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 모드 별 연결하는 뷰를 달리 둘 수 있어용. 모드 정보는 "action" 파라미터로 결정
        // 1. 파라미터 값 불러오기
        String action = req.getParameter("action"); // action 값에 따라 모드 결정(edit = 편집, 이외는 view 모드)
        Long id = Long.parseLong(req.getParameter("id"));

        // 2. 저장소에 있는 정보를 불러옴
        Member member = repository.get(id); // 위에 선언되어 있는 repository에서 key가 id인 값을 불러옴.

        // 3. 모드 별로 전달할 정보를 request 객체에 저장
        req.setAttribute("member", member);

        // 4. action 값에 따른 view 선택 작업(포워드 처리)
        if ("edit".equals(action)) {
            // Edit 모드
            // 편집 모드 조각을 반환
            req.getRequestDispatcher("/WEB-INF/fragments/edit/edit-form.jsp").forward(req, resp);
        } else {
            // View 모드
            // 상세 보기 모드 조각 반환
            req.getRequestDispatcher("/WEB-INF/fragments/edit/display.jsp").forward(req, resp);
        }
    }

    // 메서드 POST일 때
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 메서드를 통해서 전달된 내용을 처리하고, View 모드로 포워드 처리
        // 1. 파라미터 값을 읽기
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String auth = req.getParameter("auth");
        
        // 2. 유효성 검사
        if(name == null || name.isBlank() || email == null || !email.contains("@")) {
            // 예외 발생 처리
            resp.setStatus(422);
            req.setAttribute("errorMessage", "이름과 올바른 이메일 형식이 필요합니다.");
            req.getRequestDispatcher("/WEB-INF/fragments/common/eror-alert.jsp").forward(req, resp);
            return;
        }
        
        // 3. 데이터 업데이트
        Member updateMember = new Member(id, name, email, auth, "active", new Timestamp(System.currentTimeMillis()));
        repository.put(id, updateMember);

        // 4. 업데이트 처리 후 보기모드로 전환(포워드)
        req.setAttribute("member", updateMember);
        req.getRequestDispatcher("/WEB-INF/fragments/edit/display.jsp").forward(req, resp);
    }

}
