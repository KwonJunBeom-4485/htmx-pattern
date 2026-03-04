<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>실시간 알림 패턴 (SSE)</title>
        <!-- 1. HTMX 2.0 로드 -->
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <!-- 2. HTMX 2.0 Extension 로드 -->
        <script src="https://unpkg.com/htmx-ext-sse@2.2.2/sse.js"></script>
        <!-- 3. tailwindcss 로드 -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-600 p-6 md:p-12 min-h-screen text-white">
        <div class="max-w-3xl mx-auto">
            <header class="mb-12">
                <a href="" class="text-indigo-400 hover:text-indigo-300 text-sm font-bold">← 홈으로 돌아가기</a>
                <h1 class="text-4xl font-bold mt-2 tracking-tight">Pattern 06: 실시간 알림</h1>
                <p class="text-gray-400">Server Sent Events를 통한 단방향 푸시 알림 시스템</p>
            </header>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-10">
                <!-- 상태 판넬 -->
                <div class="dg-gray-700 p-8 rounded-3xl border border-gray-700 shadow-2xl">
                    <h2 class="txtx-xl font-bold mb-6 flex items-center">
                        <span class="relative flex h-3 w-3 mr-3">
                            <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                            <span class="relative inline-flex rounded-full h-3 w03 bg-grren-500"></span>
                        </span>
                        서버 연결 상태
                    </h2>
                    <div class="space-y-4">
                        <div class="flex justify-between items-center p-4 bg-gray-800">
                            <span class="text-sm text-gray-400">프로토콜</span>
                            <span class="text-sm font-mono text-indigo-400 italic">HTTP/1.1 SSE </span>
                        </div>
                        <div>
                            <span class="text-sm text-gray-400">데이터 형식</span>
                            <span class="text-sm font-mono text-indigo-400 italic">text/event-stream</span>
                        </div>
                        <div>
                            서버 서블릿은 3~7초 간격으로 새로운 이벤트를 발생시킵니다.
                            브라우저 개발자 도구의 <strong>network -> EventStream</strong> 탭에서 실제 통신 데이터를 확인할 수 있습니다.
                        </div>
                    </div>
                </div>
                <!-- 알림 수신 영역 (HTMX SSE 핵심 영역) -->
                <div class="flex flex-col">
                    <h2 class="text-xl font-bold mb-4">Live Alerts</h2>

                    <!-- SSE 연결 설정 -->
                    <div hx-ext="sse"
                    sse-connect="${pageContext.request.contextPath}/patterns/p6-sse"
                    class="flex-grow">

                    <div sse-swap="system-alert"
                    hx-swap="afterbegin"
                    id="notifications-container"
                    class="space-y-4">

                    <!-- 초기 상태 메시지 -->
                    <div class="p-4 bg-gray-800 border border-dashed border-gray-600 rounded-xl text-center text-gray-500 text-sm">
                        서버로부터의 첫 알림을 기다리는 중...
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div><script>
    document.body.addEventListener('htmx:sseMessage', function(evt) {
        const container = document.getElementById('notifications-container');
        const items = container.getElementsByClassName('notification-item');
        if (items.length > 5) {
            container.removeChild(items[items.length - 1]);
        }
    });
</script>

</body>
</html>