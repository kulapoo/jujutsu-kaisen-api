
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'locations') THEN
        CREATE TABLE locations (
            id UUID PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            kind VARCHAR(100) NOT NULL,
            dimension VARCHAR(100) NOT NULL,
            created_at TIMESTAMP NOT NULL
        );
    END IF;
END $$;

-- Insert or update entries to ensure idempotency
INSERT INTO locations (id, name, kind, dimension, created_at)
VALUES

 ('1ea1c275-4f91-436a-bf9d-97f34ffb2234', 'Tokyo Metropolitan Magic Technical College', 'School', 'Earth', '2023-10-04 00:00:00'),
 ('75904f03-21c6-42f7-a0e5-6c3d92e52f9b', 'Shibuya', 'District', 'Earth', '2023-10-04 00:00:00'),
 ('6247da5e-1457-437a-a78c-bb6b402ca047', 'Jujutsu High Kyoto Branch', 'School', 'Earth', '2023-10-04 00:00:00'),
 ('1ade4992-af1e-4361-82bc-cea397185112', 'Megumi Domain Expansion', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00'),
 ('e6b5c576-86f1-40e1-85c0-a2ca5e66efac', 'Fushiguro Residence', 'Residence', 'Earth', '2023-10-04 00:00:00'),
 ('702a15aa-e955-4748-b50f-2d3de36173a5', 'Sukuna Domain', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00'),
 ('d8216511-0051-46bb-86f9-a7f737922c12', 'Mahito Hideout', 'Hideout', 'Earth', '2023-10-04 00:00:00'),
 ('d081bd56-a2bb-4378-a3ed-f5c0fbb5ab84', 'Sugisawa High School', 'School', 'Earth', '2023-10-04 00:00:00'),
 ('48bed489-ff90-4bc0-8e1f-7cbaaa29c399', 'Zenin Clan Compound', 'Residence', 'Earth', '2023-10-04 00:00:00'),
 ('401bbeca-6aad-400f-8945-bc1e1bc26c30', 'Cursed Womb: Death Painting', 'Cursed Womb', 'Unknown', '2023-10-04 00:00:00'),
 ('6d3971c6-9a80-4a30-a2de-ca0f086b1eba', 'Gojo Family Compound', 'Residence', 'Earth', '2023-10-04 00:00:00'),
 ('e665e2ec-c7ff-47b4-a2bb-1f97ae8beda3', 'Jujutsu Koshien Stadium', 'Stadium', 'Earth', '2023-10-04 00:00:00'),
 ('1d85813b-4b02-4e01-857c-d392f20974cc', 'Shibuya Crossing', 'District', 'Earth', '2023-10-04 00:00:00'),
 ('e58985ce-9790-442d-b9aa-4ea4db344bbd', 'Nitta Apartment', 'Residence', 'Earth', '2023-10-04 00:00:00'),
 ('c39a03f9-c8b8-42a0-a737-5077320a4cd0', 'Kugisaki Residence', 'Residence', 'Earth', '2023-10-04 00:00:00'),
 ('344091e1-8291-4546-9c24-e32548723095', 'Jujutsu High Training Ground', 'Training Ground', 'Earth', '2023-10-04 00:00:00'),
 ('5efb9d6a-3096-4021-96bf-d87aaadff67a', 'Kyoto Training Ground', 'Training Ground', 'Earth', '2023-10-04 00:00:00'),
 ('1ea79b81-3cff-4a09-bd22-11b36c438b13', 'Zennin Clan Domain', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00'),
 ('cc53de6e-c9c0-4c52-a371-5ed75e1f4aeb', 'Itadori Hideout', 'Hideout', 'Earth', '2023-10-04 00:00:00'),
 ('a88472cf-fd28-4fa3-b3ea-01aa56efb998', 'Yuji Grandfather Hospital', 'Hospital', 'Earth', '2023-10-04 00:00:00'),
 ('261b10e5-d4bd-4ea8-a185-fca2cde24901', 'Kyoto Sorcery Library', 'Library', 'Earth', '2023-10-04 00:00:00'),
 ('2fb5f05b-2a66-4ffa-932d-422e3de2749a', 'Fushiguro Temple', 'Temple', 'Earth', '2023-10-04 00:00:00'),
 ('9e724595-667f-4b02-b561-7579576eeca3', 'Death Painting Womb', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00'),
 ('b203c803-6e06-46fe-b159-2ddcec5ee991', 'Mahito Curse Lair', 'Hideout', 'Unknown', '2023-10-04 00:00:00'),
 ('f3e186d4-0bd9-46f1-9cc1-960cd65da86f', 'Shibuya Sealing Site', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00'),
 ('fc11598e-db8d-4c47-8351-18e09260d8af', 'Gakuganji Hideout', 'Hideout', 'Earth', '2023-10-04 00:00:00'),
 ('6f3e1c8e-aaae-40a3-85aa-fb30a5c136ab', 'Nitta Curse Workshop', 'Workshop', 'Earth', '2023-10-04 00:00:00'),
 ('fcc3ea93-65b7-4c96-80c2-cdebe43247f9', 'Yaga Office', 'Office', 'Earth', '2023-10-04 00:00:00'),
 ('0356ae6f-33cd-4aab-8764-7f4e05b28dda', 'Gojo Hideout', 'Hideout', 'Earth', '2023-10-04 00:00:00'),
 ('2bc6694f-b938-4613-bc20-6b94a4312d2e', 'Jogo Volcano Lair', 'Cursed Domain', 'Unknown', '2023-10-04 00:00:00')
ON CONFLICT (id) DO UPDATE
SET
    name = EXCLUDED.name,
    kind = EXCLUDED.kind,
    dimension = EXCLUDED.dimension,
    created_at = EXCLUDED.created_at;
