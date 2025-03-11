
# === 1. Load Library ===
library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)
library(readr)
library(dplyr)
library(leaflet)
library(DBI)
library(RSQLite)

#pastikan ganti path
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/ASUS/Downloads/New folder/datanovel2.sqlite")  # Buka kembali
dbListTables(conn)  # Coba cek lagi

# Baca seluruh data dari tabel
data_novel <- dbGetQuery(conn, "SELECT * From novel")
data_ulasan <- dbGetQuery(conn, "SELECT * From ulasan")
data_penulis <- dbGetQuery(conn, "SELECT * From penulis")

#cek sample query
q1 <- "
SELECT 
    u.id_user, 
    u.id_novel, 
    n.judul, 
    u.nama_user, 
    u.tanggal_ulasan, 
    u.ulasan, 
    u.rating_user
FROM ulasan u
LEFT JOIN novel n 
ON u.id_novel = n.id_novel;"

# Lihat hasilnya
data_ulasan <- dbGetQuery(conn, q1)

#join 
q2 <- "SELECT 
    n.id_novel, 
    n.id_penulis, 
    p.penulis_,
    n.id_penerbit, 
    n.judul, 
    n.ISBN, 
    n.bahasa, 
    n.tahun_terbit, 
    n.edisi, 
    n.jumlah_halaman, 
    n.deskripsi, 
    n.rating_novel, 
    n.kategori, 
    n.harga, 
    n.link, 
    n.sampul
FROM novel n
LEFT JOIN penulis p
ON n.id_penulis = p.id_penulis;"

# Lihat hasilnya
data_novel <- dbGetQuery(conn, q2)

# Close connection
dbDisconnect(conn)

#Memanggil data penerbit
data_penerbit <- read.csv("C:/Users/ASUS/Downloads/New folder/data_penerbit - Sheet1.csv", stringsAsFactors = FALSE)

#Merubah NA
data_novel[data_novel == ""] <- "Belum Terdaftar"
colSums(is.na(data_novel == "Belum Terdaftar"))

