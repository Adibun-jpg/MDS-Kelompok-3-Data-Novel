# Designer UI/UX (Designer branch)
📍 Tugas di GitHub:

- Membuat desain UI/UX dalam Figma atau Adobe XD.
- Menyusun ikon, warna, dan layout untuk dashboard.
- Bekerja sama dengan Front-End Developer.

# ERD Novel

![ERD Novel](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/raw/Designer/ERD%20Novel.jpg)

ERD ini menggambarkan struktur database untuk sistem manajemen novel yang mencakup empat entitas utama, yaitu **Novel**, **Penulis**, **Penerbit**, dan **Ulasan**. Hubungan antar entitas menunjukkan bahwa satu penulis dapat menulis banyak novel (**1:M**), satu penerbit dapat menerbitkan banyak novel (**1:M**), dan satu novel dapat memiliki banyak ulasan dari berbagai pengguna (**1:M**). Struktur ini memungkinkan pengelolaan data yang sistematis, memudahkan pencarian informasi berdasarkan penulis atau penerbit tertentu, serta memungkinkan analisis ulasan dan rating yang diberikan oleh pengguna terhadap suatu novel.


# Skema Database

![Skema Database](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/blob/Designer/Skema%20Database%20Novel.jpg)

# Tabel Novel
```sql
CREATE TABLE "novel" (
    "id_novel" TEXT,
    "id_penulis" TEXT,
    "id_penerbit" TEXT,
    "judul" TEXT,
    "ISBN" TEXT,
    "bahasa" TEXT,
    "tahun_terbit" INTEGER,
    "edisi" TEXT,
    "jumlah_halaman" INTEGER,
    "deskripsi" TEXT,
    "rating_novel" INTEGER,
    "kategori" TEXT,
    "harga" TEXT,
    "link" TEXT,
    "Sampul" TEXT,
    PRIMARY KEY("id_novel"),
    FOREIGN KEY("id_penerbit") REFERENCES "penerbit"("id_penerbit"),
    FOREIGN KEY("id_penulis") REFERENCES "penulis"("id_penulis")
);
```

# Tabel Penerbit
```sql
CREATE TABLE "penerbit" (
    "id_penerbit" TEXT,
    "nama_penerbit" TEXT,
    "alamat" TEXT,
    "latitude" TEXT,
    "longitude" TEXT,
    PRIMARY KEY("id_penerbit")
);
```

# Tabel Penulis
```sql
CREATE TABLE "penulis" (
    "id_penulis" TEXT,
    "penulis" TEXT,
    "tempat_lahir" TEXT,
    "tanggal_lahir" TEXT,
    "jumlah_buku" INTEGER,
    PRIMARY KEY("id_penulis")
);
```

# Tabel Ulasan
```sql
CREATE TABLE "ulasan" (
    "id_user" TEXT,
    "id_novel" TEXT,
    "nama_user" TEXT,
    "tanggal_ulasan" TEXT,
    "ulasan" TEXT,
    "rating_user" REAL,
    PRIMARY KEY("id_user"),
    FOREIGN KEY("id_novel") REFERENCES "novel"("id_novel")
);
```
