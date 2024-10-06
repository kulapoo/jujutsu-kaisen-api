
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'episodes') THEN
        CREATE TABLE episodes (
            id UUID PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            air_date DATE NOT NULL,
            episode_code VARCHAR(10) NOT NULL,
            created_at TIMESTAMP NOT NULL
        );
    END IF;
END $$;

-- Insert or update entries to ensure idempotency
INSERT INTO episodes (id, name, air_date, episode_code, created_at)
VALUES

 ('fe55b449-2b69-4497-8cff-8ee30eba9662', 'Ryomen Sukuna', '2020-10-03', 'S01E01', '2023-10-04 00:00:00'),
 ('25f1f871-6cfa-478f-9745-45eac19fc616', 'For Myself', '2020-10-10', 'S01E02', '2023-10-04 00:00:00'),
 ('e6b55ac7-4141-4869-b8d2-07e15f69c130', 'Girl of Steel', '2020-10-17', 'S01E03', '2023-10-04 00:00:00'),
 ('e89e992b-4328-47cf-a7a4-19ab9478da09', 'Cursed Womb Must Die', '2020-10-24', 'S01E04', '2023-10-04 00:00:00'),
 ('b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Cursed Womb Must Die -II-', '2020-10-31', 'S01E05', '2023-10-04 00:00:00'),
 ('eb64b8ab-0742-4710-94df-47e323302272', 'After Rain', '2020-11-07', 'S01E06', '2023-10-04 00:00:00'),
 ('741698fa-e680-425a-9b69-fd926261cc29', 'Assault', '2020-11-14', 'S01E07', '2023-10-04 00:00:00'),
 ('cf813b90-f9a0-4e14-bddc-315f731ee1a9', 'Boredom', '2020-11-21', 'S01E08', '2023-10-04 00:00:00'),
 ('f0f9d030-b3b0-465d-b55f-6a67705d96ca', 'Small Fry and Reverse Retribution', '2020-11-28', 'S01E09', '2023-10-04 00:00:00'),
 ('888a3658-5486-4668-ab6b-d58e5dceac8c', 'Idle Transfiguration', '2020-12-05', 'S01E10', '2023-10-04 00:00:00'),
 ('a6787fba-fea0-47db-a430-b4706d0a9631', 'Narrow-minded', '2020-12-12', 'S01E11', '2023-10-04 00:00:00'),
 ('c52809f3-3889-4d9b-8009-3db8ad1a0d3f', 'To You, Someday', '2020-12-19', 'S01E12', '2023-10-04 00:00:00'),
 ('8c851f0c-f101-49b7-8ee7-6425d9f6ff6a', 'Tomorrow', '2020-12-26', 'S01E13', '2023-10-04 00:00:00'),
 ('82c3f89f-30a4-4182-987e-ba4314b37255', 'Kyoto Sister School Exchange Event - Group Battle 0', '2021-01-09', 'S01E14', '2023-10-04 00:00:00'),
 ('c0f7a174-c911-42ae-9d07-cd24cce28d60', 'Kyoto Sister School Exchange Event - Group Battle 1', '2021-01-16', 'S01E15', '2023-10-04 00:00:00'),
 ('e542293a-d043-4f52-8bcb-f63d353b03ba', 'Kyoto Sister School Exchange Event - Group Battle 2', '2021-01-23', 'S01E16', '2023-10-04 00:00:00'),
 ('bd3a3aeb-5bde-4186-8dd2-2be73d2c4f89', 'Kyoto Sister School Exchange Event - Group Battle 3', '2021-01-30', 'S01E17', '2023-10-04 00:00:00'),
 ('e666d604-42b6-4ee7-a2c4-ef10a5427589', 'Sage', '2021-02-06', 'S01E18', '2023-10-04 00:00:00'),
 ('1d2c7609-2393-4113-b8ad-0d3776f9e627', 'Black Flash', '2021-02-13', 'S01E19', '2023-10-04 00:00:00'),
 ('5f074139-daf0-4006-ab45-db4a94e2993b', 'Nonstandard', '2021-02-20', 'S01E20', '2023-10-04 00:00:00'),
 ('a302d756-0400-4e87-9a58-af8e9b195686', 'Jujutsu Koshien', '2021-02-27', 'S01E21', '2023-10-04 00:00:00'),
 ('d78c372f-3019-411f-900b-2df9f89a2a71', 'The Origin of Blind Obedience', '2021-03-06', 'S01E22', '2023-10-04 00:00:00'),
 ('82db82fa-3857-40ec-b45f-2523366f03d0', 'The Origin of Blind Obedience 2', '2021-03-13', 'S01E23', '2023-10-04 00:00:00'),
 ('3da3cdc6-0b29-4167-8f66-4351d94d7aca', 'Accomplices', '2021-03-20', 'S01E24', '2023-10-04 00:00:00'),
 ('c563a8b7-f567-4691-9f2d-a604871f5a1d', 'Itadori Extermination Mission', '2021-09-10', 'S02E01', '2023-10-04 00:00:00'),
 ('fea34d03-0dd6-488b-b470-e4160d7b7426', 'Shadow of the Nation', '2021-09-17', 'S02E02', '2023-10-04 00:00:00'),
 ('49b3e05c-642c-4916-9d1b-5ce335c00a80', 'Shibuya Incident', '2021-09-24', 'S02E03', '2023-10-04 00:00:00'),
 ('8a2963e9-3882-4e3f-9606-ad06e36dc432', 'Shibuya Incident - Part 2', '2021-10-01', 'S02E04', '2023-10-04 00:00:00'),
 ('41335db7-6353-439f-9639-f4c1049f5d93', 'Ruptured Reality', '2021-10-08', 'S02E05', '2023-10-04 00:00:00'),
 ('bd80261a-888b-4490-9616-b92f5d7b8790', 'Yuji Betrayal', '2021-10-15', 'S02E06', '2023-10-04 00:00:00')
ON CONFLICT (id) DO UPDATE
SET
    name = EXCLUDED.name,
    air_date = EXCLUDED.air_date,
    episode_code = EXCLUDED.episode_code,
    created_at = EXCLUDED.created_at;
