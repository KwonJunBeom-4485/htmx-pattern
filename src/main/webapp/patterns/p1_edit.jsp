<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>인라인 편집 패턴</title>
        <!-- 기능 추가 (cdn) -->
        <!-- 1. htmx 기능을 위한 라이브러리 추가 -->
        <script src="https://unpkg.com/htmx.org@2.0.0"></script>
        <!-- 2. tailwind css 추가 -->
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <!-- tailwind css 적용 -->
    <body class="bg-gray-100 p-10">
        <div class="max-w-2xl mx-auto">
            <header class="mb-6">
                <a href="#" class="text-blue-600 hover:underline">← 홈으로 돌아가기</a>
                <h1 class="text-3xl font-bold mt-2">Pattern 01: 인라인 편집</h1>
                <p class="text-gray-600">클릭하면 즉시 입력 폼으로 변환되는 UI입니다.</p>
            </header>

            <!-- 데이터가 로드 될 영역 -->
            <div id="contact-card" class="bg-white rounded-xl shadow-lg border border-gray-200 overflow-hidden">
                <!-- 초기 데이터 로드(서버 사이드 포함) : htmx 사용 -->
                <div hx-get="${pageContext.request.contextPath}/patterns/p1-edit?id=1" hx-trigger="load" hx-swap="outerHTML">
                    <div class="p-8 text-center text-gray-400">데이터를 불러오는 중.....</div>
                </div>

            </div>
        </div>
    </body>
</html>