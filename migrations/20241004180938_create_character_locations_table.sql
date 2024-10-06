
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'character_locations') THEN
        CREATE TABLE character_locations (
            character_id UUID NOT NULL,
            location_id UUID NOT NULL,
            character_name VARCHAR(255) NOT NULL,
            location_name VARCHAR(255) NOT NULL,
            PRIMARY KEY (character_id, location_id),
            FOREIGN KEY (character_id) REFERENCES characters(id),
            FOREIGN KEY (location_id) REFERENCES locations(id)
        );
    END IF;
END $$;

-- Insert or update entries to ensure idempotency
INSERT INTO character_locations (character_id, location_id, character_name, location_name)
VALUES

 ('c09026bb-40cf-4d3f-a0ee-cf0478544bce', 'e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Panda', 'Jujutsu Koshien Stadium'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', 'd8216511-0051-46bb-86f9-a7f737922c12', 'Mahito', 'Mahito Hideout'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', '9e724595-667f-4b02-b561-7579576eeca3', 'Mahito', 'Death Painting Womb'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', 'c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Mahito', 'Kugisaki Residence'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', '1ea1c275-4f91-436a-bf9d-97f34ffb2234', 'Shoko Ieiri', 'Tokyo Metropolitan Magic Technical College'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', 'a88472cf-fd28-4fa3-b3ea-01aa56efb998', 'Shoko Ieiri', 'Yuji Grandfather Hospital'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', '261b10e5-d4bd-4ea8-a185-fca2cde24901', 'Mai Zenin', 'Kyoto Sorcery Library'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', '6247da5e-1457-437a-a78c-bb6b402ca047', 'Mai Zenin', 'Jujutsu High Kyoto Branch'),
 ('49056c6d-42f0-4840-9a1a-a314972585f8', '401bbeca-6aad-400f-8945-bc1e1bc26c30', 'Suguru Geto', 'Cursed Womb: Death Painting'),
 ('49056c6d-42f0-4840-9a1a-a314972585f8', 'c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Suguru Geto', 'Kugisaki Residence'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', '9e724595-667f-4b02-b561-7579576eeca3', 'Esou', 'Death Painting Womb'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'b203c803-6e06-46fe-b159-2ddcec5ee991', 'Esou', 'Mahito Curse Lair'),
 ('ca3b9def-9d97-4e33-af17-e09381ccb882', '702a15aa-e955-4748-b50f-2d3de36173a5', 'Kenjaku', 'Sukuna Domain'),
 ('ca3b9def-9d97-4e33-af17-e09381ccb882', '1ade4992-af1e-4361-82bc-cea397185112', 'Kenjaku', 'Megumi Domain Expansion'),
 ('5bd29a8e-e785-404c-a010-99821c4ebfaf', '6247da5e-1457-437a-a78c-bb6b402ca047', 'Aoi Todo', 'Jujutsu High Kyoto Branch'),
 ('5bd29a8e-e785-404c-a010-99821c4ebfaf', 'c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Aoi Todo', 'Kugisaki Residence'),
 ('7a3db0fd-975d-427e-889b-10480b880faf', 'e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Rika Orimoto', 'Jujutsu Koshien Stadium'),
 ('7a3db0fd-975d-427e-889b-10480b880faf', 'c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Rika Orimoto', 'Kugisaki Residence'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', 'c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Shoko Ieiri', 'Kugisaki Residence'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', '344091e1-8291-4546-9c24-e32548723095', 'Shoko Ieiri', 'Jujutsu High Training Ground'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', 'a88472cf-fd28-4fa3-b3ea-01aa56efb998', 'Mai Zenin', 'Yuji Grandfather Hospital'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', '9e724595-667f-4b02-b561-7579576eeca3', 'Mai Zenin', 'Death Painting Womb'),
 ('82d0019b-a95f-4277-915c-5b1983d2c9d5', '9e724595-667f-4b02-b561-7579576eeca3', 'Junpei Yoshino', 'Death Painting Womb'),
 ('82d0019b-a95f-4277-915c-5b1983d2c9d5', 'a88472cf-fd28-4fa3-b3ea-01aa56efb998', 'Junpei Yoshino', 'Yuji Grandfather Hospital'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Esou', 'Jujutsu Koshien Stadium'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'b203c803-6e06-46fe-b159-2ddcec5ee991', 'Esou', 'Mahito Curse Lair'),
 ('b7cb1773-22f9-4284-bff1-0de1eb58dec7', '6247da5e-1457-437a-a78c-bb6b402ca047', 'Yu Haibara', 'Jujutsu High Kyoto Branch'),
 ('b7cb1773-22f9-4284-bff1-0de1eb58dec7', 'e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Yu Haibara', 'Jujutsu Koshien Stadium'),
 ('82d0019b-a95f-4277-915c-5b1983d2c9d5', '9e724595-667f-4b02-b561-7579576eeca3', 'Junpei Yoshino', 'Death Painting Womb'),
 ('82d0019b-a95f-4277-915c-5b1983d2c9d5', 'e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Junpei Yoshino', 'Jujutsu Koshien Stadium')
ON CONFLICT (character_id, location_id) DO NOTHING;
