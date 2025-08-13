package com.example.toystore.filter;

import com.example.toystore.enums.Role;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/product/*"}) // chỉ áp dụng cho URL /product/*
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        // Lấy user từ session
        Object userObj = req.getSession().getAttribute("user");

        if (userObj == null) {
            // Chưa đăng nhập
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        // Giả sử User có phương thức getRole()
        com.example.toystore.entities.User user = (com.example.toystore.entities.User) userObj;
        if (user.getRole() != Role.ADMIN) {
            // Không phải admin
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này");
            return;
        }

        // Đúng role admin → cho phép tiếp tục
        chain.doFilter(request, response);
    }
}
