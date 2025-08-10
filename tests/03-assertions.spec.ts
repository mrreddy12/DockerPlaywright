import {test,expect} from "@playwright/test"

test("getPageInfo",async ({page})=>{
    //title...ur...content
    await page.goto("https://mrreddyautomation.com/playground/");

     console.log(await page.title());
     console.log(await page.url());
     //console.log(await page.content());
    await  expect(page).toHaveURL("https://mrreddyautomation.com/playground/");
     await expect(page).toHaveTitle("Playground – MR Rreddy"); 

   
     let element=   await page.locator("//input[@type='submit']");
     expect(element).toBeVisible();
     expect(element).toBeEnabled(); 


        let txtElement=page.locator("//input[@id='name']");
        await txtElement.fill("mrreddy");

        await expect(txtElement).toHaveValue("mrreddy");
    
});