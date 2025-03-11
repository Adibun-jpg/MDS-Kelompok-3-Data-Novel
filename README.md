
# Designer UI/UX (Designer branch)
📍 Tugas di GitHub:

- Membuat desain UI/UX dalam Figma atau Adobe XD.
- Menyusun ikon, warna, dan layout untuk dashboard.
- Bekerja sama dengan Front-End Developer.

# ERD Novel

![ERD Novel](https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Designer/ERD%20Novel%20New.jpg)

ERD ini menggambarkan struktur database untuk sistem manajemen novel yang mencakup empat entitas utama, yaitu **Novel**, **Penulis**, **Penerbit**, dan **Ulasan**. Hubungan antar entitas menunjukkan bahwa satu penulis dapat menulis banyak novel (**1:M**), satu penerbit dapat menerbitkan banyak novel (**1:M**), dan satu novel dapat memiliki banyak ulasan dari berbagai pengguna (**1:M**). Struktur ini memungkinkan pengelolaan data yang sistematis, memudahkan pencarian informasi berdasarkan penulis atau penerbit tertentu, serta memungkinkan analisis ulasan dan rating yang diberikan oleh pengguna terhadap suatu novel.


# Skema Database

![Skema Database](https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Designer/Skema%20database.jpg)

# Tabel Novel
```sql
CREATE TABLE novel (
    id_novel TEXT NOT NULL,
    id_penulis TEXT NOT NULL,
    id_penerbit TEXT NOT NULL,
    judul TEXT,
    ISBN TEXT,
    bahasa TEXT,
    tahun_terbit INTEGER,
    edisi TEXT,
    jumlah_halaman INTEGER,
    deskripsi TEXT,
    rating_novel REAL,
    kategori TEXT,
    harga TEXT,
    link TEXT,
    Sampul TEXT,
    PRIMARY KEY (id_novel)
);
```

# Tabel Penerbit
```sql
CREATE TABLE penerbit (
    id_penerbit TEXT NOT NULL,
    nama_penerbit TEXT,
    alamat TEXT,
    latitude REAL,
    longitude REAL,
    PRIMARY KEY (id_penerbit)
);
```

# Tabel Penulis
```sql
CREATE TABLE penulis (
    id_penulis TEXT NOT NULL,
    penulis_ TEXT,
    tempat_lahir TEXT,
    tanggal_lahir TEXT,
    PRIMARY KEY (id_penulis)
);
```

# Tabel Ulasan
```sql
CREATE TABLE ulasan (
    id_user TEXT NOT NULL,
    id_novel TEXT NOT NULL,
    nama_user TEXT,
    tanggal_ulasan TEXT,
    ulasan TEXT,
    rating_user REAL,
    PRIMARY KEY (id_user, id_novel),
    FOREIGN KEY (id_novel) REFERENCES novel(id_novel)
);
```
=======

# Front End Developer (Front-End branch)
📍 Tugas di GitHub:

- Mengembangkan tampilan dashboard dengan React.js, Vue.js, atau HTML+CSS.
- Menghubungkan UI dengan API dari Back-End.
- Menambahkan fitur pencarian, filter, dan sorting novel.
=======
<div align="center">
  <img width="1920" height="480" src="https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/blob/main/Image/Header%20Chapter%20%26%20Coffee%20.png">
</div>

