/*
 * Copyright (C), 2002-2012, 苏宁易购电子商务有限公司
 * FileName: AccessLogFilter.java
 * Author:   mupen
 * Date:     2012-6-25 下午05:39:27
 * Description: //模块目的、功能描述      
 * History: //修改记录
 * <author>      <time>      <version>    <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package org.caesar.test.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Set;
import java.util.UUID;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

import org.caesar.test.common.utils.TokenUtils;

/**
 * 访问日志过滤器
 * 
 * @author mupeng
 */
@Component("accessLogFilter")
public class AccessLogFilter implements Filter {

    private static final Logger LOG = LoggerFactory.getLogger("ActionAccessLogger");

    private static final String STR_IP = "ip";

    private static final String STR_USER = "user";

    private static final String STR_SESSION_ID = "sessionId";

    private static final String STR_INVOKENO = "invokeNo";

    private static final String MIDDLE_LINE = "-";

    private static final String BLANK = "";

    private static final String STR_EQ = "=";

    private static final String STR_AND = "&";

    // 截取参数的最大长度
    protected int maxLength = 20;

    // 不允许记录的action参数列表
    protected Set<String> excludeParams;

    /**
     * {@inheritDoc}
     */
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * {@inheritDoc}
     */
    @SuppressWarnings("rawtypes")
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String path = request.getRequestURI();

        // 获取当前登录用户
        HttpSession session = request.getSession();

        // 获取SESSIONID
        String sessionId = session.getId();

        String userName = (String) session.getAttribute("SPRING_SECURITY_LAST_USERNAME");
        if (userName == null) {
            // userName = (String) session.getAttribute(WebConstants.SESSION_ACCOUNT_NAME);
        }

        // 获取用户登录IP
        String ip = request.getRemoteAddr();

        // 向MDC里面set ip、user
        MDC.put(STR_IP, ip);
        MDC.put(STR_USER, userName);
        MDC.put(STR_SESSION_ID, sessionId);

        // 调用流水号
        MDC.put(STR_INVOKENO, UUID.randomUUID().toString().replace(MIDDLE_LINE, BLANK));

        // 取parameters
        Enumeration parameters = request.getParameterNames();

        // 计算action method执行方法
        long startTime = System.currentTimeMillis();
        long executionTime = 0L;

        // 拼接LOG信息
        StringBuilder message = new StringBuilder(500);
        try {// 调用用户访问的CONTROLLER
            chain.doFilter(request, response);
            executionTime = System.currentTimeMillis() - startTime;
        } finally {

            message.append("Controller:");
            message.append(path);
            message.append("|Params:");
            StringBuilder params = new StringBuilder();
            while (parameters.hasMoreElements()) {
                String param = (String) parameters.nextElement();
                String value = request.getParameter(param);
                params.append(param);
                params.append(STR_EQ);
                params.append(TokenUtils.cutString(value, this.maxLength));
                params.append(STR_AND);
            }
            if (params.toString().length() > 0) {
                message.append(params.toString().substring(0, params.toString().length() - 1));
            }
            message.append("|Spend:").append(executionTime);
            // 记录日志
            LOG.info(message.toString());

            // 清除MDC里面的历史信息
            MDC.remove(STR_IP);
            MDC.remove(STR_USER);
            MDC.remove(STR_SESSION_ID);
            MDC.remove(STR_INVOKENO);
        }

    }

    /**
     * {@inheritDoc}
     */
    public void destroy() {
    }

    /**
     * @return the maxLength
     */
    public int getMaxLength() {
        return maxLength;
    }

    /**
     * @param maxLength the maxLength to set
     */
    public void setMaxLength(int maxLength) {
        this.maxLength = maxLength;
    }

}
