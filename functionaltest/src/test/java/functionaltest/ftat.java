package functionaltest;

import java.util.concurrent.TimeUnit;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
//import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.Test;

public class ftat {
	
	public HtmlUnitDriver driver;
	//public WebDriver driver;
	public WebDriverWait wait;
	public String URL = "http://18.188.28.239:8080/G7QAWebapp/";
	public String URL1 = "http://18.188.28.239:8080/G7QAWebapp/avncreatepage.jsp";
	//public String URL = "http://localhost:8080/AVNCommunication-1.0/avnlogin.jsp";
	//public String URL1 = "http://localhost:8080/AVNCommunication-1.0/avncreatepage.jsp";
	 
	 
	@Test(priority = 0)
	public void logintest() {
		driver = new HtmlUnitDriver();
		//driver= new FirefoxDriver();
		wait = new WebDriverWait(driver, 10);
		driver.get(URL);
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		// Login Page content check
		//driver.findElement(By.xpath("//h1[text()='JUPITER COMMUNICATION']")).isDisplayed();
		driver.findElement(By.name("username")).isDisplayed();
		driver.findElement(By.name("userpassword")).isDisplayed();
		driver.findElement(By.xpath("//button[text()='Login']")).isDisplayed();
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		// Login operation
		driver.findElement(By.name("username")).sendKeys("guest");
		driver.findElement(By.name("userpassword")).sendKeys("guest");
		driver.findElement(By.xpath("//button[text()='Login']")).click();
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
	}


}