# ☕Daftar Menu
- [Tentang Chapter & Coffee](#chapter-and-coffee)
- [Tampilan Halaman](#tampilan-halaman)
- [Demo](#demo)
- [Skema Database (Pondasi Perpustakaan)](#Skema-Database-atau-Pondasi-Perpustakaan)
- [ERD (Alur Cerita)](#ERD-atau-Alur-Cerita)
- [Deskripsi Data (Data Synopsis)](#Deskripsi-Data-atau-Data-Synopsis)
- [Folder Structure (Rak Buku)](#open_file_folder-folder-structure-atau-rak-buku)
- [Tim Penulis](#tim-penulis)


# Chapter and Coffee
Selamat datang di Chapter & Coffee! Jelajahi dunia novel dengan cara yang simpel dan asik. Dari novel paling hits, penulis dengan karya terbanyak, hingga kategori yang pas buat mood kamu—semuanya ada di sini! Buka halaman, temukan cerita, dan biarkan Chapter & Coffee jadi tempat terbaik untuk eksplorasi novel favoritmu. Karena setiap cerita layak untuk dinikmati! ✨📖

## 📌 Fitur Utama  

### 1️⃣ **Pencarian Novel**  
- Temukan novel favorit dengan cepat menggunakan fitur pencarian instan.

### 2️⃣ **Rekomendasi Novel Terbaik**  
- Menampilkan novel dengan rating tertinggi sebagai rekomendasi utama.  
- Detail lengkap seperti penulis, tahun terbit, ISBN, dan bahasa yang tersedia.  

### 3️⃣ **Koleksi Novel & Ulasan Pengguna**  
- Menyediakan berbagai novel dalam tampilan kartu yang interaktif.  
- Fitur **Read More** untuk melihat detail novel dan ulasan pengguna.  
- Ulasan pengguna menampilkan total ulasan, rating, serta ulasan dari pembaca.  

### 4️⃣ **Navigasi Mudah**  
- Sidebar untuk akses cepat ke **Penulis, Penerbit, Ulasan**, dan **Statistik Novel**.  
- Visualisasi seperti jumlah penerbit, kota dengan penerbit terbanyak, serta **peta interaktif** lokasi penerbit buku.  

# Tampilan Halaman
Website Chapter & Coffee dilengkapi dengan berbagai fitur yang mempermudah pengguna dalam mencari dan mengeksplorasi novel. Dari daftar novel paling favorit, penulis dengan karya terbanyak, hingga rekomendasi berdasarkan kategori—semuanya dirancang untuk membantu pengguna menemukan bacaan yang paling pas. Adapun fitur dari setiap sidebar di website Chapter & Coffee adalah sebagai berikut:

1. **Home** <br>
- Tampilan Halam Utama **"Cari Novel di Sini"**
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Home.jpeg">
   </p>
   Menampilkan informasi judul novel, tahun terbit, penulis, ISBN, rating tertinggi, serta koleksi novel berdasarkan kategori, dengan fitur pencarian dan navigasi untuk eksplorasi lebih lanjut.

- Sekilas tentang novel
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Sekilas%20Tentang%20Novel.jpeg">
   </p>
   Menampilkan detail novel yang dipilih, termasuk judul, penulis, tahun terbit, bahasa, harga, serta sinopsis singkat, dengan opsi untuk membeli novel yang mengarah ke toko buku online.
   </br>

2. **Penulis** <br>
Tampilan Halam **"Penulis"**
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Penulis.jpeg">
   </p>
   Menampilkan informasi jumlah penulis dan total buku yang diterbitkan, daftar penulis terfavorit berdasarkan rating, serta tabel daftar penulis novel beserta detailnya.
   <br>

3. **Penerbit** <br>
Tampilan Halam **"Penerbit"**
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Penerbit.jpeg">
   </p>
   Menampilkan jumlah total penerbit dan jumlah kota yang memiliki penerbit, serta peta interaktif yang menunjukkan lokasi penerbit buku di berbagai kota.
   <br>

4. **Ulasan** <br>
- Tampilan Halam **"Ulasan"**
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Ulasan.jpeg">
   </p>
   Menampilkan jumlah total ulasan, rating rata-rata, dan daftar ulasan pengguna terhadap beberapa novel. Setiap ulasan mencakup nama pengguna, rating bintang, serta ulasan oleh pengguna.

- Tampilan ulasan pengguna
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Ulasan%20oleh%20Pengguna.jpeg">
   </p>
     Dengan menekan tombol "Selengkapnya", akan muncul pop-up berisi detail lengkap ulasan, termasuk nama pengulas, judul buku, rating, dan isi ulasan secara penuh.
   <br>

5. **Tim Chapter & Coffee** <br>
Tampilan Halam **"Tim Chapter & Coffee"**
   <p align="center">
      <img width="900" height="450" src="https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/main/Image/Penulis.jpeg">
   </p>
   Menampilkan informasi Web Pemerintah Provinsi Jawa Barat.
   <br>
# Demo
📚 Eksplorasi Dunia Novel Lewat Dashboard Chapter & Coffee: 

# Skema Database atau Pondasi Perpustakaan
Database terdiri dari beberapa tabel utama. Tabel **Penulis** menyimpan data penulis dengan id_penulis sebagai primary key, sedangkan tabel **Penerbit** menggunakan id_penerbit sebagai primary key. Tabel **Novel** menjadi pusat data novel dengan id_novel sebagai primary key, serta menghubungkan penulis dan penerbit melalui id_penulis dan id_penerbit sebagai foreign key. Untuk **Ulasan**, tabel Ulasan menyimpan review pembaca dengan id_user sebagai primary key dan id_novel sebagai foreign key agar setiap ulasan terhubung ke novel yang direview.

![Skema Database](https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Designer/Skema%20database.jpg)

# ERD atau Alur Cerita
ERD ini menggambarkan struktur database untuk sistem manajemen novel yang mencakup empat entitas utama, yaitu **Novel**, **Penulis**, **Penerbit**, dan **Ulasan**. Hubungan antar entitas menunjukkan bahwa satu penulis dapat menulis banyak novel (**1:M**), satu penerbit dapat menerbitkan banyak novel (**1:M**), dan satu novel dapat memiliki banyak ulasan dari berbagai pengguna (**1:M**). Struktur ini memungkinkan pengelolaan data yang sistematis, memudahkan pencarian informasi berdasarkan penulis atau penerbit tertentu, serta memungkinkan analisis ulasan dan rating yang diberikan oleh pengguna terhadap suatu novel.
![ERD Novel](https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Designer/ERD%20Novel%20New.jpg)

## 🚀 Software yang Digunakan
- **Frontend:** RShiny
- **Backend:** RStudio
- **Database:** SQLite

# Deskripsi Data atau Data Synopsis
## :abacus: Membuat Database
create database datanovel1;

Chapter & Coffee merupakan database yang berkaitan dengan informasi novel, yang mencakup detail mengenai penulis, penerbit, novel itu sendiri, serta ulasan dari pengguna. Untuk membuat database tersebut maka dapat digunakan sintaks berikut.

## :open_book: Membuat Tabel Novel

Menyediakan detail lengkap tentang novel, termasuk ISBN, judul, bahasa, tahun terbit, deskripsi, kategori, jumlah halaman, harga, dan rating keseluruhan.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_novel                   | TEXT			| Id Novel                       		             |
| id_penulis                 | TEXT			  | Id Penulis                   		             |
| id_penerbit                | TEXT		  | Id Penerbit                     	             |	
| judul                      | TEXT | Judul Novel                		                 |
| ISBN                       | TEXT | ISBN Novel	                                     |
| bahasa	    	         | TEXT  | Bahasa yang digunakan pada novel                 |
| tahun terbit	    	     | INTEGER                | Tahun terbit novel                               |
| edisi	    	             | TEXT| Edisi Novel                                      |
| jumlah_halaman	    	 | INTEGER                | Jumlah Halaman Novel                             |
| deskripsi    	             | TEXT                   | Deskripsi/Sinopsis Novel                         |
| rating_novel	    	     | REAL                  | Rating Novel                                     |
| kategori		     | TEXT			| Kategori novel menjadi Fiksi, Bukan fiksi, Literatur Indonesia, Romansa, Horor|
| harga			     | TEXT			| Harga buku |
| link			     | TEXT			| direct link ke ecomerce |
|sampul			     | TEXT			 | cover buku |


dengan query sebagai berikut:

```sql
CREATE TABLE "novel" (
    "id_novel" TEXT NOT NULL,
    "id_penulis" TEXT NOT NULL,
    "id_penerbit" TEXT NOT NULL,
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
=======
```{r}
CREATE TABLE "novel" (
	"id_novel"	TEXT NOT NULL,
	"id_penulis"	TEXT NOT NULL,
	"id_penerbit"	TEXT NOT NULL,
	"judul"	TEXT,
	"ISBN"	TEXT,
	"bahasa"	TEXT,
	"tahun_terbit"	INTEGER,
	"edisi"	TEXT,
	"jumlah_halaman"	INTEGER,
	"deskripsi"	TEXT,
	"rating_novel"	INTEGER,
	"kategori"	TEXT,
	"harga"	TEXT,
	"link"	TEXT,
	"Sampul"	TEXT,
	PRIMARY KEY("id_novel"),
	FOREIGN KEY("id_penerbit") REFERENCES "penerbit"("id_penerbit"),
	FOREIGN KEY("id_penulis") REFERENCES "penulis"("id_penulis")
)
```


## :books: Membuat Tabel Penulis

Berisi informasi mengenai identitas penulis, termasuk nama, tempat dan tanggal lahir, serta jumlah buku yang telah diterbitkan.


| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_penulis                 | TEXT  | Id Penulis                       		         |
| penulis                    | TEXT)  | Nama Penulis Novel                   		     |
| tempat_lahir               | TEXT  | Tempat Lahir Penulis Novel                     	 |	
| tanggal_lahir              | TEXT                  | Tanggal Lahir Penulis Novel              		 |
| jumlah_buku                | integer                | Jumlah Novel yang Diterbitkan                    |


dengan query sebagai berikut:


```sql
CREATE TABLE "penulis" (
    "id_penulis" TEXT NOT NULL,
    "penulis" TEXT,
    "tempat_lahir" TEXT,
    "tanggal_lahir" TEXT,
    "jumlah_buku" INTEGER,
    PRIMARY KEY("id_penulis")
);

```{r}
CREATE TABLE "penulis" (
	"id_penulis"	TEXT NOT NULL,
	"penulis_"	TEXT,
	"tempat_lahir"	TEXT,
	"tanggal_lahir"	TEXT,
	"jumlah_buku"	INTEGER,
	PRIMARY KEY("id_penulis")
)

```


## :office: Membuat Tabel Penerbit

Menyimpan data tentang penerbit yang bertanggung jawab atas produksi dan distribusi novel.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|

| id_penerbit                | character varying(50)  | Id Penerbit                    		             |
| nama_penerbit              | character varying(250) | Nama Penerbit                  		     |
| alamat                     | character varying(255) | Alamat Penerbit                     	         |	
| latitude                   | character varying(255) | Titik Koordinat                     	         |	
| longitude                  | character varying(255) | Titik Koordinat                      	         |	

dengan query sebagai berikut:

```sql
CREATE TABLE "penerbit" (
    "id_penerbit" TEXT NOT NULL,
    "nama_penerbit" TEXT,
    "alamat" TEXT,
    "latitude" REAL,
    "longitude" REAL,
    PRIMARY KEY("id_penerbit")
);

| id_penerbit                | TEXT  | Id Penerbit                    		             |
| nama_penerbit              | TEXT | Nama Penerbit                  		     |
| alamat                     | TEXT | Alamat Penerbit     |	
| Latitude		     | REAL | latitude	|
|longitude		     |REAL | longitude |

dengan query sebagai berikut:

```{r}
CREATE TABLE "penerbit" (
	"id_penerbit"	TEXT NOT NULL,
	"nama_penerbit"	TEXT,
	"alamat"	TEXT,
	"latitude"	TEXT,
	"longitude"	TEXT,
	PRIMARY KEY("id_penerbit")
)
```


## :memo: Membuat Tabel Ulasan

Menampilkan ulasan dan penilaian dari pengguna terhadap novel, termasuk rating dan komentar yang diberikan.

| Attribute                  | Type                   | Description                     		         |
|:---------------------------|:-----------------------|:-------------------------------------------------|
| id_user                    | TEXT  | Id Pengguna                       		         |
| id_novel                   | TEXT  | Id Novel                   		                 |
| nama_user                  | TEXT | Nama Pengguna                    	             |	
| tanggal_ulasan             | TEXT) | Tanggal Ulasan yang Diberikan Pengguna           |
| ulasan                     | text                   | Ulasan Pengguna	                                 |
| rating_user	    	     | REAL                  | Rating dari Pengguna                             |

dengan query berikut:


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

```{r}
CREATE TABLE "ulasan" (
	"id_user"	TEXT,
	"id_novel"	TEXT,
	"nama_user"	TEXT,
	"tanggal_ulasan"	TEXT,
	"ulasan"	TEXT,
	"rating_user"	REAL,
	PRIMARY KEY("id_user"),
	FOREIGN KEY("id_novel") REFERENCES "novel"("id_novel")
)

```

# :open_file_folder: Folder Structure atau Rak Buku
```
📂 MDS---Kelompok-5---Data-Novel
├── 📁 Data
│    ├── 📄 novel.csv
│    ├── 📄 penerbit.csv
│    ├── 📄 penulis.csv
│    ├── 📄 ulasan.csv
├── 📁 Image
│    ├── 📄 Header Chapter & Coffee .png
│    ├── 📄 style.css
├── 📄 .gitattributes
└── 📄 README.md
```

## 📩 Hubungi Kami
Kami selalu terbuka jika ada pertanyaan atau masukan, hubungi kami melalui email: support@chaptercoffee.com.

---
Selamat menjelajah dunia novel dengan **Chapter & Coffee!** ☕📖

# Tim Penulis
### 📚 **Tim di Balik Chapter & Coffee**  
Seperti secangkir kopi yang diracik dengan sempurna, **Chapter & Coffee** hadir berkat tim yang menyusun kode, data, dan desain menjadi pengalaman terbaik bagi pencinta novel. Inilah para "barista" di balik platform ini!  

🎨 **Front-End Developer _(Cover Designer)_**  
👩‍💻 [Baiq Nina Febriati](https://github.com/ninafebriati)  
📌 _Merancang tampilan Chapter & Coffee agar semenarik sampul buku yang menggoda untuk dibuka._   

⚙️ **Back-End Developer _(Plot Builder)_**  
👨‍💻 [Adib Roisilmi Abdullah](https://github.com/Adibun-jpg)  
📌 _Menulis "alur cerita" di balik layar agar platform berjalan lancar dan responsif._  

🗄 **Database Manager _(Librarian of Data)_**  
👩‍💻 [Sely Fitriatun Wakhidah](https://github.com/sel599)  
📌 _Mengelola dan mengamankan "rak buku" digital agar setiap data tersusun rapi dan siap diakses._  

🏗 **Database Designer _(Story Architect)_**  
👨‍💻 [Naufalia Alfiryal](https://github.com/Naufaliaa)  
📌 _Menyusun "kerangka cerita" agar setiap bagian data saling terhubung dengan baik._  

📝 **Technical Writer _(Storyteller of Code)_**  
👨‍💻 [Muhammad Rizal](https://github.com/rizalmmd)  
📌 _Menulis panduan agar setiap pengguna bisa memahami dan menikmati "cerita" di Chapter & Coffee._  

---

💡 _Dengan keahlian masing-masing, kami menciptakan Chapter & Coffee agar setiap orang dapat menemukan novel terbaik dengan cara yang lebih mudah dan menyenangkan!_  

---
