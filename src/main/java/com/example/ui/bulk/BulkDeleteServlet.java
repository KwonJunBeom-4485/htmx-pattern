package com.example.ui.bulk;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import com.example.ui.common.Member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * [패턴 4] 벌크 삭제 컨트롤러
 * 체크박스로 선택된 ID들을 받아 삭제 로직을 수행.
 */
@WebServlet("/patterns/p4-bulk")
public class BulkDeleteServlet extends HttpServlet {

    // 테스트용 인메모리 저장소
    private static final Map<Long, Member> repository = new ConcurrentHashMap<>();

    // 초기 작업 시 사용자 데이터를 생성(10명)
    @Override
    public void init() throws ServletException {
        // 초기 데이터 로드(10명)
        for (long i = 1; i <= 10; i++) {
            repository.put(i, Member.of(i, "회원" + i, "user" + i + "@example.com", "User"));
        }
    }

    // 초기 생성된 사용자 정보를 View에 전달(jsp)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 현재 목록을 리스트로 변환해서 전달. ("/WEB-INF/fragments/bulk/member-table.jsp")

        // 1. repository(데이터 타입 : Map -> 순서가 없음) 때문에 정렬해서 전달
        // getSortedMembers() 메서드 구현 이유
        req.setAttribute("members", getSortedMembers());
        // 2. request 객체 저장해서 포워드 처리
        req.getRequestDispatcher("/WEB-INF/fragments/bulk/member-table.jsp").forward(req, resp);
    }

    // View로부터 받은 ids값을 이용해서 삭제 작업 진행. fragments 태그를
    // 전달(/WEB-INF/fragments/bulk/member-table.jsp)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 폼에서 전송된 ids 파라미터 배열을 추출해서 삭제 작업 진행...
        String[] selectedIds = req.getParameterValues("ids");

        // 체크가 있는 경우(검증)
        if (selectedIds != null && selectedIds.length > 0) { // 검증 후 삭제
            for (String idStr : selectedIds) {
                Long id = Long.parseLong(idStr);
                repository.remove(id);
            }
        } else { // 체크가 없는 경우
            // 선택한 항목이 없는 경우, 422(응답 상태 코드) 에러와 메시지 전송
            resp.setStatus(422);
            req.setAttribute("errorMessage", "삭제할 항목을 선택해주세요."); // 공용으로 만든 errorMessage
            req.getRequestDispatcher("/WEB-INF/fragments/common/error-alert.jsp").forward(req, resp);
            return;
        }

        // 삭제 후 최신 목록으로 업데이트 처리 된 fragment가 보이게 포워드
        req.setAttribute("members", getSortedMembers());
        req.getRequestDispatcher("/WEB-INF/fragments/bulk/member-table.jsp").forward(req, resp);
    }

    // 정렬할 메서드
    private List<Member> getSortedMembers() {
        return repository.values().stream().sorted((a, b) -> a.id().compareTo(b.id())).collect(Collectors.toList());
    }

}
