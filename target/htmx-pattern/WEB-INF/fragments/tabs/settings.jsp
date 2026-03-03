<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="animate-in slide-in-from-left-4 duration-300">
    <h3 class="text-2xl font-bold text-slate-800 mb-8">대시보드 환경 설정</h3>
    <form class="space-y-6">
        <div class="flex items-center justify-between p-4 hover:bg-slate-50 rounded-xl transition">
            <div>
                <p class="font-bold text-slate-700">푸시 알림 활성화</p>
                <p class="text-sm text-slate-500">서버 상태 변화를 실시간으로 브라우저에 표시합니다.</p>
            </div>
            <input type="checkbox" checked class="w-12 h-6 bg-indigo-600 rounded-full appearance-none relative cursor-pointer outline-none">
        </div>
        <div class="flex items-center justify-between p-4 hover:bg-slate-50 rounded-xl transition border-t">
            <div>
                <p class="font-bold text-slate-700">UI 테마 설정</p>
                <p class="text-sm text-slate-500">현재 적용된 테마: <span class="text-indigo-600 font-bold">${theme}</span></p>
            </div>
            <select class="bg-white border rounded-lg px-4 py-2 text-sm font-medium outline-none focus:ring-2 focus:ring-indigo-500">
                <option>Light Mode</option>
                <option selected>Dark Mode</option>
                <option>System Default</option>
            </select>
        </div>
    </form>
</div>