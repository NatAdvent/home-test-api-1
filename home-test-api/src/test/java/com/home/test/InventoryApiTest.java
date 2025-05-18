package com.home.test;

import com.intuit.karate.junit5.Karate;

public class InventoryApiTest {

    @Karate.Test
    Karate testInventory() {
        return Karate.run("inventory").relativeTo(getClass());
    }
}
