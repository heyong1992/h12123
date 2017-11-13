package com.blog.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 * Created by hey on 2017/9/27.
 */
public class ToolPbkdf {

    /**
     * 生成盐
     * @return
     */
    public static byte[] createSalt(){
        byte[] salt = new byte[16];
        try {
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            random.nextBytes(salt);
            return salt;
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    /**
     * 生成摘要
     * @param password
     * @param salt
     * @return
     */
    public static byte[] digest(String password, byte[] salt){

        try {
            MessageDigest msgDigest = MessageDigest.getInstance("SHA");
            if (salt != null && salt.length > 0){
                msgDigest.update(salt);
            }

            byte[] digest = msgDigest.digest(password.getBytes());
            return digest;
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println( createCredential("123456"));

    }

    public static String createCredential(String password){
        return digest(password,createSalt()).toString();
    }
}
