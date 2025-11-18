package utils;

import java.util.Random;

public class DataGenerator {

    private static final Random random = new Random();

    public static String randomEmail() {
        return "user" + random.nextInt(100000) + "@test.com";
    }

    public static String randomName() {
        return "Usuario " + random.nextInt(100000);
    }
}
