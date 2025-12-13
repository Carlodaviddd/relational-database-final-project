# Final Project - SKS National Bank Database

This project contains SQL scripts and an ERD for the **SKS National Bank Database** project, covering boths **Phase 1** and **Phase 2**. It implements core banking operations including branches, customers, employees, accounts, loans and various database triggers for auditing and business rules.

## Phase 1 Contents
1. `create_database.sql` - Create the database and all tables with primary/foreign keys.
2. `populate_database.sql` - Insert mock data into all tables.
3. `prepared_queries.sql` - Contains 10 queries to test and demonstrate the database.

## Phase 2 Contents
1. `create_user.sql` - Scripts for creating database users.
2 `create_triggers.sql` - Triggers implemented:
   - Create Audit Table
   - New customer trigger
   - Employee promotion trigger
   - Chequing account update balance
3. `create_json_spatial` - Additional scripts for JSON and spatial data
4. `SKSNational_backup.bak` - Database backup file

## Setup Instructions
1. Clone this repository.
2. Open **SQL Server Management Studio (SSMS)** and connect to your SQL Server Instance.
3. Run the scripts in order:
   * `create_database.sql`
   *  `populate_database.sql`
   *  `prepared_queries.sql`
   *  `create_user.sql`
   *  `create_triggers.sql`
4. Alternatively, you can restore the **.bak file** in SSMS to quickly load the database.
5. Verify that all tables are created and populated.

## Notes
* Always run `create_database.sql` before `populate_database.sql` if using scripts.
* Triggers in **Phase 2** implement auditing and business logic as described above.
* The **.bak file** contains a full backup of the database.
* This project is fully implemented for **Phase 1** and **Phase 2**.
