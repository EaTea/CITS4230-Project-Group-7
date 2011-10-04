-- Creator:       MySQL Workbench 5.2.34/ExportSQLite plugin 2009.12.02
-- Author:        Sonam Tobgay
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2011-09-26 11:06
-- Created:       2011-09-10 20:55
PRAGMA foreign_keys = OFF;

-- Schema: db_cits4230g
BEGIN;
CREATE TABLE "groups"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("id">=0),
  "group" VARCHAR(45) NOT NULL
);
CREATE TABLE "roles"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("id">=0),
  "role" VARCHAR(24) NOT NULL
);
CREATE TABLE "users"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("id">=0),
  "user_name" VARCHAR(24) NOT NULL,
  "passwd" VARCHAR(64) NOT NULL,
  "email" VARCHAR(36) NOT NULL,
  "roles_id" INTEGER NOT NULL CHECK("roles_id">=0),
  "groups_id" INTEGER NOT NULL CHECK("groups_id">=0),
  CONSTRAINT "user_name_UNIQUE"
    UNIQUE("user_name"),
  CONSTRAINT "email_UNIQUE"
    UNIQUE("email"),
  CONSTRAINT "fk_users_roles_id"
    FOREIGN KEY("roles_id")
    REFERENCES "roles"("id"),
  CONSTRAINT "fk_users_groups_id"
    FOREIGN KEY("groups_id")
    REFERENCES "groups"("id")
);
CREATE INDEX "users.fk_users_roles_id" ON "users"("roles_id");
CREATE INDEX "users.fk_users_groups_id" ON "users"("groups_id");
CREATE TABLE "todo_lists"(
  "id" INTEGER NOT NULL CHECK("id">=0),
  "task" VARCHAR(45),
  "due_date" DATETIME,
  "completed" TEXT CHECK("completed" IN('Y','N')),
  "users_id" INTEGER NOT NULL CHECK("users_id">=0),-- Author of Task
  PRIMARY KEY("id","users_id"),
  CONSTRAINT "fk_todo_tasks_users_id"
    FOREIGN KEY("users_id")
    REFERENCES "users"("id")
);
CREATE INDEX "todo_lists.fk_todo_tasks_users_id" ON "todo_lists"("users_id");
CREATE TABLE "todo_items"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("id">=0),
  "task_list" VARCHAR(128) NOT NULL,
  "start_date" DATETIME NOT NULL,
  "end_date" DATETIME NOT NULL,
  "completed" TEXT CHECK("completed" IN('Y','N')) DEFAULT 'N',
  "todo_tasks_id" INTEGER NOT NULL CHECK("todo_tasks_id">=0),
  CONSTRAINT "fk_todo_task_lists_todo_tasks_id"
    FOREIGN KEY("todo_tasks_id")
    REFERENCES "todo_lists"("id")
);
CREATE INDEX "todo_items.fk_todo_task_lists_todo_tasks_id" ON "todo_items"("todo_tasks_id");
CREATE TABLE "references"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("id">=0),
  "reference" TEXT NOT NULL
);
COMMIT;
