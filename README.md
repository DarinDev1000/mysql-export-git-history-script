# mysql-export-git-history-script
A script to add to your project to export database schema sql files for git history.

This will export sql files from your database to show database schema/structure.

I would recommend creating a new database user like "export" with the proper permissions.
Also, run this script any time you change the database structure and make a git commit.