# === 2. UI: Struktur Dashboard ===
ui <- dashboardPage(
  dashboardHeader(
    title = tagList(
      tags$img(src = "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/logo%20mds.png?raw=true", height = "40px", style = "margin-right: 2px;"),
      "Chapter & Coffee"
    ),
    
    # Tambahkan textInput ke dalam navbar kanan
    tags$li(class = "dropdown",
            tags$div(
              style = "padding: 10px; display: flex; align-items: center;",
              textInput("search", NULL, placeholder = "Cari novel...", width = "200px")
            )
    )
  ),
  
  dashboardSidebar(
    collapsed = FALSE,
    
    tags$head(
      tags$style(HTML("
      .sidebar-menu {
        padding-top: 20px;
      }
      .sidebar-menu > li > a {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 16px;
        font-weight: 600;
        color: #6c757d;
        padding: 10px 20px;
        transition: all 0.3s ease-in-out;
      }
      .sidebar-menu > li > a:hover, 
      .sidebar-menu > li.active > a {
        color: #1E40AF;
        background-color: #E0E7FF;
        border-radius: 8px;
      }
      .sidebar-menu > li > a > i {
        font-size: 18px;
      }
    "))
    ),
    sidebarMenu(
      menuItem("Cari Novel Di Sini", tabName = "my_books", icon = icon("book")),
      menuItem("Penulis", tabName = "authors", icon = icon("user")),
      menuItem("Penerbit", tabName = "publishers", icon = icon("building")),
      menuItem("Ulasan", tabName = "reviews", icon = icon("star")),
      menuItem("Tim Chapter & Coffe", tabName = "team", icon = icon("user"))
    )
  ),
  
  dashboardBody(
    
    tags$head(
      tags$style(HTML("
   /* Ubah warna background header */
      .main-header {
        background-color: #735130 !important; 
      }
      
      /* Ubah warna background logo di sidebar */
      .main-header .logo {
        background-color: #735130 !important;
        color: white !important;
      }

      /* Ubah warna navbar (menu toggle) */
      .main-header .navbar {
        background-color: #735130 !important; 
      }

      /* Ubah warna sidebar */
      .main-sidebar {
        background-color: #735130 !important;
      }

      /* Ubah warna teks menu sidebar */
      .sidebar-menu > li > a {
        color: white !important;
      }

      /* Ubah warna menu sidebar ketika dihover atau aktif */
      .sidebar-menu > li > a:hover, 
      .sidebar-menu > li.active > a {
        background-color: #c7a07a !important; 
        color: white !important;
        border-radius: 5px;
      }
  "))
    ),
    
    tabItems(
      #Tab Item Novel      
      tabItem(tabName = "my_books",
              fluidRow(
                column(12, align = "center",
                       tags$img(src = "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/Copy%20of%20Header%20Chapter%20&%20Coffee%20.png?raw=true", 
                                width = "100%", 
                                style = "border-radius: 10px; 
                        box-shadow: 3px 3px 10px rgba(0,0,0,0.2); 
                        flex-shrink: 0;
                        display:block; 
                        margin-bottom: 20px;"
                       )),
                column(12, h2("Novel Terbaik Berdasarkan Ratings")),
                column(12,uiOutput("best_novel")),
                column(12, h2("Koleksi Novel")),
                fluidRow(
                  column(12, align = "center",
                         tags$div(
                           style = "display: flex; justify-content: center; gap: 10px; flex-wrap: wrap;",
                           actionButton("btn_all", "Semua", class = "btn-category active"),
                           actionButton("btn_nonfiction", "Bukan Fiksi", class = "btn-category"),
                           actionButton("btn_fantasi", "Fantasi", class = "btn-category"),
                           actionButton("btn_fiction", "Fiksi", class = "btn-category"),
                           actionButton("btn_literature", "Literatur Indonesia", class = "btn-category"),
                           actionButton("btn_romansa", "Romansa", class = "btn-category")
                         ),
                         tags$style(HTML("
      .btn-category {
        background-color: #f0f3ff; 
        border: none; 
        color: #34495e; 
        font-size: 14px; 
        font-weight: bold;
        padding: 10px 20px;
        border-radius: 20px; 
        cursor: pointer;
        gap: 20px;
        transition: all 0.3s ease-in-out;
      }
      .btn-category:hover {
        background-color: #d6dbff; 
      }
      .btn-category.active {
        background-color: #735130; 
        color: white;
      }
    "))
                  ),
                  tags$hr()
                ),
                column(12, fluidRow(uiOutput("novel_cards")))
              )
      ),
      
      #Tab Item Penulis      
      tabItem(tabName = "authors",
              fluidRow(
                valueBox(
                  value = nrow(data_penulis),  # Menampilkan total jumlah penerbit
                  subtitle = "Total Penulis",
                  icon = tags$i(class = "fa fa-users", style = "color: white;"),
                  color = "navy",
                  width = 6
                ),
                valueBox(
                  value = sum(data_penulis$jumlah_buku),
                  subtitle = "Jumlah Buku Terbitan Penulis",
                  icon = icon("book"),
                  color = "yellow",
                  width = 6
                )
              ),
              
              fluidRow(
                column(12, 
                       column(12, h2("Penulis Terfavorit")),
                       column(12, uiOutput("most_fav_author")
                       ),
                       column(12, h2("Daftar Penulis Novel")),
                       box(status = "info", solidHeader = FALSE, width = 12, DTOutput("authors_table")),
                ),
              ),
      ),
      
      #Tab Item Penerbit
      tabItem(tabName = "publishers",
              fluidRow(
                column(12,
                       valueBox(
                         value = nrow(data_penerbit),  # Menampilkan total jumlah penerbit
                         subtitle = "Total Penerbit",
                         icon = icon("building"),
                         color = "orange",
                         width = 6
                       ),
                       valueBox(
                         value = length(unique(data_penerbit$alamat)),
                         subtitle = "Jumlah Kota dengan Penerbit",
                         icon = icon("city"),
                         color = "yellow",
                         width = 6
                       ),
                ),
              ),
              
              fluidRow(
                column(12, 
                       h2("Peta Penerbit Buku"),
                       box(status = "info", solidHeader = FALSE, width = 12, 
                           leafletOutput("map_penerbit", height = "600px"),
                           style = "background-color: white; padding: 20px; border-radius: 10px;")
                ),
                
                column(12, 
                       h2("List Penerbit"),
                       box(status = NULL, solidHeader = FALSE, width = 12, 
                           DTOutput("publishers_table"),
                           style = "background-color: white; padding: 20px; border-radius: 10px; height: auto;")
                )
              )
      ),
      
      #Tab Item Ulasan
      tabItem(tabName = "reviews",
              fluidRow(
                valueBox(
                  value = nrow(data_ulasan),  # Menampilkan total jumlah penerbit
                  subtitle = "Jumlah Ulasan",
                  icon = icon("user"),
                  color = "orange",
                  width = 6
                ),
                valueBox(
                  value = round(mean(data_ulasan$rating_user),2),
                  subtitle = "Rating Rata-rata",
                  icon = icon("star"),
                  color = "green",
                  width = 6
                )
              ),
              fluidRow(
                column(12, h2("Ulasan Pengguna")),
                column(12, uiOutput("reviews_dashboard"))  # Output UI untuk ulasan dalam bentuk card layout
              )
      ),
      
      #Tab Item Tim Chapter & Coffe 
      tabItem(tabName = "team",
              column(12, h2("Tim Chapter & Coffe")),      
              column(12, fluidRow(uiOutput("team_mds")))
      )
    )
  )
)
