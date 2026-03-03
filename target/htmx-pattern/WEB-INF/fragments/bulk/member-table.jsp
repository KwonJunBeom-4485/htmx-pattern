<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="overflow-x-auto" id="member-table-container">
    <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
            <tr>
                <th class="px-6 py-3 text-left">
                    <input type="checkbox" onclick="toggleAll(this)" class="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500">
                </th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">ID</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">이름</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">이메일</th>
                <th class="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase tracking-wider">상태</th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            <c:forEach var="m" items="${members}">
                <tr class="hover:bg-blue-50/50 transition-colors group">
                    <td class="px-6 py-4">
                        <input type="checkbox" name="ids" value="${m.id()}" class="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500">
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-mono text-gray-400">#${m.id()}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-700">${m.name()}</td>
                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${m.email()}</td>
                    <td class="px-6 py-4 whitespace-nowrap">
                        <span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-black rounded-md">${m.status()}</span>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty members}">
                <tr>
                    <td colspan="5" class="px-6 py-20 text-center">
                        <div class="flex flex-col items-center">
                            <svg class="w-12 h-12 text-gray-200 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                            <span class="text-gray-400 font-medium">표시할 회원이 없습니다.</span>
                        </div>
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>
