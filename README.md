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

## :desktop_computer: Membuat Database

Chapter & Coffee merupakan database yang berkaitan dengan informasi novel, yang mencakup detail mengenai penulis, penerbit, novel itu sendiri, serta ulasan dari pengguna. Untuk membuat database tersebut maka dapat digunakan sintaks berikut.

## :desktop_computer: Membuat Tabel Novel


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



## :desktop_computer: Membuat Tabel Penulis

```{r}
query <- dbExecute(con,"CREATE TABLE IF NOT EXISTS penulis1 (
    id_penulis VARCHAR(50) PRIMARY KEY,
    penulis VARCHAR(50),
    tempat_lahir VARCHAR(100),
    tanggal_lahir DATE,
    jumlah_buku INT
    );")
```

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_penulis                 | character varying(50)  | Id Penulis                       		         |
| penulis                    | character varying(50)  | Nama Penulis Novel                   		     |
| tempat_lahir               | character varying(50)  | Tempat Lahir Penulis Novel                     	 |	
| tanggal_lahir              | date                   | Tanggal Lahir Penulis Novel              		 |
| jumlah_buku                | integer                | Jumlah Novel yang Diterbitkan                    |


## :desktop_computer: Membuat Tabel Penerbit


```{r}
query <- dbExecute(con, "CREATE TABLE IF NOT EXISTS penerbit1 (
    id_penerbit VARCHAR(50) PRIMARY KEY,
    nama_penerbit VARCHAR(250),
    alamat VARCHAR(255)
    );")
```

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_penerbit                | character varying(50)  | Id Penerbit                    		             |
| nama_penerbit              | character varying(250) | Nama Penerbit Novel                  		     |
| alamat                     | character varying(255) | Alamat Penerbit                     	 |	


## :desktop_computer: Membuat Tabel Ulasan

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

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_user                    | character varying(50)  | Id Pengguna                       		         |
| id_novel                   | character varying(50)  | Id Novel                   		                 |
| nama_user                  | character varying(100) | Nama Pengguna                    	             |	
| tanggal_ulasan             | character varying(100) | Tanggal Ulasan yang Diberikan Pengguna           |
| ulasan                     | text                   | Ulasan Pengguna	                                 |
| rating_user	    	     | float                  | Rating dari Pengguna                             |
