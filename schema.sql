CREATE SCHEMA oneman;

CREATE TABLE oneman.courses ( 
	course_id            int  NOT NULL  ,
	name                 varchar(100)    ,
	start_date           date    ,
	end_date             date    ,
	CONSTRAINT pk_courses PRIMARY KEY ( course_id )
 ) engine=InnoDB;

CREATE TABLE oneman.evaluation_type ( 
	eval_id              int  NOT NULL  ,
	meaning              varchar(100)    ,
	CONSTRAINT pk_evaluation_type PRIMARY KEY ( eval_id )
 ) engine=InnoDB;

CREATE TABLE oneman.students ( 
	student_id           int  NOT NULL  ,
	first_name           varchar(100)    ,
	last_name            varchar(100)    ,
	CONSTRAINT pk_students PRIMARY KEY ( student_id )
 );

CREATE TABLE oneman.teachers ( 
	teacher_id           int  NOT NULL  ,
	first_name           varchar(100)    ,
	last_name            varchar(100)    ,
	email                varchar(50)    ,
	CONSTRAINT pk_teachers PRIMARY KEY ( teacher_id )
 ) engine=InnoDB;

CREATE TABLE oneman.attendance ( 
	course_id            int  NOT NULL  ,
	student_id           int  NOT NULL  ,
	`date`               date  NOT NULL  ,
	CONSTRAINT idx_attendance PRIMARY KEY ( course_id, student_id, `date` )
 ) engine=InnoDB;

CREATE INDEX idx_attendance_0 ON oneman.attendance ( course_id );

CREATE INDEX idx_attendance_1 ON oneman.attendance ( student_id );

CREATE TABLE oneman.course_schedule ( 
	course_id            int  NOT NULL  ,
	occurence_date       date  NOT NULL  ,
	occurence_time       time    ,
	room                 varchar(50)    ,
	CONSTRAINT idx_course_schedule PRIMARY KEY ( course_id, occurence_date )
 ) engine=InnoDB;

CREATE INDEX idx_course_schedule_0 ON oneman.course_schedule ( course_id );

CREATE TABLE oneman.course_teacher ( 
	course_id            int    ,
	teacher_id           int    
 ) engine=InnoDB;

CREATE INDEX idx_course_teacher ON oneman.course_teacher ( course_id );

CREATE INDEX idx_course_teacher_0 ON oneman.course_teacher ( teacher_id );

CREATE TABLE oneman.enrollment ( 
	course_id            int  NOT NULL  ,
	student_id           int  NOT NULL  ,
	grade                int    ,
	CONSTRAINT idx_attendance_2 PRIMARY KEY ( course_id, student_id )
 );

CREATE INDEX idx_attendance_3 ON oneman.enrollment ( course_id );

CREATE INDEX idx_attendance_4 ON oneman.enrollment ( student_id );

CREATE INDEX idx_enrollment_2 ON oneman.enrollment ( grade );

ALTER TABLE oneman.attendance ADD CONSTRAINT fk_attendance FOREIGN KEY ( course_id ) REFERENCES oneman.courses( course_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.attendance ADD CONSTRAINT fk_attendance_0 FOREIGN KEY ( student_id ) REFERENCES oneman.students( student_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.course_schedule ADD CONSTRAINT fk_course_schedule FOREIGN KEY ( course_id ) REFERENCES oneman.courses( course_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.course_teacher ADD CONSTRAINT fk_course_teacher FOREIGN KEY ( course_id ) REFERENCES oneman.courses( course_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.course_teacher ADD CONSTRAINT fk_course_teacher_1 FOREIGN KEY ( teacher_id ) REFERENCES oneman.teachers( teacher_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.enrollment ADD CONSTRAINT fk_enrollment FOREIGN KEY ( student_id ) REFERENCES oneman.students( student_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.enrollment ADD CONSTRAINT fk_enrollment_0 FOREIGN KEY ( course_id ) REFERENCES oneman.courses( course_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE oneman.enrollment ADD CONSTRAINT fk_enrollment_1 FOREIGN KEY ( grade ) REFERENCES oneman.evaluation_type( eval_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

