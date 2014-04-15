whatsdue
========

Web App Development Class Project

Changes made in this branch:

1. Sessions and Users controllers modified to point to Courses since the dashboard does not exist yet.

2. Message displayed if no courses added yet

3. User only sees courses that are their own.

4. Minor UI changes
  -Destroy text changed to Delete
  -Columns that don't concern the user were removed from the view.
  -user_id is retrieve from the session variable instead of user input


Possibly omitting some details here, so see code for details and any specific changes

5. Added ability to add a new Assignment. On the "new" form, there is a drop down menu containing all the Courses the current logged in user has created. Upon selecting one and filling out the rest of the form, the new Assignment will be created successfully.