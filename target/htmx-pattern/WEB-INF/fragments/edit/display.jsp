<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="p-8 transition-all duration-300 animate-in fade-in" id="member-display-${member.id()}">
    <div class="flex justify-between items-start mb-6">
        <div>
            <h2 class="text-2xl font-bold text-gray-800">${member.name()}</h2>
            <p class="text-indigo-600 font-medium">${member.auth()}</p>
        </div>
        <span class="px-3 py-1 bg-green-100 text-green-700 text-xs font-bold rounded-full">
            ${member.status()}
        </span>
    </div>
    
    <div class="space-y-3 mb-8">
        <div class="flex items-center text-gray-600">
            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/></svg>
            ${member.email()}
        </div>
        <div class="flex items-center text-gray-400 text-sm">
            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
            가입일: ${member.createdAt()}
        </div>
    </div>

    <!-- 수정 버튼: 클릭 시 이 div 전체를 서버가 주는 편집 폼으로 교체 -->
    <button hx-get="${pageContext.request.contextPath}/patterns/p1-edit?action=edit&id=${member.id()}"
            hx-target="closest div[id^='member-display']"
            hx-swap="outerHTML"
            class="w-full bg-slate-800 text-white py-2 rounded-lg hover:bg-slate-900 transition font-bold">
        프로필 수정하기
    </button>
</div>