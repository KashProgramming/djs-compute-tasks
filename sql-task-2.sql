USE Social_Media;
INSERT INTO Users VALUES
('U001', 'social_butterfly', 'user001@email.com', '2023-01-15', 'USA', 'Love to travel and meet new people'),
('U002', 'tech_guru', 'techie@email.com', '2022-11-30', 'India', 'Tech enthusiast and coder'),
('U003', 'fitness_fanatic', 'fitfan@email.com', '2024-03-22', 'Brazil', 'Fitness freak');
INSERT INTO Posts VALUES
('P0001', 'U001', 'Having a great time at the beach!', '2024-07-14 15:30:00', 42, 5),
('P0002', 'U002', 'Just launched my new app!', '2024-07-14 16:45:00', 78, 12),
('P0003', 'U003', 'Just completed a workout!', '2024-07-14 17:00:00', 15, 3);
INSERT INTO Comments VALUES
('C0001', 'P0001', 'U002', 'Looks amazing!', '2024-07-14 15:35:00'),
('C0002', 'P0002', 'U003', 'Congrats on the launch!', '2024-07-14 16:50:00'),
('C0003', 'P0003', 'U001', 'Wow!', '2024-07-14 17:05:00');
INSERT INTO Friendships VALUES
('F0001', 'U001', 'U002', 'accepted', '2024-05-20'),
('F0002', 'U002', 'U003', 'pending', '2024-06-15'),
('F0003', 'U003', 'U001', 'rejected', '2024-07-01');
INSERT INTO UserInterests VALUES
('I0001', 'U001', 'Travel'),
('I0002', 'U002', 'Technology'),
('I0003', 'U003', 'Fitness');
