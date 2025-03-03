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

# Deskripsi Data

## :abacus: Membuat Database

Chapter & Coffee merupakan database yang berkaitan dengan informasi novel, yang mencakup detail mengenai penulis, penerbit, novel itu sendiri, serta ulasan dari pengguna. Untuk membuat database tersebut maka dapat digunakan sintaks berikut.

## :open_book: Membuat Tabel Novel

Menyediakan detail lengkap tentang novel, termasuk ISBN, judul, bahasa, tahun terbit, deskripsi, kategori, jumlah halaman, harga, dan rating keseluruhan.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_novel                   | character varying(50)  | Id Novel                       		             |
| id_penulis                 | character varying(50)  | Id Penulis                   		             |
| id_penerbit                | character varying(50)  | Id Penerbit                     	             |	
| judul                      | character varying(255) | Judul Novel                		                 |
| ISBN                       | character varying(100) | ISBN Novel	                                     |
| bahasa	    	         | character varying(50)  | Bahasa yang digunakan pada novel                 |
| tahun terbit	    	     | integer                | Tahun terbit novel                               |
| edisi	    	             | character varying(255) | Edisi Novel                                      |
| jumlah_halaman	    	 | integer                | Jumlah Halaman Novel                             |
| deskripsi    	             | text                   | Deskripsi/Sinopsis Novel                         |
| rating_novel	    	     | float                  | Rating Novel                                     |


dengan query sebagai berikut:

```{r}
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
```


## :books: Membuat Tabel Penulis

Berisi informasi mengenai identitas penulis, termasuk nama, tempat dan tanggal lahir, serta jumlah buku yang telah diterbitkan.


| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_penulis                 | character varying(50)  | Id Penulis                       		         |
| penulis                    | character varying(50)  | Nama Penulis Novel                   		     |
| tempat_lahir               | character varying(50)  | Tempat Lahir Penulis Novel                     	 |	
| tanggal_lahir              | date                   | Tanggal Lahir Penulis Novel              		 |
| jumlah_buku                | integer                | Jumlah Novel yang Diterbitkan                    |


dengan query sebagai berikut:

```{r}
query <- dbExecute(con,"CREATE TABLE IF NOT EXISTS penulis1 (
    id_penulis VARCHAR(50) PRIMARY KEY,
    penulis VARCHAR(50),
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    jumlah_buku INT
    );")
```


## :office: Membuat Tabel Penerbit

Menyimpan data tentang penerbit yang bertanggung jawab atas produksi dan distribusi novel.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_penerbit                | character varying(50)  | Id Penerbit                    		             |
| nama_penerbit              | character varying(250) | Nama Penerbit                  		     |
| alamat                     | character varying(255) | Alamat Penerbit                     	         |	

dengan query sebagai berikut:

```{r}
query <- dbExecute(con, "CREATE TABLE IF NOT EXISTS penerbit1 (
    id_penerbit VARCHAR(50) PRIMARY KEY,
    nama_penerbit VARCHAR(250),
    alamat VARCHAR(255)
    );")
```


## :memo: Membuat Tabel Ulasan

Menampilkan ulasan dan penilaian dari pengguna terhadap novel, termasuk rating dan komentar yang diberikan.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_user                    | character varying(50)  | Id Pengguna                       		         |
| id_novel                   | character varying(50)  | Id Novel                   		                 |
| nama_user                  | character varying(100) | Nama Pengguna                    	             |	
| tanggal_ulasan             | character varying(100) | Tanggal Ulasan yang Diberikan Pengguna           |
| ulasan                     | text                   | Ulasan Pengguna	                                 |
| rating_user	    	     | float                  | Rating dari Pengguna                             |

dengan query berikut:

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
