<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="notification-item p-4 mb-3 bg-white border-l-4 border-indigo-500 shadow-lg rounded-r-xl animate-in slide-in-from-right duration-500">
    <div class="flex items-center justify-between">
        <span class="text-xs font-bold text-indigo-600 uppercase tracking-tighter">System Notification</span>
        <span class="text-[10px] text-gray-400">${timestamp}</span>
    </div>
    <p class="text-sm text-gray-800 mt-1 font-medium">${message}</p>
</div>