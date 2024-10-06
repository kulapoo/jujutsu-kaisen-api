
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'characters') THEN
        CREATE TABLE characters (
            id UUID PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            status VARCHAR(50) NOT NULL,
            species VARCHAR(50) NOT NULL,
            kind VARCHAR(50),
            gender VARCHAR(10) NOT NULL,
            image_url TEXT,
            created_at TIMESTAMP NOT NULL
        );
    END IF;
END $$;

INSERT INTO characters (id, name, status, species, kind, gender, image_url, created_at)
VALUES

 ('863874e7-bb2b-433e-b2a5-dc408ccdafcc', 'Satoru Gojo', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/e/ef/Satoru_Gojo_%28Anime_2%29.png/revision/latest/scale-to-width-down/153?cb=20240622022211', '2023-10-04 00:00:00'),
 ('0c910240-9d3f-49bc-86e9-9e14348a02d7', 'Yuji Itadori', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/6/6f/Yuji_Itadori_%28Anime_2%29.png/revision/latest/scale-to-width-down/350?cb=20240621133654', '2023-10-04 00:00:00'),
 ('6f9a8bb0-b23c-4f3d-91fc-736cc662b1d0', 'Megumi Fushiguro', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/d/dd/Megumi_Fushiguro_%28Anime_2%29.png/revision/latest/scale-to-width-down/159?cb=20240621133931', '2023-10-04 00:00:00'),
 ('3f51916f-ceaa-457a-a52e-76a8928789c5', 'Maki Zenin', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/3/39/Maki_Zenin_%28Volume_22%29.png/revision/latest/scale-to-width-down/337?cb=20230206185342', '2023-10-04 00:00:00'),
 ('d8238e06-286d-4912-a40d-063a54737b9e', 'Atsuya Kusakabe', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/9/9f/Atsuya_Kusakabe_%28Anime_2%29.png/revision/latest/scale-to-width-down/289?cb=20231124131252', '2023-10-04 00:00:00'),
 ('dc1fc4a8-3703-4906-aaf6-512ba01cba21', 'Yuta Okkotsu', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/5/5e/Yuta_Okkotsu_%28Anime%29.png/revision/latest/scale-to-width-down/266?cb=20231228170059', '2023-10-04 00:00:00'),
 ('12aaecc4-80e5-4058-b511-51f744da2371', 'Hiromi Higuruma', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/b/b6/Hiromi_Higuruma.png/revision/latest/scale-to-width-down/251?cb=20211109010256', '2023-10-04 00:00:00'),
 ('b5d09415-e93e-46cb-adc0-1f310d074442', 'Nobara Kugisaki', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/d/dd/Nobara_Kugisaki_%28Anime_2%29.png/revision/latest/scale-to-width-down/250?cb=20240621133809', '2023-10-04 00:00:00'),
 ('baaac35c-bfb8-4137-a034-bef3e3794e8f', 'Toji Fushiguro', 'Deceased', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/d/db/Toji_Fushiguro_%28Anime%29.png/revision/latest/scale-to-width-down/350?cb=20221217105010', '2023-10-04 00:00:00'),
 ('7ab356cf-3b7b-4acc-b1d9-ce216580161d', 'Ryomen Sukuna', 'Deceased', 'Cursed Spirit', 'Demon', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/8/85/Sukuna_%28Chapter_117%29.png/revision/latest/scale-to-width-down/342?cb=20210309183727', '2023-10-04 00:00:00'),
 ('ca3b9def-9d97-4e33-af17-e09381ccb882', 'Kenjaku', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/2/2b/Kenjaku_%28Anime%29.png/revision/latest/scale-to-width-down/191?cb=20240618020107', '2023-10-04 00:00:00'),
 ('7ec46944-3121-46a4-b5fb-f894bd4a9f32', 'Yuki Tsukumo', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/4/49/Yuki_Tsukumo_%28Anime_2%29.png/revision/latest/scale-to-width-down/280?cb=20231221172040', '2023-10-04 00:00:00'),
 ('362c414f-53eb-444b-b7ca-9d42faab511a', 'Choso', 'Alive', 'Cursed Spirit', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/1/1c/Choso_%28Anime_2%29.png/revision/latest/scale-to-width-down/267?cb=20230903192338', '2023-10-04 00:00:00'),
 ('5bd29a8e-e785-404c-a010-99821c4ebfaf', 'Aoi Todo', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/7/79/Aoi_Todo_%28Anime%29.png/revision/latest/scale-to-width-down/218?cb=20240621022047', '2023-10-04 00:00:00'),
 ('2065072e-11a6-4b86-b48a-f65f090fd5ac', 'Kasumi Miwa', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/6/64/Kasumi_Miwa_%28Anime%29.png/revision/latest/scale-to-width-down/236?cb=20240621021537', '2023-10-04 00:00:00'),
 ('c09026bb-40cf-4d3f-a0ee-cf0478544bce', 'Panda', 'Alive', 'Cursed Corpse', '', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/2/2b/Panda_%28Anime_2%29.png/revision/latest/scale-to-width-down/350?cb=20211225181425', '2023-10-04 00:00:00'),
 ('011883ff-5fcb-47e4-8abf-64dce1f3ef50', 'Toge Inumaki', 'Alive', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/c/cb/Toge_Inumaki_%28Anime_2%29.png/revision/latest/scale-to-width-down/129?cb=20240622024715', '2023-10-04 00:00:00'),
 ('75c9d225-1511-47e7-a8b4-e2763127701a', 'Mahito', 'Deceased', 'Cursed Spirit', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/4/4e/Mahito_%28Anime%29.png/revision/latest/scale-to-width-down/208?cb=20240618013419', '2023-10-04 00:00:00'),
 ('3395e7d0-1297-46bb-8ced-6c751180d479', 'Mei Mei', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/a/a8/Mei_Mei_%28Anime_2%29.png/revision/latest?cb=20231124134449', '2023-10-04 00:00:00'),
 ('7a3db0fd-975d-427e-889b-10480b880faf', 'Rika Orimoto', 'Cursed Spirit', 'Cursed Spirit', 'Vengeful Spirit', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/e/e3/Rika_Orimoto_%28Anime%29.png/revision/latest?cb=20211104034101', '2023-10-04 00:00:00'),
 ('6736e34b-33c9-43bc-bc78-00c8a64e9947', 'Shoko Ieiri', 'Alive', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/a/af/Shoko_Ieiri_%28Anime_2%29.png/revision/latest?cb=20231124131631', '2023-10-04 00:00:00'),
 ('63582c26-b19e-40c4-85e4-69339ccda16c', 'Nanami Kento', 'Deceased', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/b/b0/Kento_Nanami_%28Anime%29.png/revision/latest?cb=20240618014214', '2023-10-04 00:00:00'),
 ('762367ac-3ab3-4c1d-8349-6a1dba918fde', 'Mai Zenin', 'Deceased', 'Human', 'Sorcerer', 'Female', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/a/a5/Mai_Zen%27in_%28Anime%29.png/revision/latest?cb=20240620132005', '2023-10-04 00:00:00'),
 ('49056c6d-42f0-4840-9a1a-a314972585f8', 'Suguru Geto', 'Deceased', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/c/c2/Suguru_Geto_%28Prequel_Anime%29.png/revision/latest?cb=20211104034641', '2023-10-04 00:00:00'),
 ('82d0019b-a95f-4277-915c-5b1983d2c9d5', 'Junpei Yoshino', 'Deceased', 'Human', 'Non-Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/0/01/Junpei_Yoshino_%28Anime%29.png/revision/latest?cb=20201025152028', '2023-10-04 00:00:00'),
 ('bd3ef7d7-9b13-43a0-a98b-e3d8beb587c7', 'Esou', 'Deceased', 'Cursed Spirit', 'Cursed Womb: Death Painting', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/5/5f/Eso_%28Anime%29.png/revision/latest?cb=20210308013541', '2023-10-04 00:00:00'),
 ('b7cb1773-22f9-4284-bff1-0de1eb58dec7', 'Yu Haibara', 'Deceased', 'Human', 'Sorcerer', 'Male', 'https://static.wikia.nocookie.net/jujutsu-kaisen/images/e/e1/Yu_Haibara_%28Anime%29.png/revision/latest?cb=20230501184315', '2023-10-04 00:00:00')
ON CONFLICT (id) DO UPDATE
SET
    name = EXCLUDED.name,
    status = EXCLUDED.status,
    species = EXCLUDED.species,
    kind = EXCLUDED.kind,
    gender = EXCLUDED.gender,
    image_url = EXCLUDED.image_url,
    created_at = EXCLUDED.created_at;
