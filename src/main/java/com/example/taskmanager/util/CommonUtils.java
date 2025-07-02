package com.example.taskmanager.util;

import java.util.UUID;

public class CommonUtils {
    public static String generateUuid() {
        return UUID.randomUUID().toString();
    }
}
