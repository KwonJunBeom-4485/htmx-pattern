<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>실시간 검증 처리 패턴</title>
        <!-- 1. htmx 기능을 위한 라이브러리 추가 -->
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <!-- 2. tailwind css 추가 -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-slate-300 p-10">
        <div class="max-w-md mx-auto">
            <header class="mb-10 text-center">
                <a class="text-indigo-600 hover:underline text-sm font-medium" href="${pageContext.request.contextPath}/index.jsp"><- 패턴 목록으로</a>
                <h1 class="text-3xl font-black text-slate-800 mt-4">Pattern 02</h1>
                <p class="text-slate-500">실시간 데이터 유효성 검증</p>
            </header>
            <div class="bg-white p-8 rounded-2xl shadow-xl border-slate-200">
                <form class="space-y-6" action="">
                    <div class="relative">
                        <label class="block text-sm font-bold text-slate-700 mb-2">이메일 주소</label>
                        <!-- 핵심 HTMX 설정 영역 -->
                        <input type="email" name="email" placeholder="example@email.com" class="w-full px-4 py-3 rounded-xl border border-slate-800 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition" hx-get="${pageContext.request.contextPath}/patterns/p2-validation" hx-trigger="keyup changed delay:500ms" hx-target="#email-validation-msg" hx-indicator="#validation-spinner">

                        <!-- 로딩 스피너 (검사 중에 표시) -->
                        <div id="validation-spinner" class="htmx-indicator absolute right-3 top-10">
                            <svg class="animate-spin h-5 w-5 text-indigo-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                            </svg>
                        </div>

                        <!-- 검증 결과 메시지가 렌더링될 타겟 -->
                        <div id="email-validation-msg" class="min-h-[24px]">
                            <!-- 초기 상태는 비어있음 -->
                        </div>

                        <button type="submit" class="w-full bg-slate-900 text-white py-3 rounded-xl font-bold hover:bg-black transition shadow-lg">
                            가입하기
                        </button>
                    </div>
                </form>
            </div>
            <div class="mt-8 p-4 bg-indigo-50 rounded-lg border border-indigo-100 text-xs text-indigo-700">
                <strong>테스트 팁:</strong> <br>
                - <code class="font-mono">test@example.com</code>을 입력하면 중복 오류가 발생합니다.<br>
                - 입력을 멈추고 0.5초 뒤에 결과가 나타납니다.
            </div>
        </div>
    </body>
</html>