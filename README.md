# Django_Web_Blog is a serverless blog website that uses a Django web framework

When developing the Django app, I implemented a lot features to the blog website. Below are pics with descriptions of the feature that was added.  

Registration page.  
![Screenshot_1](https://user-images.githubusercontent.com/109190196/233529773-3bbfd83e-3552-4bb5-9916-af4d119e2edc.jpg)

Home page that displays all posts from all the users ordered with the most recent post at the top.  
![Screenshot_2](https://user-images.githubusercontent.com/109190196/233529967-0a9b4756-2f53-4338-8448-31f90700bf87.jpg)

Blog post creation page.  
![Screenshot_3](https://user-images.githubusercontent.com/109190196/233530013-2f767819-c73d-42a1-8009-ae74230f4d6d.jpg)

Profile page.  
![Screenshot_4](https://user-images.githubusercontent.com/109190196/233530049-c27a0933-a89c-4dfc-b355-f01654b29da4.jpg)

Logout page.  
![Screenshot_5](https://user-images.githubusercontent.com/109190196/233530090-4bc0fd91-44f1-490e-8a5f-4f13b4525937.jpg)

A page where you can see all the posts by a specific user.  
![Screenshot_6](https://user-images.githubusercontent.com/109190196/233530147-3130d953-e667-4d51-86e2-c9de2a28f3a1.jpg)

Detailed page for a specific post.  
![Screenshot_7](https://user-images.githubusercontent.com/109190196/233530186-8f5b2d02-0e91-423b-a0bd-00621f006d46.jpg)


Created the needed 3 tier AWS infrastructure by code with Terraform.  
![Screenshot_8](https://user-images.githubusercontent.com/109190196/233530291-6465ed88-aca3-4680-be59-1021d292190a.jpg)

I migrated the static and media files in my local Django fileystem into S3.  
![InkedScreenshot_12](https://user-images.githubusercontent.com/109190196/234468180-b403aa2f-b5d8-4e65-ae2f-46b6920f02ee.jpg)
![InkedScreenshot_13](https://user-images.githubusercontent.com/109190196/234466750-6e9db9e5-40b9-47b7-a4eb-0b75405e3d8c.jpg)  

In the public web ec2 instance, I cloned my git repo and migrated the databse from the local sqlite db into the AWS RDS PostgreSQL db in the private database tier in my vpc.  
![Screenshot_17](https://user-images.githubusercontent.com/109190196/234466338-eba8561a-5423-4cb3-8281-a6b61256d95c.jpg)
![Screenshot_27](https://user-images.githubusercontent.com/109190196/234467140-2d051c99-20fc-41fb-8cf1-95fc7a709522.jpg)

Because I migrated the database, I had to recreate my superuser. Then I created another test user and uploaded my json data to populate my blog site with posts again. 
![Screenshot_21](https://user-images.githubusercontent.com/109190196/234467002-017072f9-1ef2-48a6-9a42-c5460151eecb.jpg)

After migrating the database, static files, and media files, I deployed the application via Elastic Beanstalk into the private app subnet behind an application load balancer.  
![Screenshot_20](https://user-images.githubusercontent.com/109190196/234467369-d6d87d88-72df-4236-989f-d2dee1daad3e.jpg)

I deleted the ec2 instance in the public web app tier and configured the security groups for the database, application, and alb to communicate properly and restrict access to the public. Using the ALB DNS name I am able to access my Django blog web app and it is working perfectly and securely.  
![Screenshot_19](https://user-images.githubusercontent.com/109190196/234467629-d5536490-f0dd-412e-ac50-256d359186ff.jpg)
![Screenshot_18](https://user-images.githubusercontent.com/109190196/234467646-1f52a72c-6327-47a8-bc39-a81d4bb4a711.jpg)

To make my web app more secure, I deployed a firewall via AWS WAF. 
![Screenshot_23](https://user-images.githubusercontent.com/109190196/234467796-ffc850c1-de26-4917-a53f-6b207e482a08.jpg)
![Screenshot_22](https://user-images.githubusercontent.com/109190196/234467804-55b409e5-7a61-4c98-bd47-f69d0d17649d.jpg)

To prove that the firewall was indeed working as intended, I made a new rule and blocked my own IP.
![Screenshot_25](https://user-images.githubusercontent.com/109190196/234467864-34b2e67e-3890-46e9-a0a5-ee3d2e769df8.jpg)
![Screenshot_26](https://user-images.githubusercontent.com/109190196/234467875-49f70add-ec09-4acb-bada-1f62d6cb61ac.jpg)

After removing my new rule to block my own ip, everything is working as intended with a 3 tier AWS architecture.
