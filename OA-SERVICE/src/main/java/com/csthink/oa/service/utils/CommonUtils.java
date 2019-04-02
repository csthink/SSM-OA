package com.csthink.oa.service.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class CommonUtils {

    /**
     * 生成随机数
     *
     * @param length 随机数长度
     * @return 随机数
     */
    public static String generateRandomNumber(int length) {
        String source = "1234567890";
        return generateRandomStr(source, length);
    }

    /**
     * 生成随机字符串
     *
     * @param source 字符串源
     * @param length 要生成的字符串长度
     * @return 随机字符串
     */
    private static String generateRandomStr(String source, int length) {
        Random random = new Random(System.currentTimeMillis());
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(source.charAt(random.nextInt(source.length() - 1)));
        }
        return sb.toString();
    }

    /**
     * MD5加密
     *
     * @param str
     * @return MD5加密后的字符串
     * @throws NoSuchAlgorithmException 异常
     */
    public static String encryptByMD5(String str) throws NoSuchAlgorithmException {
        if (null == str || "".equals(str.trim())) {
            return null;
        }
        // 生成一个MD5加密计算摘要
        MessageDigest md = MessageDigest.getInstance("MD5");
        String salt = "!@$%^&AScs(*)";
        str = str + salt;
        // 计算md5函数
        md.update(str.getBytes());
        // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
        // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
        return new BigInteger(1, md.digest()).toString(16);
    }

    /**
     * 检查密码是否正确
     *
     * @param inputPassword 用户输入的明文密码
     * @param dbPassword 数据库保存的加密密码
     * @return true 密码正确 false 密码错误
     * @throws NoSuchAlgorithmException 异常
     */
    public static boolean checkPassword(String inputPassword, String dbPassword) throws NoSuchAlgorithmException {
        return encryptByMD5(inputPassword).equals(dbPassword);
    }
}
