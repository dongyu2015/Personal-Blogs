drop table BLOG cascade constraints;
CREATE TABLE  "BLOG" 
   (	"B_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"URL" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "BLOG_PK" PRIMARY KEY ("B_ID") ENABLE
   );

drop table EVENT cascade constraints;
CREATE TABLE  "EVENT" 
   (	"EVENT_ID" NUMBER NOT NULL ENABLE, 
	"EVENT_NAME" VARCHAR2(400), 
	"OWNER" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "EVENT_PK" PRIMARY KEY ("EVENT_ID") ENABLE
   );

drop table EVENT_AT cascade constraints;
CREATE TABLE  "EVENT_AT" 
   (	"EVENT_ID" NUMBER NOT NULL ENABLE, 
	"ZIP_CODE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "EVENT_AT_PK" PRIMARY KEY ("EVENT_ID", "ZIP_CODE") ENABLE, 
	 CONSTRAINT "EVENT_AT_FK" FOREIGN KEY ("EVENT_ID")
	  REFERENCES  "EVENT" ("EVENT_ID") ENABLE, 
	 CONSTRAINT "EVENT_AT_FK2" FOREIGN KEY ("ZIP_CODE")
	  REFERENCES  "LOCATION" ("ZIP_CODE") ENABLE
   );

drop table FILES cascade constraints;
CREATE TABLE  "FILES" 
   (	"F_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"URL" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "FILES_PK" PRIMARY KEY ("F_ID") ENABLE
   );

drop table GAME cascade constraints;
CREATE TABLE  "GAME" 
   (	"G_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"URL" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "GAME_PK" PRIMARY KEY ("G_ID") ENABLE
   );

drop table GROUPS cascade constraints;
CREATE TABLE  "GROUPS" 
   (	"GROUP_ID" NUMBER NOT NULL ENABLE, 
	"GROUP_NAME" VARCHAR2(400), 
	"OWNER" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "GROUPS_PK" PRIMARY KEY ("GROUP_ID") ENABLE
   );

drop table GROUP_AT cascade constraints;
CREATE TABLE  "GROUP_AT" 
   (	"G_ID" NUMBER NOT NULL ENABLE, 
	"ZIP_CODE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "GROUP_AT_PK" PRIMARY KEY ("G_ID", "ZIP_CODE") ENABLE, 
	 CONSTRAINT "GROUP_AT_FK" FOREIGN KEY ("G_ID")
	  REFERENCES  "GROUPS" ("GROUP_ID") ENABLE, 
	 CONSTRAINT "GROUP_AT_FK2" FOREIGN KEY ("ZIP_CODE")
	  REFERENCES  "LOCATION" ("ZIP_CODE") ENABLE
   );

drop table IN_EVENT cascade constraints;
CREATE TABLE  "IN_EVENT" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"EVENT_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "IN_EVENT_PK" PRIMARY KEY ("USER_ID", "EVENT_ID") ENABLE, 
	 CONSTRAINT "IN_EVENT_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "IN_EVENT_FK2" FOREIGN KEY ("EVENT_ID")
	  REFERENCES  "EVENT" ("EVENT_ID") ENABLE
   );

drop table IN_GROUP cascade constraints;
CREATE TABLE  "IN_GROUP" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"G_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "IN_GROUP_PK" PRIMARY KEY ("USER_ID", "G_ID") ENABLE, 
	 CONSTRAINT "IN_GROUP_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "IN_GROUP_FK2" FOREIGN KEY ("G_ID")
	  REFERENCES  "GROUPS" ("GROUP_ID") ENABLE
   );

drop table LOCATION cascade constraints;
CREATE TABLE  "LOCATION" 
   (	"ZIP_CODE" NUMBER NOT NULL ENABLE, 
	"STATE" VARCHAR2(400), 
	"CITY" VARCHAR2(400), 
	"STREET" VARCHAR2(400), 
	 CONSTRAINT "LOCATION_PK" PRIMARY KEY ("ZIP_CODE") ENABLE
   );

drop table PHOTOS cascade constraints;
CREATE TABLE  "PHOTOS" 
   (	"P_ID" NUMBER NOT NULL ENABLE, 
	"TITLE" VARCHAR2(400), 
	"URL" VARCHAR2(400), 
	"CATEGORY" VARCHAR2(400), 
	 CONSTRAINT "PHOTOS_PK" PRIMARY KEY ("P_ID") ENABLE
   );

drop table RELATIONSHIP cascade constraints;
CREATE TABLE  "RELATIONSHIP" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"FRIEND_ID" NUMBER NOT NULL ENABLE, 
	"AFFILIATION" VARCHAR2(400), 
	 CONSTRAINT "RELATIONSHIP_PK" PRIMARY KEY ("USER_ID", "FRIEND_ID") ENABLE, 
	 CONSTRAINT "RELATIONSHIP_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "RELATIONSHIP_FK2" FOREIGN KEY ("FRIEND_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE
   );

drop table SCHOOL cascade constraints;
CREATE TABLE  "SCHOOL" 
   (	"SCHOOL_ID" NUMBER NOT NULL ENABLE, 
	"SCHOOL_NAME" VARCHAR2(400), 
	 CONSTRAINT "SCHOOL_PK" PRIMARY KEY ("SCHOOL_ID") ENABLE
   );

