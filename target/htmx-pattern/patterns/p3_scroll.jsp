<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>무한 스크롤 기능</title>
        <!-- 1. htmx 기능을 위한 라이브러리 추가 -->
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <!-- 2. tailwind css 추가 -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-slate-300 p-4 md:p-10">
        <div class="max-w-4xl mx-auto">
            <header class="mb-10 text-center">
                <a class="text-indigo-600 hover:underline text-sm font-medium" href="${pageContext.request.contextPath}/index.jsp"><- 홈으로</a>
                <h1 class="text-3xl font-black text-slate-800 mt-4">Pattern 03: 무한 스크롤</h1>
                <p class="text-slate-500">스크롤 시에 다음 데이터를 자동으로 가져와 리스트에 추가합니다.</p>
            </header>
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 overflow-hidden">
                <table class="min-w-full divide-y divide-slate-200">
                    <thead class="bg-slate-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-bold text-slate-500 uppercase">ID</th>
                            <th class="px-6 py-3 text-left text-xs font-bold text-slate-500 uppercase">이름</th>
                            <th class="px-6 py-3 text-left text-xs font-bold text-slate-500 uppercase">이메일</th>
                            <th class="px-6 py-3 text-left text-xs font-bold text-slate-500 uppercase">가입 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 초기 로드 트리거 -->
                        <tr hx-get="${pageContext.request.contextPath}/patterns/p3-scroll?page=1" hx-trigger="load" hx-target="this" hx-swap="outerHTML">
                            <td colspan="4" class="px-6 py-10 text-center text-slate-400">목록을 불러오는 중...</td>
                        </tr>
                    </tbody>
                </table>
                <!-- 하단 로딩 표시기 -->
                <div id="scroll-indicator" class="htmx-indicator p-4 flex justify-center items-center bg-slate-50 border-t border-slate-200">
                    <svg class="animate-spin h-6 w-6 text-indigo-600 mr-2" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    <span class="text-slate-600 font-medium">추가 데이터 로딩 중...</span>
                </div>
            </div>
        </div>
    </body>
</html>