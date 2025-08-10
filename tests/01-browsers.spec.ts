import {test,expect} from "@playwright/test"

test("01-chrome",async ({page})=>{
    //goto//browser testnn
    await page.goto("https://mrreddyautomation.com/playground/");
    await page.viewportSize
  //reddy
  // await page.goto("https://mrreddyautomation.com/playground/");
  // await page.goto("https://mrreddyautomation.com/playground/");
});


// test("02-edge",async ({page})=>{
//     //goto//browser testnn
//     await page.goto("https://google.com");
//       await page.goto("https://facebook.com");
//   //reddy

// });

// test("03-firefox",async ({page})=>{
//     //goto//browser testnn
//     await page.goto("https://mrreddyautomation.com/playground/");
//   //reddy
//   await page.goto("https://mrreddyautomation.com/playground/");
//   await page.goto("https://mrreddyautomation.com/playground/");
// });