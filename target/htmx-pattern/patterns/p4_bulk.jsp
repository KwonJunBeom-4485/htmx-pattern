<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>벌크 액션 패턴</title>
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-50 p-6 md:p-12">
        <div class="max-w-5xl mx-auto">
            <header class="mb-10 flex justify-between items-end">
                <div>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="text-blue-500 hover:text-blue-700 text-sm font-bold tracking-tight">← BACK TO HOME</a>
                    <h1 class="text-4xl font-black text-gray-900 mt-2">Pattern 04: 벌크 삭제</h1>
                    <p class="text-gray-500">여러 항목을 선택하여 서버 사이드에서 일괄 처리합니다.</p>
                </div>
            </header>

            <!-- 에러 메시지 표시 영역 -->
            <div id="bulk-error-log"></div>

            <div class="bg-white rounded-3xl shadow-xl border border-gray-200 overflow-hidden">
                <!-- HTMX 폼 설정 -->
                <form id="bulk-form">

                    <div class="p-4 bg-gray-50 border-b flex justify-between items-center">
                        <div class="flex items-center space-x-4">
                            <button type="submit" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-xl text-sm font-bold transition flex items-center shadow-lg shadow-red-100"
                            hx-post="${pageContext.request.contextPath}/patterns/p4-bulk"
                            hx-target="#member-table-container"
                            hx-confirm="정말로 선택한 항목들을 삭제하시겠습니까?"
                            hx-indicator="#bulk-loading">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                            선택 삭제
                        </button>
                        <span id="bulk-loading" class="htmx-indicator animate-bounce text-red-500 text-xs font-bold">처리 중...</span>
                    </div>
                    <div class="text-sm text-gray-400 font-medium">
                        체크박스를 선택하고 버튼을 누르세요.
                    </div>
                </div>

                <!-- 실시간 테이블 데이터 영역 -->
                <div id="member-table-container">
                    <div hx-get="${pageContext.request.contextPath}/patterns/p4-bulk" hx-trigger="load" hx-swap="outerHTML">
                        <div class="p-20 text-center animate-pulse text-gray-300">데이터를 로드하고 있습니다...</div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 전체 선택/해제 기능
        function toggleAll(source) {
            const checkboxes = document.getElementsByName('ids');
            for(let i=0; i<checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
        
        // 에러 발생 시 로그 영역으로 타겟 변경 (공통 설정 활용)
        document.body.addEventListener('htmx:beforeSwap', function(evt) {
            if(evt.detail.xhr.status === 422) {
                evt.detail.shouldSwap = true;
                evt.detail.target = htmx.find("#bulk-error-log");
            }
        });
    </script>
</body>
</html>