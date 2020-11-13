# instock
*Near real-time restock alerting* 

InStock is a basic duct tape solution that I quickly wrote to monitor a specified webpage for a one-way change in the frequency of an arbitrary character(s). Once the condition is met it would then use Swaks to email a message to notify the recipient of a change such as a product is back in stock.   

Initially, I didn't create this to be reusable but decided it can be customized to fit other products. It requires you to find a pattern that all in-stock and out-of-stock products on an online store share in their HTML source code. For example, all in-stock products in my situation shared three euro symbols (€) but the out-of-stock products only had two euro symbols (€) since space was used to write "Out of stock". Therefore, once the specified webpage was updated and reflected >=3 € it would email indicating that it was restocked.  

Since reusability wasn't my chief goal a change to the website's source code could break the logic and you would never know the difference. Additionally, it doesn't have any verification so other issues could arise and go unnoticed such as a change in the target URI, cronjobd being disabled, etc. Hence why you should do a few dry runs to ensure it works before-and-during the automation step.  

Down the road, I'll add more error-checks to mitigate the risk of failure.   

**Dependencies**
- wget
- Swaks
- Gmail account 

**Instructions**
1. Identify a recurring pattern in all fully-stocked items and compare against items that are out-of-stock to find a quantifiable way to alert on this change and notice a deviation from this baseline. Even something as simple as the words "In stock" occurring more than once or "Email me when the item is restocked" is less than one is sufficient.
2. Specify the target URL/URI 
3. Assuming you have Swaks already installed and an email account ready, add your credentials, target addresses, subject line, and body message.
4. Test it using a metric that would default true, set up automation (cronjob is my favorite), and retest with cronjob. I always seek the help of https://crontab-generator.org 
5. Wait and periodically test it 

**Recommendations / Notes**
- Use a throwaway Gmail account with unique credentials since the script uses hardcoded credentials. Hardcoded credentials are always a terrible idea but since the stakes/risk are low and the blast radius is atomically small, it doesn't matter. Use email forwarding even if you don't want to add another email account to your personal device. 

- Swaks requires SMTP so beware of residual risks as with anything, be mindful of ownership/permissions of the script, and confidentiality isn't preserved with Swaks unless you add the TLS option. 

- I use the native email application on my iPhone but installed the Gmail app for this script and set the appropriate notifications so it would be delivered to my phone and my Apple Watch in real-time, ensuring I don't miss the notification since I supress all other email notifications. 

