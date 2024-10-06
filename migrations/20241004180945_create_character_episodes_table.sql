
-- Create the character_episodes table if it does not exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'character_episodes') THEN
        CREATE TABLE character_episodes (
            character_id UUID NOT NULL,
            episode_id UUID NOT NULL,
            episode_code VARCHAR(100) NOT NULL,
            character_name VARCHAR(255) NOT NULL,
            episode_name VARCHAR(255) NOT NULL,
            PRIMARY KEY (character_id, episode_id),
            FOREIGN KEY (character_id) REFERENCES characters(id),
            FOREIGN KEY (episode_id) REFERENCES episodes(id)
        );
    END IF;
END $$;

-- Insert or update entries to ensure idempotency
INSERT INTO character_episodes (character_id, episode_id, episode_code, character_name, episode_name)
VALUES

 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', 'fe55b449-2b69-4497-8cff-8ee30eba9662', 'Satoru Gojo', 'Ryomen Sukuna', 'S01E01'),
 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', 'b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Satoru Gojo', 'Cursed Womb Must Die -II-', 'S01E05'),
 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', '741698fa-e680-425a-9b69-fd926261cc29', 'Satoru Gojo', 'Assault', 'S01E07'),
 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', 'c52809f3-3889-4d9b-8009-3db8ad1a0d3f', 'Satoru Gojo', 'To You, Someday', 'S01E12'),
 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', '3da3cdc6-0b29-4167-8f66-4351d94d7aca', 'Satoru Gojo', 'Accomplices', 'S01E24'),
 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', '49b3e05c-642c-4916-9d1b-5ce335c00a80', 'Satoru Gojo', 'Shibuya Incident', 'S02E03'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'fe55b449-2b69-4497-8cff-8ee30eba9662', 'Yuji Itadori', 'Ryomen Sukuna', 'S01E01'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', '25f1f871-6cfa-478f-9745-45eac19fc616', 'Yuji Itadori', 'For Myself', 'S01E02'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'e6b55ac7-4141-4869-b8d2-07e15f69c130', 'Yuji Itadori', 'Girl of Steel', 'S01E03'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Yuji Itadori', 'Cursed Womb Must Die -II-', 'S01E05'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'c52809f3-3889-4d9b-8009-3db8ad1a0d3f', 'Yuji Itadori', 'To You, Someday', 'S01E12'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', '3da3cdc6-0b29-4167-8f66-4351d94d7aca', 'Yuji Itadori', 'Accomplices', 'S01E24'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'c563a8b7-f567-4691-9f2d-a604871f5a1d', 'Yuji Itadori', 'Itadoris Extermination Mission', 'S02E01'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'bd80261a-888b-4490-9616-b92f5d7b8790', 'Yuji Itadori', 'Yujis Betrayal', 'S02E06'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'e6b55ac7-4141-4869-b8d2-07e15f69c130', 'Megumi Fushiguro', 'Girl of Steel', 'S01E03'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Megumi Fushiguro', 'Cursed Womb Must Die -II-', 'S01E05'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'cf813b90-f9a0-4e14-bddc-315f731ee1a9', 'Megumi Fushiguro', 'Boredom', 'S01E08'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'c52809f3-3889-4d9b-8009-3db8ad1a0d3f', 'Megumi Fushiguro', 'To You, Someday', 'S01E12'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'd78c372f-3019-411f-900b-2df9f89a2a71', 'Megumi Fushiguro', 'The Origin of Blind Obedience', 'S01E22'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'fea34d03-0dd6-488b-b470-e4160d7b7426', 'Megumi Fushiguro', 'Shadow of the Nation', 'S02E02'),
 ('3f51916f-ceaa-457a-a52e-76a8928789c5', 'f0f9d030-b3b0-465d-b55f-6a67705d96ca', 'Maki Zenin', 'Small Fry and Reverse Retribution', 'S01E09'),
 ('3f51916f-ceaa-457a-a52e-76a8928789c5', '888a3658-5486-4668-ab6b-d58e5dceac8c', 'Maki Zenin', 'Idle Transfiguration', 'S01E10'),
 ('3f51916f-ceaa-457a-a52e-76a8928789c5', '82c3f89f-30a4-4182-987e-ba4314b37255', 'Maki Zenin', 'Kyoto Sister School Exchange Event - Group Battle 0', 'S01E14'),
 ('3f51916f-ceaa-457a-a52e-76a8928789c5', '49b3e05c-642c-4916-9d1b-5ce335c00a80', 'Maki Zenin', 'Shibuya Incident', 'S02E03'),
 ('b5d09415-e93e-46cb-adc0-1f310d074442', 'e6b55ac7-4141-4869-b8d2-07e15f69c130', 'Nobara Kugisaki', 'Girl of Steel', 'S01E03'),
 ('b5d09415-e93e-46cb-adc0-1f310d074442', 'b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Nobara Kugisaki', 'Cursed Womb Must Die -II-', 'S01E05'),
 ('b5d09415-e93e-46cb-adc0-1f310d074442', 'c52809f3-3889-4d9b-8009-3db8ad1a0d3f', 'Nobara Kugisaki', 'To You, Someday', 'S01E12'),
 ('b5d09415-e93e-46cb-adc0-1f310d074442', '3da3cdc6-0b29-4167-8f66-4351d94d7aca', 'Nobara Kugisaki', 'Accomplices', 'S01E24'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', 'fe55b449-2b69-4497-8cff-8ee30eba9662', 'Ryomen Sukuna', 'Ryomen Sukuna', 'S01E01'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', 'eb64b8ab-0742-4710-94df-47e323302272', 'Ryomen Sukuna', 'After Rain', 'S01E06'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', '8c851f0c-f101-49b7-8ee7-6425d9f6ff6a', 'Ryomen Sukuna', 'Tomorrow', 'S01E13'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', 'c563a8b7-f567-4691-9f2d-a604871f5a1d', 'Ryomen Sukuna', 'Itadoris Extermination Mission', 'S02E01'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', '41335db7-6353-439f-9639-f4c1049f5d93', 'Ryomen Sukuna', 'Ruptured Reality', 'S02E05'),
 ('362c414f-53eb-444b-b7ca-9d42faab511a', 'c563a8b7-f567-4691-9f2d-a604871f5a1d', 'Choso', 'Itadoris Extermination Mission', 'S02E01'),
 ('362c414f-53eb-444b-b7ca-9d42faab511a', '49b3e05c-642c-4916-9d1b-5ce335c00a80', 'Choso', 'Shibuya Incident', 'S02E03'),
 ('c09026bb-40cf-4d3f-a0ee-cf0478544bce', 'f0f9d030-b3b0-465d-b55f-6a67705d96ca', 'Panda', 'Small Fry and Reverse Retribution', 'S01E09'),
 ('c09026bb-40cf-4d3f-a0ee-cf0478544bce', '82c3f89f-30a4-4182-987e-ba4314b37255', 'Panda', 'Kyoto Sister School Exchange Event - Group Battle 0', 'S01E14'),
 ('c09026bb-40cf-4d3f-a0ee-cf0478544bce', 'a302d756-0400-4e87-9a58-af8e9b195686', 'Panda', 'Jujutsu Koshien', 'S01E21'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', 'f0f9d030-b3b0-465d-b55f-6a67705d96ca', 'Mahito', 'Small Fry and Reverse Retribution', 'S01E09'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', '888a3658-5486-4668-ab6b-d58e5dceac8c', 'Mahito', 'Idle Transfiguration', 'S01E10'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', 'e666d604-42b6-4ee7-a2c4-ef10a5427589', 'Mahito', 'Sage', 'S01E18'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', '8a2963e9-3882-4e3f-9606-ad06e36dc432', 'Mahito', 'Shibuya Incident - Part 2', 'S02E04'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', 'b48b4e32-85ce-4b32-8ca5-94a5c7b27682', 'Shoko Ieiri', 'Cursed Womb Must Die -II-', 'S01E05'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', '888a3658-5486-4668-ab6b-d58e5dceac8c', 'Shoko Ieiri', 'Idle Transfiguration', 'S01E10'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', 'c0f7a174-c911-42ae-9d07-cd24cce28d60', 'Mai Zenin', 'Kyoto Sister School Exchange Event - Group Battle 1', 'S01E15'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', 'e542293a-d043-4f52-8bcb-f63d353b03ba', 'Mai Zenin', 'Kyoto Sister School Exchange Event - Group Battle 2', 'S01E16'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', '49b3e05c-642c-4916-9d1b-5ce335c00a80', 'Mai Zenin', 'Shibuya Incident', 'S02E03'),
 ('49056c6d-42f0-4840-9a1a-a314972585f8', '82db82fa-3857-40ec-b45f-2523366f03d0', 'Suguru Geto', 'The Origin of Blind Obedience 2', 'S01E23'),
 ('49056c6d-42f0-4840-9a1a-a314972585f8', '8a2963e9-3882-4e3f-9606-ad06e36dc432', 'Suguru Geto', 'Shibuya Incident - Part 2', 'S02E04'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'bd3a3aeb-5bde-4186-8dd2-2be73d2c4f89', 'Esou', 'Kyoto Sister School Exchange Event - Group Battle 3', 'S01E17'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'e666d604-42b6-4ee7-a2c4-ef10a5427589', 'Esou', 'Sage', 'S01E18'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'd78c372f-3019-411f-900b-2df9f89a2a71', 'Esou', 'The Origin of Blind Obedience', 'S01E22')
ON CONFLICT (character_id, episode_id) DO UPDATE
SET
    episode_code = EXCLUDED.episode_code,
    character_name = EXCLUDED.character_name,
    episode_name = EXCLUDED.episode_name;
