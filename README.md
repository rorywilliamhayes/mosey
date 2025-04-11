# mosey
# Workflow for Updating a Live Database
Process for the building of new tables/change the exisiting database.
1. review current database, plan what new tables you want to add, plan waht new columnes you want to add. check your current database schema and understand what tables but also columns that share values in tables that might be effected. Id use oracle data modeler to help visulaise and also sql developer. Understand all impacted areas will need to be tested in the downstream applications they touch.

2. Once you have the changes that you want begin testing your changes first in a development environment, the QA environmnet, then UAT environment. All down stream testing on the application should be approved by the relevent stakeholders and application owners/qa team before you can move on to the next environment and eventurally production.

3. If all testing has worked and there are no issues you can orangise the deployment to production/live database. When deploying the changes find a maintience window when there will be no user activity. When doing this start by taking a pre deployment database backup. 