drop table SCHOOL_AT cascade constraints;
CREATE TABLE  "SCHOOL_AT" 
   (	"ZIP_CODE" NUMBER NOT NULL ENABLE, 
	"SCHOOL_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "SCHOOL_AT_PK" PRIMARY KEY ("ZIP_CODE", "SCHOOL_ID") ENABLE, 
	 CONSTRAINT "SCHOOL_AT_FK" FOREIGN KEY ("ZIP_CODE")
	  REFERENCES  "LOCATION" ("ZIP_CODE") ENABLE, 
	 CONSTRAINT "SCHOOL_AT_FK2" FOREIGN KEY ("SCHOOL_ID")
	  REFERENCES  "SCHOOL" ("SCHOOL_ID") ENABLE
   );

drop table STUDY_IN cascade constraints;
CREATE TABLE  "STUDY_IN" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"SCHOOL_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "STUDY_IN_PK" PRIMARY KEY ("USER_ID", "SCHOOL_ID") ENABLE, 
	 CONSTRAINT "STUDY_IN_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "STUDY_IN_FK2" FOREIGN KEY ("SCHOOL_ID")
	  REFERENCES  "SCHOOL" ("SCHOOL_ID") ENABLE
   );

drop table USER_PROFILE cascade constraints;
CREATE TABLE  "USER_PROFILE" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"WORK_ID" NUMBER, 
	"NAME" VARCHAR2(400), 
	"BDATE" DATE, 
	"GENDER" VARCHAR2(400), 
	"HOBBY" NVARCHAR2(400), 
	"SINGLE_OR_NOT" NUMBER(1,0), 
	"SCHOOL_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "USER_PROFILE_PK" PRIMARY KEY ("USER_ID") ENABLE
   );

drop table U_BLOG cascade constraints;
CREATE TABLE  "U_BLOG" 
   (	"B_ID" NUMBER NOT NULL ENABLE, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "U_BLOG_PK" PRIMARY KEY ("B_ID", "USER_ID") ENABLE, 
	 CONSTRAINT "U_BLOG_FK" FOREIGN KEY ("B_ID")
	  REFERENCES  "BLOG" ("B_ID") ENABLE, 
	 CONSTRAINT "U_BLOG_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE
   );

drop table U_FILE cascade constraints;
CREATE TABLE  "U_FILE" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"F_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "U_FILE_PK" PRIMARY KEY ("USER_ID", "F_ID") ENABLE, 
	 CONSTRAINT "U_FILE_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "U_FILE_FK2" FOREIGN KEY ("F_ID")
	  REFERENCES  "FILES" ("F_ID") ENABLE
   );

drop table U_GAME cascade constraints;
CREATE TABLE  "U_GAME" 
   (	"G_ID" NUMBER NOT NULL ENABLE, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "U_GAME_PK" PRIMARY KEY ("G_ID", "USER_ID") ENABLE, 
	 CONSTRAINT "U_GAME_FK" FOREIGN KEY ("G_ID")
	  REFERENCES  "GAME" ("G_ID") ENABLE, 
	 CONSTRAINT "U_GAME_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE
   );

drop table U_PHOTO cascade constraints;
CREATE TABLE  "U_PHOTO" 
   (	"P_ID" NUMBER NOT NULL ENABLE, 
	"USER_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "U_PHOTO_PK" PRIMARY KEY ("P_ID", "USER_ID") ENABLE, 
	 CONSTRAINT "U_PHOTO_FK" FOREIGN KEY ("P_ID")
	  REFERENCES  "PHOTOS" ("P_ID") ENABLE, 
	 CONSTRAINT "U_PHOTO_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE
   );

drop table WORK_AT cascade constraints;
CREATE TABLE  "WORK_AT" 
   (	"ZIP_CODE" NUMBER NOT NULL ENABLE, 
	"WORK_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "WORK_AT_PK" PRIMARY KEY ("ZIP_CODE", "WORK_ID") ENABLE, 
	 CONSTRAINT "WORK_AT_FK" FOREIGN KEY ("ZIP_CODE")
	  REFERENCES  "LOCATION" ("ZIP_CODE") ENABLE, 
	 CONSTRAINT "WORK_AT_FK2" FOREIGN KEY ("WORK_ID")
	  REFERENCES  "WORK_PLACE" ("WORK_ID") ENABLE
   );

drop table WORK_ON cascade constraints;
CREATE TABLE  "WORK_ON" 
   (	"USER_ID" NUMBER NOT NULL ENABLE, 
	"WORK_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "WORK_ON_PK" PRIMARY KEY ("USER_ID", "WORK_ID") ENABLE, 
	 CONSTRAINT "WORK_ON_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USER_PROFILE" ("USER_ID") ENABLE, 
	 CONSTRAINT "WORK_ON_FK2" FOREIGN KEY ("WORK_ID")
	  REFERENCES  "WORK_PLACE" ("WORK_ID") ENABLE
   );

drop table WORK_PLACE cascade constraints;
CREATE TABLE  "WORK_PLACE" 
   (	"WORK_ID" NUMBER, 
	"COMPANY_NAME" VARCHAR2(400), 
	 CONSTRAINT "WORK_PLACE_PK" PRIMARY KEY ("WORK_ID") ENABLE
   );