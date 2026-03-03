<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="animate-in zoom-in-95 duration-200">
    <div class="flex justify-between items-center mb-6">
        <h3 class="text-2xl font-bold text-slate-800">최근 보안 활동</h3>
        <button class="text-xs font-bold text-indigo-600 hover:text-indigo-800 uppercase tracking-tighter">로그 비우기</button>
    </div>
    <div class="space-y-3">
        <c:forEach var="log" items="${logs}">
            <div class="p-4 bg-slate-900 rounded-xl text-green-400 font-mono text-sm border-l-4 border-green-500 shadow-lg">
                <span class="text-slate-500 mr-2">></span> ${log}
            </div>
        </c:forEach>
    </div>
</div>
