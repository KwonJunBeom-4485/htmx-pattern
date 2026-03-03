<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="animate-in fade-in duration-300">
    <h3 class="text-2xl font-bold text-slate-800 mb-6 flex items-center">
        <span class="w-2 h-8 bg-indigo-600 mr-4 rounded-full"></span>
        시스템 현재 상태
    </h3>
    <div class="grid grid-cols-2 gap-6">
        <div class="p-6 bg-slate-50 rounded-2xl border border-slate-100">
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">서버 시간</p>
            <p class="text-xl font-black text-slate-700">${serverTime}</p>
        </div>
        <div class="p-6 bg-slate-50 rounded-2xl border border-slate-100">
            <p class="text-xs font-bold text-slate-400 uppercase tracking-widest mb-1">엔진 버전</p>
            <p class="text-xl font-black text-slate-700">${version}</p>
        </div>
    </div>
    <div class="mt-8 p-6 bg-indigo-50 rounded-2xl border border-indigo-100">
        <p class="text-sm text-indigo-700 leading-relaxed">
            본 시스템은 <strong>Jakarta EE 11</strong> 사양을 기반으로 구동되며,
            모든 컴포넌트는 무상태(Stateless) 아키텍처를 따르고 있습니다.
        </p>
    </div>
</div>