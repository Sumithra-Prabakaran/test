package Example;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;
import org.testng.annotations.Test;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.AfterTest;
public class New {
    private WebDriver driver;
    @Test
    public void testEasy() {
        driver.get("https://financials.dev.trimble-transportation.com/");
        String title = driver.getTitle();
        Assert.assertTrue(title.contains("Financials"));
    }
    @BeforeTest
    public void beforeTest() {
        driver = new FirefoxDriver();
    }
    @AfterTest
    public void afterTest() {
        driver.quit();
    }
}	