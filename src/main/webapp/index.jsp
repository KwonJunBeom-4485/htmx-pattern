<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP + HTMX 실무 UI 패턴 마스터</title>
    
    <!-- HTMX 2.0.0 라이브러리 로드 -->
    <script src="https://unpkg.com/htmx.org@2.0.0"></script>
    <!-- HTMX SSE 확장 프로그램 (패턴 6에서 사용) -->
    <script src="https://unpkg.com/htmx-ext-sse@2.2.2/sse.js"></script>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <style>
        /* HTMX 요청 중일 때 표시할 인디케이터 기본 스타일 */
        .htmx-indicator {
            display: none;
        }
        .htmx-request .htmx-indicator {
            display: inline-block;
        }
        .htmx-request.htmx-indicator {
            display: inline-block;
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-900 font-sans leading-relaxed">

    <div class="min-h-screen flex flex-col">
        <!-- 상단 네비게이션 바 -->
        <nav class="bg-indigo-700 text-white shadow-xl">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <div class="text-2xl font-black tracking-tighter uppercase italic">
                    HTMX <span class="text-indigo-300">Master</span>
                </div>
                <div class="flex space-x-6 items-center">
                    <div class="hidden md:flex space-x-4 text-sm font-bold uppercase tracking-widest text-indigo-200">
                        <span>Jakarta EE 11</span>
                        <span>•</span>
                        <span>Java 21</span>
                    </div>
                    <div class="h-8 w-8 bg-indigo-500 rounded-full flex items-center justify-center border-2 border-indigo-400">
                        <span class="text-xs font-bold">UI</span>
                    </div>
                </div>
            </div>
        </nav>

        <!-- 메인 콘텐츠 영역 -->
        <main class="container mx-auto px-6 py-16 flex-grow">
            <!-- 헤더 섹션 -->
            <div class="max-w-4xl mx-auto text-center mb-16">
                <h1 class="text-5xl font-extrabold text-slate-900 mb-6 tracking-tight">
                    실무 UI 패턴 <span class="text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-blue-500">라이브러리</span>
                </h1>
                <p class="text-xl text-slate-600 font-medium">
                    무거운 자바스크립트 프레임워크 없이, 순수 HTML과 서버의 힘으로 구현하는<br>
                    고성능 모던 웹 아키텍처 실무 예제입니다.
                </p>
            </div>

            <!-- 6가지 패턴 그리드 레이아웃 -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
                
                <!-- 패턴 1: 인라인 편집 -->
                <a href="${pageContext.request.contextPath}/patterns/p1_edit.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-indigo-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-indigo-100 text-indigo-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-indigo-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">인라인 편집</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">페이지 이동 없이 클릭 즉시 입력 폼으로 전환되어 데이터를 수정하는 UX 패턴</p>
                </a>

                <!-- 패턴 2: 실시간 검증 -->
                <a href="${pageContext.request.contextPath}/patterns/p2_validation.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-emerald-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-emerald-100 text-emerald-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-emerald-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">실시간 검증</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">사용자가 입력을 마치기 전, 서버와 통신하여 즉시 데이터 유효성을 피드백하는 패턴</p>
                </a>

                <!-- 패턴 3: 무한 스크롤 -->
                <a href="${pageContext.request.contextPath}/patterns/p3_scroll.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-blue-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-blue-100 text-blue-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-blue-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">무한 스크롤</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">스크롤이 하단에 도달하면 자동으로 다음 페이지 데이터를 가져와 부드럽게 추가</p>
                </a>

                <!-- 패턴 4: 벌크 삭제 -->
                <a href="${pageContext.request.contextPath}/patterns/p4_bulk.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-red-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-red-100 text-red-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-red-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">벌크 액션</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">여러 항목을 선택하여 한 번에 처리하고 목록을 실시간으로 동기화하는 관리자 패턴</p>
                </a>

                <!-- 패턴 5: 탭 대시보드 -->
                <a href="${pageContext.request.contextPath}/patterns/p5_tabs.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-amber-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-amber-100 text-amber-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-amber-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">탭 대시보드</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">전체 페이지 로드 없이 특정 영역의 콘텐츠만 정교하게 교체하는 탭 시스템</p>
                </a>

                <!-- 패턴 6: 실시간 알림 -->
                <a href="${pageContext.request.contextPath}/patterns/p6_sse.jsp" 
                   class="group p-8 bg-white rounded-3xl shadow-sm border border-slate-200 hover:shadow-2xl hover:border-violet-500 hover:-translate-y-2 transition-all duration-300">
                    <div class="w-12 h-12 bg-violet-100 text-violet-600 rounded-2xl flex items-center justify-center mb-6 group-hover:bg-violet-600 group-hover:text-white transition-colors">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"/></svg>
                    </div>
                    <h3 class="text-xl font-bold mb-3">실시간 알림</h3>
                    <p class="text-slate-500 text-sm leading-relaxed">서버 사이드 이벤트(SSE)를 통해 브라우저에 즉각적인 정보를 푸시하는 알림</p>
                </a>

            </div>
        </main>

        <!-- 푸터 -->
        <footer class="bg-white py-10 border-t border-slate-200">
            <div class="container mx-auto px-6 text-center">
                <p class="text-slate-400 text-sm font-medium">
                    &copy; 2024 JSP + HTMX 실무 UI 패턴 마스터 가이드. 
                    <span class="mx-2 text-slate-200">|</span> 
                    Jakarta EE 11 정식 사양 준수
                </p>
            </div>
        </footer>
    </div>

    <!-- HTMX 전역 자바스크립트 설정 -->
    <script>
        /**
         * HTMX 에러 핸들링 가이드 적용
         * 서버에서 4xx(검증 오류), 5xx(서버 오류)가 발생하더라도
         * 응답 본문을 화면에 렌더링하도록 허용하는 전역 설정입니다.
         */
        document.body.addEventListener('htmx:beforeSwap', function(evt) {
            if (evt.detail.xhr.status >= 400) {
                // 에러 코드일 때도 DOM 교체(Swap)를 허용함
                evt.detail.shouldSwap = true;
                // 에러 상태임을 UI에서 알 수 있도록 추가 처리 가능
                evt.detail.isError = false; // HTMX 내부 에러 처리를 우회
            }
        });

        // 로딩 중 로그 출력 (디버깅용)
        document.body.addEventListener('htmx:send', function(evt) {
            console.log('HTMX Request sent to:', evt.detail.pathInfo.path);
        });
    </script>
</body>
</html>