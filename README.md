# Designer UI/UX (Designer branch)
📍 Tugas di GitHub:

- Membuat desain UI/UX dalam Figma atau Adobe XD.
- Menyusun ikon, warna, dan layout untuk dashboard.
- Bekerja sama dengan Front-End Developer.

# ERD Novel

![ERD Novel](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/raw/Designer/ERD%20Novel.jpg)

# Skema Database

![Skema Database](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/blob/Designer/Skema%20Database%20Novel.jpg)

# :heavy_check_mark: Deskripsi Data

## :abacus: Membuat Database

Chapter & Coffee merupakan database yang berkaitan dengan informasi novel, yang mencakup detail mengenai penulis, penerbit, novel itu sendiri, serta ulasan dari pengguna. 

dbExecute(con, "CREATE TABLE IF NOT EXISTS novel1 (
    id_novel VARCHAR(50) PRIMARY KEY,
    id_penulis VARCHAR(50),
    id_penerbit VARCHAR(50),
    judul VARCHAR(255),
    ISBN VARCHAR(100),
    bahasa VARCHAR(50),
    tahun_terbit INT,
    edisi VARCHAR(255),
    jumlah_halaman INT,
    deskripsi TEXT,
    rating_novel FLOAT
);") 

query <- dbExecute(con,"CREATE TABLE IF NOT EXISTS penulis1 (
    id_penulis VARCHAR(50) PRIMARY KEY,
    penulis VARCHAR(50),
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    jumlah_buku INT
    );")

query <- dbExecute(con, "CREATE TABLE IF NOT EXISTS penerbit1 (
    id_penerbit VARCHAR(50) PRIMARY KEY,
    nama_penerbit VARCHAR(250),
    alamat VARCHAR(255)
    );")

```{r}
query <- dbExecute(con, "CREATE TABLE IF NOT EXISTS ulasan1 (
    id_user VARCHAR(50) PRIMARY KEY,
    id_novel VARCHAR(50),
    nama_user VARCHAR(100),
    tanggal_ulasan VARCHAR(100),
    ulasan TEXT,
    rating_user FLOAT
    );")
```
