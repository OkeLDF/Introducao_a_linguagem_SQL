CREATE TABLE COMPANY (
    COMPANY_ID                  INTEGER   PRIMARY KEY AUTOINCREMENT,
    NAME                        TEXT (30) NOT NULL,
    DESCRIPTION                 TEXT (60),
    PRIMARY_CONTACT_ATTENDEE_ID INTEGER   NOT NULL
); /* gerada automaticamente */

CREATE TABLE ROOM (
    ROOM_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    FLOOR_NUMBER INTEGER NOT NULL,
    SEAT_CAPACITY INTEGER NOT NULL
);

CREATE TABLE PRESENTATION (
    PRESENTATION_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    BOOKED_COMPANY_ID INTEGER NOT NULL,
    BOOKED_ROOM_ID INTEGER NOT NULL,
    START_TIME TIME,
    END_TIME TIME
);

CREATE TABLE ATTENDEE(
    ATTENDEE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    FIRST_NAME TEXT (30) NOT NULL,
    LAST_NAME TEXT (30) NOT NULL,
    PHONE INTEGER,
    EMAIL TEXT (30),
    VIP BOOLEAN DEFAULT(0)
);

CREATE TABLE PRESENTATION_ATTENDANCE(
    TICKET_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    PRESENTATION_ID INTEGER NOT NULL,
    ATTENDEE_ID INTEGER NOT NULL
);