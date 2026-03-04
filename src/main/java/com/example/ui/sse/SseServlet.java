package com.example.ui.sse;

import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;

/**
 * [패턴 6] SSE 알림 컨트롤러
 * text/event-stream 형식을 사용하여 브라우저에 데이터를 푸시합니다.
 */

@WebServlet("/patterns/p6-sse")
public class SseServlet extends HttpServlet {

    // 이벤트로 전송할 메시지
    private final String[] messages= {
        "새로운 회원이 가입했습니다!",
        "시스템 백업이 성공적으로 완료되었습니다.",
        "로그인 시도가 감지되었습니다. (IP: 192.168.0.1)",
        "서버 리소스 사용량이 90%를 초과했습니다.",
        "새로운 공지사항이 등록되었습니다."
    };

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // SSE 처리 
        // 1. SSE 헤더 설정 (필수)
        resp.setContentType("text/event-stream");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Connection", "keep-alive");

        // notification-toast.jsp에 내용이 없음... 이제부터 생성. 
        // out 객체를 생성. 이 객체는 응답(reponse)객체에 쓸 내용으로 response부터 객체 얻음.
        PrintWriter out = resp.getWriter();
        // Random을 통해 메시지 및 전송시간을 랜덤하게 처리
        Random random = new Random();

        // 실무에서는 메시지 큐 또는 이벤트 버스를 통해서 처리하지만, 예제를 위해서 무한 루프로
        // 시뮬레이션 하겠습니다. 
        try {
            for (int i = 0; i < 5; i++) {
                String randomMsg = messages[random.nextInt(messages.length)];
                String timestamp = LocalTime.now().withNano(0).toString();

                // 2. 이벤트 전송 형식 구성
                // event : 이름 (HTMX의 sse-swap과 매칭)
                // data : 메시지 본문 (HTML 조각이 가능)
                // ###jsp를 사용하지 않는 경우 코드###
                /*
                out.write("event: system-alert\n");
                out.write("data: <div class='notification-item p-4 mb-3 bg-white border-1-4 border-indigo-500 shadow-lg "
                    +"rounded-r-xl animate-in slide-in-from-right duration-500'");
                out.write("<div class='flex items-center jutify-between'>");
                out.write("<span class='text-xs font-bold text-indigo-600 uppercase tracking-tighter'>"
                    +"System Notification</span>");
                out.write("<span class='text-[10px] text-gray-400'>"+timestamp+"</span>");
                out.write("</div>");
                out.write("<p class='text-sm text-gray-800 mt-1 font-medium'>"+randomMsg+"</p>");
                out.write("</div>\n\n");  // SSE 데이터의 끝은 반드시 줄바꿈 두번 사용해야 함(\n\n)

                out.flush();   // 즉시 전송
                */

                // JSP 랜더링 결과를 전달하기 위해서 
                // 1. JSP 랜더링 결과를 캡쳐
                //  일반적으로 forward/include는 응답을 즉시 브라우저로 전송 처리
                //  스트림 전송을 위해서는 결과물을 메모리(CharArrayWriter)에 가로채야 합니다.
                CharArrayWriter charWriter = new CharArrayWriter();
                //  바로 전달하지 못하게 포장된 데이터를 생성하기 위해서 
                HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(resp) {
                    @Override 
                    public PrintWriter getWriter() throws IOException {
                        return new PrintWriter(charWriter);
                    };
                };

                // 2. JSP에 데이터를 전달 및 랜더링 수행
                req.setAttribute("message", randomMsg);
                req.setAttribute("timestamp", timestamp);
                req.getRequestDispatcher("/WEB-INF/fragments/sse/notification-toast.jsp")
                    .include(req, responseWrapper);

                // 3. 랜더링된 HTML 추출하고 SSE 규격에 맞게 정제
                // SSE 데이터 필드 내에 줄바꿈(\n)이 있으면 프로코콜 오류가 발생합니다. 
                String htmlFragment = charWriter.toString().trim().replace("\n", " ")
                .replace("\r", " ");

                // 4. 추출한 htmlFragment를 SSE 형식 맞춰 이벤트 전송 처리 
                // event: 명칭 \n data: 내용 \n\n 
                out.write("event: system-alert\n");
                out.write("data: "+htmlFragment+"\n\n");
                out.flush();

                // 메시지 전송 간의 간격을 주기 위해서 (3 ~ 7 초)
                Thread.sleep(3000 + random.nextInt(4000));
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }

    }

    
}
