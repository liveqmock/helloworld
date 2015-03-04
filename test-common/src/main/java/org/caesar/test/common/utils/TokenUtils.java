/*
 * Copyright (C), 2002-2014, 苏宁易购电子商务有限公司
 * FileName: TokenUtils.java
 * Author:   Evan
 * Date:     2014年8月5日 下午6:03:17
 * Description: //模块目的、功能描述      
 * History: //修改记录
 * <author>      <time>      <version>    <desc>
 * 修改人姓名             修改时间            版本号                  描述
 */
package org.caesar.test.common.utils;

/**
 * 字符工具处理
 * 
 * @author mupeng
 */
public class TokenUtils {
    /**
     * 截取字符串，长度大于maxLength的字符串，保留前maxLength位加"..."
     * 
     * @param s
     * @return
     */
    public static String cutString(String s, int maxLength) {
        if (maxLength > 0) {
            if (s != null && s.length() > maxLength) {
                return s.substring(0, maxLength) + "...";
            }
        }
        return s;
    }

}
