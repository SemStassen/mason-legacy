CREATE TABLE "projects" (
	"uuid" uuid PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"hex_color" varchar(7) NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp,
	"changed_columns" text,
	"is_deleted" boolean DEFAULT false NOT NULL,
	"write_uuid" uuid
);
--> statement-breakpoint
CREATE TABLE "time_entries" (
	"uuid" uuid PRIMARY KEY NOT NULL,
	"user_uuid" uuid NOT NULL,
	"project_uuid" uuid NOT NULL,
	"started_at" timestamp NOT NULL,
	"stopped_at" timestamp,
	"note" varchar,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp,
	"changed_columns" text,
	"is_deleted" boolean DEFAULT false NOT NULL,
	"write_uuid" uuid
);
--> statement-breakpoint
CREATE TABLE "user_preferences" (
	"uuid" uuid PRIMARY KEY NOT NULL,
	"user_uuid" uuid NOT NULL,
	"week_starts_on_monday" boolean DEFAULT true NOT NULL,
	"uses_24_hour_clock" boolean DEFAULT true NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp,
	"changed_columns" text,
	"is_deleted" boolean DEFAULT false NOT NULL,
	"write_uuid" uuid
);
--> statement-breakpoint
CREATE TABLE "users" (
	"uuid" uuid PRIMARY KEY NOT NULL,
	"username" varchar NOT NULL,
	"email" varchar NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp,
	"changed_columns" text,
	"is_deleted" boolean DEFAULT false NOT NULL,
	"write_uuid" uuid,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE "users_to_projects" (
	"uuid" uuid PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"hex_color" varchar(7) NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp,
	"changed_columns" text,
	"is_deleted" boolean DEFAULT false NOT NULL,
	"write_uuid" uuid
);
--> statement-breakpoint
ALTER TABLE "time_entries" ADD CONSTRAINT "time_entries_user_uuid_users_uuid_fk" FOREIGN KEY ("user_uuid") REFERENCES "public"."users"("uuid") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "time_entries" ADD CONSTRAINT "time_entries_project_uuid_projects_uuid_fk" FOREIGN KEY ("project_uuid") REFERENCES "public"."projects"("uuid") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "user_preferences" ADD CONSTRAINT "user_preferences_user_uuid_users_uuid_fk" FOREIGN KEY ("user_uuid") REFERENCES "public"."users"("uuid") ON DELETE cascade ON UPDATE no action;