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

#### 1️⃣ Pencarian Novel
- Cari novel favorit Anda dengan mengetikkan judul di kolom pencarian.
- Sistem pencarian cepat dan akurat untuk menemukan novel yang Anda inginkan.

#### 2️⃣ Novel Terbaik Berdasarkan Rating
- Menampilkan novel dengan rating tertinggi untuk rekomendasi terbaik.
- Informasi detail seperti penulis, tahun terbit, ISBN, dan bahasa tersedia di setiap novel.

#### 3️⃣ Koleksi Novel
- Menyediakan berbagai novel dengan informasi mendetail.
- Novel disusun dalam tampilan kartu untuk kemudahan eksplorasi.
- Tombol **Read More** untuk melihat detail lengkap dari setiap novel.

#### 4️⃣ Navigasi Mudah
- Sidebar dengan kategori seperti **Penulis**, **Penerbit**, **Ulasan**, dan **Novel dalam Statistik** untuk pengalaman pengguna yang lebih baik.

# Tampilan Halaman
screenshoot dashboard

# Demo
📚 Eksplorasi Dunia Novel Lewat Dashboard Chapter & Coffee: 

# Skema Database atau Pondasi Perpustakaan
Database terdiri dari beberapa tabel utama. Tabel **Penulis** menyimpan data penulis dengan id_penulis sebagai primary key, sedangkan tabel **Penerbit** menggunakan id_penerbit sebagai primary key. Tabel **Novel** menjadi pusat data novel dengan id_novel sebagai primary key, serta menghubungkan penulis dan penerbit melalui id_penulis dan id_penerbit sebagai foreign key. Untuk **Ulasan**, tabel Ulasan menyimpan review pembaca dengan id_user sebagai primary key dan id_novel sebagai foreign key agar setiap ulasan terhubung ke novel yang direview.
![Skema Database](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/blob/Designer/Skema%20Database%20Novel.jpg)

# ERD atau Alur Cerita
ERD ini menggambarkan struktur database untuk sistem manajemen novel yang mencakup empat entitas utama, yaitu **Novel**, **Penulis**, **Penerbit**, dan **Ulasan**. Hubungan antar entitas menunjukkan bahwa satu penulis dapat menulis banyak novel (**1:M**), satu penerbit dapat menerbitkan banyak novel (**1:M**), dan satu novel dapat memiliki banyak ulasan dari berbagai pengguna (**1:M**). Struktur ini memungkinkan pengelolaan data yang sistematis, memudahkan pencarian informasi berdasarkan penulis atau penerbit tertentu, serta memungkinkan analisis ulasan dan rating yang diberikan oleh pengguna terhadap suatu novel.
![ERD Novel](https://github.com/Adibun-jpg/MDS---Kelompok-5---Data-Novel/raw/Designer/ERD%20Novel.jpg)

# Deskripsi Data atau Data Synopsis
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

## 🔥 Kontribusi
Kami selalu terbuka untuk kontribusi dari komunitas! Jika Anda ingin menambahkan fitur baru atau meningkatkan performa dashboard, silakan fork repository ini dan buat pull request.

## 📩 Hubungi Kami
Jika ada pertanyaan atau masukan, hubungi kami melalui email: support@chaptercoffee.com atau kunjungi forum diskusi kami.

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
=======
