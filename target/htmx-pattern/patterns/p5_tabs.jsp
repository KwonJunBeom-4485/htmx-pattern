<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>탭 대시보드 패턴</title>
    <script src="https://unpkg.com/htmx.org@2.0.0"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* 활성화된 탭 스타일 */
        .tab-button.active {
            border-bottom: 3px solid #4f46e5;
            color: #4f46e5;
            font-weight: 800;
        }
    </style>
</head>
<body class="bg-slate-50 p-6 md:p-12">
    <div class="max-w-4xl mx-auto">
        <header class="mb-10">
            <a href="${pageContext.request.contextPath}/index.jsp" class="text-indigo-600 hover:underline text-sm font-bold">← BACK TO HOME</a>
            <h1 class="text-4xl font-black text-slate-900 mt-2 tracking-tight">Pattern 05: 탭 대시보드</h1>
            <p class="text-slate-500">페이지 새로고침 없이 조각(Fragment)을 교체하여 상태를 유지합니다.</p>
        </header>

        <!-- 탭 네비게이션 바 -->
        <div class="bg-white rounded-t-3xl border-x border-t border-slate-200 shadow-sm overflow-hidden">
            <div class="flex border-b border-slate-100" id="tabs-nav">
                <button hx-get="${pageContext.request.contextPath}/patterns/p5-tabs?type=info" 
                        hx-target="#tab-content"
                        class="tab-button active px-8 py-5 text-sm font-medium hover:bg-slate-50 transition-all flex items-center"
                        onclick="setActiveTab(this)">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" stroke-width="2" stroke-linecap="round"/></svg>
                    시스템 정보
                </button>
                <button hx-get="${pageContext.request.contextPath}/patterns/p5-tabs?type=settings" 
                        hx-target="#tab-content"
                        class="tab-button px-8 py-5 text-sm font-medium text-slate-500 hover:bg-slate-50 transition-all flex items-center"
                        onclick="setActiveTab(this)">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" stroke-width="2" stroke-linecap="round"/></svg>
                    환경 설정
                </button>
                <button hx-get="${pageContext.request.contextPath}/patterns/p5-tabs?type=logs" 
                        hx-target="#tab-content"
                        class="tab-button px-8 py-5 text-sm font-medium text-slate-500 hover:bg-slate-50 transition-all flex items-center"
                        onclick="setActiveTab(this)">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" stroke-width="2" stroke-linecap="round"/></svg>
                    보안 로그
                </button>
            </div>
        </div>

        <!-- 탭 컨텐츠가 렌더링될 실제 영역 -->
        <div id="tab-content" class="bg-white rounded-b-3xl shadow-xl p-10 border-x border-b border-slate-200 min-h-[400px]">
            <div hx-get="${pageContext.request.contextPath}/patterns/p5-tabs?type=info" 
                 hx-trigger="load" 
                 hx-swap="innerHTML">
                 <div class="animate-pulse flex space-x-4">
                     <div class="flex-1 space-y-4 py-1">
                         <div class="h-4 bg-slate-200 rounded w-3/4"></div>
                         <div class="space-y-2">
                             <div class="h-4 bg-slate-200 rounded"></div>
                             <div class="h-4 bg-slate-200 rounded w-5/6"></div>
                         </div>
                     </div>
                 </div>
            </div>
        </div>
    </div>

    <script>
        // 자바스크립트를 최소화하여 활성 탭 UI 제어
        function setActiveTab(element) {
            // 모든 버튼에서 active 클래스 제거
            const btns = document.querySelectorAll('.tab-button');
            btns.forEach(b => {
                b.classList.remove('active', 'text-indigo-600');
                b.classList.add('text-slate-500');
            });
            // 클릭된 버튼에 active 클래스 추가
            element.classList.add('active', 'text-indigo-600');
            element.classList.remove('text-slate-500');
        }
    </script>
</body>
</html>
