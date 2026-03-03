<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 반복문으로 tr을 생성해서 추가... c:forEach 구문 사용 -->
<c:forEach var="m" items="${members}" varStatus="status">
    <c:choose>
        <%-- 리스트(항목)의 마지막 요소인 경우에는 트리거를 추가. --%>
        <c:when test="${status.last && hasMore}">
            <tr class="hover:bg-slate-50 transition border-b border-slate-100" hx-get="${pageContext.request.contextPath}/patterns/p3-scroll?page=${nextPage}" hx-trigger="intersect once" hx-swap="afterend" hx-indicator="#scroll-indicator">
                <td class="px-6 py-4 text-sm text-slate-600">${m.id()}</td>
                <td class="px-6 py-4 text-sm text-slate-600">${m.name()}</td>
                <td class="px-6 py-4 text-sm text-slate-600">${m.email()}</td>
                <td class="px-6 py-4"><span class="px-2 py-1 bg-slate-100 text-slate-600 text-xs rounded-full font-bold">${m.auth()}</span></td>
            </tr>
        </c:when>
        <%-- 마지막이 아닌 일반 요소 --%>
        <c:otherwise>
            <tr class="hover:bg-slate-50 transition border-b border-slate-100">
                <td class="px-6 py-4 text-sm text-slate-600">${m.id()}</td>
                <td class="px-6 py-4 text-sm text-slate-600">${m.name()}</td>
                <td class="px-6 py-4 text-sm text-slate-600">${m.email()}</td>
                <td class="px-6 py-4"><span class="px-2 py-1 bg-slate-100 text-slate-600 text-xs rounded-full font-bold">${m.auth()}</span></td>
            </tr>
        </c:otherwise>
    </c:choose>
</c:forEach>
<%-- 모든 데이터를 다 출력한 경우에 메시지 출력 --%>
<c:if test="${!hasMore && not empty members}">
    <tr>
        <td colspan="4" class="px-6 py-8 text-center bg-slate-50 text-slate-400 text-sm italic">
            모든 데이터를 불러왔습니다.
        </td>
    </tr>
</c:if>