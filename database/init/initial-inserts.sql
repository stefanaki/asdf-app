insert into services (service_type) values
		('RECEPTION'), ('ROOM'), ('BAR'), ('RESTAURANT'), ('CONFERENCE'), ('GYM'), ('SAUNA'), ('HAIR_SALON');

insert into no_register_services (service_id, service_type) values
		(1, 'RECEPTION'), (3, 'BAR'), (4, 'RESTAURANT'), (8, 'HAIR_SALON');

insert into register_services (service_id, service_type, enroll_price) values
		(2, 'ROOM', 50.00),
		(5, 'CONFERENCE', 25.00),
    (6, 'GYM', 45.00),
    (7, 'SAUNA', 75.00);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('FLO0', 'FLOOR', NULL, NULL, NULL, 0),
    ('FLO1', 'FLOOR', NULL, NULL, NULL, 0),
    ('FLO2', 'FLOOR', NULL, NULL, NULL, 0),
    ('FLO3', 'FLOOR', NULL, NULL, NULL, 0),
    ('FLO4', 'FLOOR', NULL, NULL, NULL, 0),
    ('FLO5', 'FLOOR', NULL, NULL, NULL, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('N', 'CORRIDOR', NULL, NULL, NULL, 0),
    ('S', 'CORRIDOR', NULL, NULL, NULL, 0),
    ('E', 'CORRIDOR', NULL, NULL, NULL, 0),
    ('W', 'CORRIDOR', NULL, NULL, NULL, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('ELE1', 'ELEVATOR', NULL, NULL, NULL, 0),
    ('ELE2', 'ELEVATOR', NULL, NULL, NULL, 0),
    ('ELE3', 'ELEVATOR', NULL, NULL, NULL, 0),
    ('ELE4', 'ELEVATOR', NULL, NULL, NULL, 0),
    ('ELE5', 'ELEVATOR', NULL, NULL, NULL, 0);


insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('RES1', 'SERVICE', 1, 7, 4, 0),
    ('RES2', 'SERVICE', 1, 8, 4, 0),
    ('RES3', 'SERVICE', 1, 9, 4, 0),
    ('RES4', 'SERVICE', 1, 10, 4, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('BAR1', 'SERVICE', 1, 7, 3, 0),
    ('BAR2', 'SERVICE', 1, 8, 3, 0),
    ('BAR3', 'SERVICE', 1, 9, 3, 0),
    ('BAR4', 'SERVICE', 1, 10, 3, 0),
    ('BAR5', 'SERVICE', 1, 10, 3, 0),
    ('BAR6', 'SERVICE', 1, 9, 3, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('RECP', 'SERVICE', 1, NULL, 1, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('CON1', 'SERVICE', 1, 7, 5, 0),
    ('CON2', 'SERVICE', 1, 8, 5, 0),
    ('CON3', 'SERVICE', 1, 9, 5, 0),
    ('CON4', 'SERVICE', 1, 10, 5, 0),
    ('CON5', 'SERVICE', 1, 7, 5, 0),
    ('CON6', 'SERVICE', 1, 8, 5, 0),
    ('CON7', 'SERVICE', 1, 9, 5, 0),
    ('CON8', 'SERVICE', 1, 10, 5, 0),
    ('CON9', 'SERVICE', 1, 7, 5, 0),
    ('CON10', 'SERVICE', 1, 8, 5, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('GYM1', 'SERVICE', 1, 7, 6, 0),
    ('GYM2', 'SERVICE', 1, 8, 6, 0),
    ('GYM3', 'SERVICE', 1, 9, 6, 0),
    ('GYM4', 'SERVICE', 1, 10, 6, 0);


insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('SAU1', 'SERVICE', 1, 7, 7, 0),
    ('SAU2', 'SERVICE', 1, 8, 7, 0),
    ('SAU3', 'SERVICE', 1, 9, 7, 0),
    ('SAU4', 'SERVICE', 1, 10, 7, 0),
    ('SAU5', 'SERVICE', 1, 7, 7, 0),
    ('SAU6', 'SERVICE', 1, 8, 7, 0),
    ('SAU7', 'SERVICE', 1, 9, 7, 0),
    ('SAU8', 'SERVICE', 1, 10, 7, 0),
    ('SAU9', 'SERVICE', 1, 7, 7, 0),
    ('SAU10', 'SERVICE', 1, 8, 7, 0);

insert into places (place_description, place_type, floor_id, corridor_id, offered_service_id, room_capacity) values
		('HAIR', 'SERVICE', 1, 7, 8, 0);
