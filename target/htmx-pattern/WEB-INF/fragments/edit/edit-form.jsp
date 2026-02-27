<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="p-8 bg-indigo-50 border-2 border-indigo-200 animate-in zoom-in-95 duration-200" id="member-edit-${member.id()}">
    <h3 class="text-lg font-bold text-indigo-900 mb-4">정보 수정</h3>

    <form hx-post="${pageContext.request.contextPath}/patterns/p1-edit"
    hx-target="this"
    hx-swap="outerHTML"
    class="space-y-4">

    <input type="hidden" name="id" value="${member.id()}">

    <div>
        <label class="block text-sm font-bold text-indigo-700 mb-1">이름</label>
        <input type="text" name="name" value="${member.name()}" required
        class="w-full p-2 border border-indigo-300 rounded focus:ring-2 focus:ring-indigo-500 outline-none">
    </div>

    <div>
        <label class="block text-sm font-bold text-indigo-700 mb-1">이메일</label>
        <input type="email" name="email" value="${member.email()}" required
        class="w-full p-2 border border-indigo-300 rounded focus:ring-2 focus:ring-indigo-500 outline-none">
    </div>

    <div>
        <label class="block text-sm font-bold text-indigo-700 mb-1">역할</label>
        <select name="auth" class="w-full p-2 border border-indigo-300 rounded focus:ring-2 focus:ring-indigo-500 outline-none">
            <option value="Admin" ${member.auth() == 'Admin' ? 'selected' : ''}>Admin</option>
            <option value="User" ${member.auth() == 'User' ? 'selected' : ''}>User</option>
            <option value="Editor" ${member.auth() == 'Editor' ? 'selected' : ''}>Editor</option>
        </select>
    </div>

    <div class="flex space-x-2 pt-4">
        <button type="submit" class="flex-1 bg-indigo-600 text-white py-2 rounded font-bold hover:bg-indigo-700 transition">
            변경사항 저장
        </button>
        <!-- 취소 버튼: 다시 상세 보기 모드로 복구 -->
        <button type="button"
        hx-get="${pageContext.request.contextPath}/patterns/p1-edit?id=${member.id()}"
        hx-target="closest div[id^='member-edit']"
        hx-swap="outerHTML"
        class="flex-1 bg-white border border-gray-300 text-gray-700 py-2 rounded font-bold hover:bg-gray-50 transition">
        취소
    </button>
</div>
</form>
</div>