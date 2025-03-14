library(shiny)
library(ggplot2)

#pastikan ganti path
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/ASUS/Downloads/New folder/datanovel.sqlite")  # Buka kembali
dbListTables(conn)  # Coba cek lagi

server <- function(input, output, session) {
  
  output$novel_cards <- renderUI({
    books <- filtered_novels()  # Panggil reaktifitas
    
    if (nrow(books) == 0) {
      return(h4("Novel Tidak Ditemukan", style = "text-align: center; color: red;"))
    }
    
    # Menampilkan hasil pencarian dalam bentuk card
    div(style = "display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; padding: 10px;",
        lapply(1:nrow(books), function(i) {
          div(style = "background: white; padding: 15px; border-radius: 10px;",
              h4(books$judul[i]),
              p(paste("Penulis:", books$penulis_[i])),
              p(paste("Tahun Terbit:", books$tahun_terbit[i]))
          )
        })
    )
  })
  
  # Menentukan Best Novel berdasarkan Rating
  best_novel <- reactive({
    data_novel %>%
      arrange(desc(rating_novel)) %>%
      head(3)  # Ambil novel dengan rating tertinggi
  })
  
  # Menampilkan Best Novel by Ratings
  output$best_novel <- renderUI({
    novel <- best_novel()
    
    if (nrow(novel) == 0) {
      return(h4("Novel Tidak Ditemukan", style = "text-align: center; color: red;"))
    }
    
    fluidRow(
      
      div(style = "display: grid; 
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
                gap: 20px; 
                padding: 10px;",
          
          lapply(1:nrow(novel), function(i) {
            box(
              width = 12, status = NULL, solidHeader = FALSE,
              style = "border-radius: 10px; 
                    padding: 15px; 
                    box-shadow: 5px 5px 15px rgba(0,0,0,0.2);
                    border: 1px solid #ddd;",
              
              div(style = "display: flex; align-items: center; gap: 15px;",
                  
                  # Gambar Sampul Novel
                  img(src = novel$Sampul[i], width = "120px", height = "180px", 
                      style = "border-radius: 10px; 
                            box-shadow: 3px 3px 10px rgba(0,0,0,0.2); 
                            flex-shrink: 0;
                            display:block; 
                            margin:auto;"),
                  
                  # Informasi Novel
                  div(style = "text-align: left; width: 100%;",
                      h3(novel$judul[i], style = "font-size: 14px; font-weight: bold;"),
                      p(paste("Penulis:", novel$penulis_[i]), style = "font-size: 14px;"),
                      p(paste("Tahun Terbit:", novel$tahun_terbit[i]), style = "font-size: 14px; color: gray;"),
                      p(paste("ISBN:", ifelse(is.na(novel$ISBN[i]) | novel$ISBN[i] == "", "Not Available", novel$ISBN[i]))),
                      p(paste("Bahasa:", novel$bahasa[i])),
                      
                      # Rating dengan Bintang
                      div(style = "color: gold; font-size: 18px;",
                          paste0(strrep("★", round(novel$rating_novel[i])), 
                                 strrep("☆", 5 - round(novel$rating_novel[i]))),
                          span(style = "font-size: 16px; color: black;", paste0(" ", novel$rating_novel[i]))),
                  )
              )
            )
          })
      )
    )
  })
  
  # Reactive value untuk menyimpan kategori yang dipilih
  selected_category <- reactiveVal("Semua")
  
  # Observasi ketika button diklik
  observeEvent(input$btn_all, { selected_category("Semua") })
  observeEvent(input$btn_fiction, { selected_category("Fiksi") })
  observeEvent(input$btn_nonfiction, { selected_category("Bukan Fiksi") })
  observeEvent(input$btn_romansa, { selected_category("Romansa") })
  observeEvent(input$btn_fantasi, { selected_category("Fantasi") })
  observeEvent(input$btn_literature, { selected_category("Literatur Indonesia")
    hr()
  })
  
  # Filter novel berdasarkan kategori yang dipilih
  filtered_novels <- reactive({
    if (selected_category() == "Semua") {
      return(data_novel)
    } else {
      return(data_novel %>% filter(kategori == selected_category()))
    }
  })
  
  # Menampilkan novel dalam bentuk card layout
  output$novel_cards <- renderUI({
    books <- filtered_novels()
    
    if (is.null(books) || nrow(books) == 0) {
      return(h4("No books found", style = "text-align: center; color: red;"))
    }
    
    # Menggunakan grid layout agar tampilan tidak menumpuk
    div(style = "display: grid; 
              grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
              gap: 20px; 
              padding: 10px;",
        
        lapply(1:nrow(books), function(i) {
          book_id <- books$id_novel[i]
          
          div(style = "background: white; 
                     border-radius: 10px; 
                     padding: 15px; 
                     box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
                     min-height: 320px;",
              
              # Gambar sampul novel
              img(src = books$Sampul[i], width = "auto", height = "200px",
                  style = "border-radius: 10px; box-shadow: 2px 2px 5px rgba(0,0,0,0.2);"),
              
              # Informasi Novel
              div(style = "text-align: left; margin-top: 10px; width: 100%;",
                  h4(books$judul[i], style = "font-size: 18px; font-weight: bold;"),
                  p(paste("Penulis:", books$penulis_[i]), style = "font-size: 14px;"),
                  p(paste("Kategori:", books$kategori[i]), style = "font-size: 14px; color: gray;"),
                  p(paste("Tahun Terbit:", books$tahun_terbit[i]), style = "font-size: 14px; color: gray;"),
                  p(paste("ISBN:", books$ISBN[i]), style = "font-size: 14px; color: gray;"),
                  p(paste("Bahasa:", books$bahasa[i]), style = "font-size: 14px; color: gray;"),
                  
                  # Rating dengan ikon bintang
                  div(style = "color: gold; font-size: 18px;",
                      paste0(strrep("★", round(books$rating_novel[i])), 
                             strrep("☆", 5 - round(books$rating_novel[i]))),
                      span(style = "font-size: 16px; color: black;", paste0(" ", books$rating_novel[i]))),
                  
                  # Tombol Selengkapnya
                  actionButton(inputId = paste0("btn_", book_id), 
                               label = "Selengkapnya...", class = "btn-primary", 
                               style = "margin-top: 10px;")
              )
          )
        })
    )
  })
  
  # Handling event tombol "Read More"
  observe({
    books <- filtered_novels()
    
    lapply(1:nrow(books), function(i) {
      book_id <- books$id_novel[i]
      
      observeEvent(input[[paste0("btn_", book_id)]], {
        showModal(modalDialog(
          title = "Sekilas Tentang Novel", 
          size = "m",
          div(style = "border-radius: 10px; display: flex; align-items: center; gap: 20px; padding: 20px;",
              img(src = books$Sampul[i], width = "150px", height = "220px",
                  style = "border-radius: 10px; box-shadow: 5px 5px 10px rgba(0,0,0,0.2);"),
              div(style = "text-align: justify; width: 100%;",
                  h4(books$judul[i]),
                  p(paste("Penulis:", books$penulis_[i])),
                  p(paste("Tahun Terbit:", books$tahun_terbit[i])),
                  p(paste("ISBN:", books$ISBN[i])),
                  p(paste("Bahasa:", books$bahasa[i])),
                  h4("Harga:", books$harga[i]),
                  # Ikon Pembelian Buku
                  div(style = "margin-top: 10px; display: flex; align-items: center; gap: 15px;",
                      
                      # Tombol "Beli Sekarang" sebagai Link
                      a(href = books$link[i], 
                        class = "btn btn-success",
                        icon("shopping-cart"), " Beli Di Sini"),
                  ),
                  hr(),
                  p(books$deskripsi[i])
              )
          ),
          easyClose = TRUE,
          
          #Footer: Mengubah Tombol "Dismiss" Menjadi "Kembali"
          footer = tags$button(
            type = "button",
            class = "btn btn-secondary",
            `data-dismiss` = "modal", 
            "Kembali")
        ))
      })
    })
  })
  
  # Menentukan 3 Penulis Terbaik berdasarkan jumlah buku yang ditulis
  top_authors <- reactive({
    data_novel %>%
      count(penulis_, name = "total_karya") %>%
      arrange(desc(total_karya)) %>%
      head(3)  # Ambil 3 penulis terbaik
  })
  
  # Menampilkan UI untuk 3 Penulis Terbaik
  output$most_fav_author <- renderUI({
    authors <- top_authors()
    authors1 <- data_penulis
    
    if (nrow(authors) == 0) {
      return(h4("Tidak Ada Data Penulis", style = "text-align: center; color: red;"))
    }
    
    fluidRow(
      div(style = "display: grid; 
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 20px; 
                padding: 10px;",
          
          lapply(1:nrow(authors), function(i) {
            box(
              width = "120px", status = NULL, solidHeader = FALSE,
              style = "border-radius: 10px; 
                    padding: 15px; 
                    box-shadow: 5px 5px 15px rgba(0,0,0,0.2);
                    border: 1px solid #ddd;",
              
              div(style = "display: flex; align-items: center; gap: 15px;",
                  
                  # Foto Profil Penulis (Placeholder)
                  img(src = "https://www.w3schools.com/howto/img_avatar.png", width = "80px", height = "80px", 
                      style = "border-radius: 50%; 
                            box-shadow: 3px 3px 10px rgba(0,0,0,0.2); 
                            flex-shrink: 0;"),
                  
                  # Informasi Penulis
                  div(style = "text-align: left; width: 100%;",
                      h3(authors$penulis_[i], style = "font-size: 18px; font-weight: bold;"),
                      p(paste("Tempat Lahir:", authors1$tempat_lahir[i]), style = "font-size: 14px; color: gray;"),
                      p(paste("Tanggal Lahir:", authors1$tanggal_lahir[i]), style = "font-size: 14px; color: gray;"),
                      p(paste("Total Karya:", authors$total_karya[i]), style = "font-size: 14px; color: black;"),
                      
                  )
              )
            )
          })
      )
    )
  })
  
  output$authors_table <- renderDT({ datatable(data_penulis, options = list(pageLength = 5)) })
  
  #Value Box
  output$rating_plot <- renderPlot({
    ggplot(data_penerbit, aes(x = alamat)) +
      geom_bar(fill = "blue", color = "black") +
      theme_minimal() +
      xlab("Kota") + ylab("Jumlah Penerbit") +
      ggtitle("Distribusi Penerbit di Indonesia")
  })
  
  # Render Peta Leaflet
  output$map_penerbit <- renderLeaflet({
    leaflet(data_penerbit) %>%
      addTiles() %>%
      addMarkers(
        ~longitude, ~latitude,
        layerId = ~alamat,  # 📌 Simpan layerId sebagai alamat kota
      )
  })
  
  # 🔹 Ketika kota diklik, tampilkan daftar penerbit dari kota tersebut
  observeEvent(input$map_penerbit_marker_click, {
    click <- input$map_penerbit_marker_click  # Ambil data klik
    if (is.null(click)) return()  # Jika tidak ada klik, jangan lanjut
    
    # Ambil daftar penerbit dari kota yang diklik
    penerbit_dari_kota <- data_penerbit %>%
      filter(alamat == click$id) %>%
      pull(nama_penerbit)
    
    # Format data penerbit sebagai HTML
    daftar_penerbit <- paste("<li>", penerbit_dari_kota, "</li>", collapse = "")
    popup_content <- paste0("<b>Penerbit di ", click$id, ":</b><br><ul>", daftar_penerbit, "</ul>")
    
    # 📌 Hapus semua pop-up sebelum menampilkan yang baru
    leafletProxy("map_penerbit") %>%
      clearPopups() %>%
      addPopups(click$lng, click$lat, popup_content)
  })
  
  # Menampilkan Data Penerbit
  output$publishers_table <- renderDT({ datatable(data_penerbit, options = list(pageLength = 5)) })
  
  # Menampilkan Data Ulasan
  output$reviews_dashboard <- renderUI({
    req(data_ulasan)  
    
    buku_unik <- unique(data_ulasan$judul)
    
    div(style = "display: flex; flex-direction: column; gap: 25px;",
        
        lapply(buku_unik, function(buku) {
          reviews_filtered <- data_ulasan[data_ulasan$judul == buku, , drop = FALSE]  # Filter ulasan untuk buku tertentu
          
          # Membuat header judul buku
          div(
            h2(paste("Ulasan", buku), style = "margin-bottom: 15px; color: #735130;"),  # Header Judul Buku
            
            div(style = "display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 15px; padding: 10px;",
                lapply(1:nrow(reviews_filtered), function(i) {
                  review_id <- reviews_filtered$id_user[i]
                  
                  # Card untuk setiap ulasan
                  div(style = "background: white; border-radius: 10px; padding: 15px; 
                            box-shadow: 2px 2px 8px rgba(0,0,0,0.1); min-height: 180px;",
                      
                      # Header Ulasan dengan Avatar dan Nama User
                      div(style = "display: flex; align-items: center; gap: 10px;",
                          img(src = "https://www.w3schools.com/howto/img_avatar.png", width = "50px", height = "50px",
                              style = "border-radius: 50%; box-shadow: 2px 2px 5px rgba(0,0,0,0.2); flex-shrink: 0;"),
                          div(style = "text-align: left;",
                              h4(reviews_filtered$nama_user[i], style = "margin: 0;"),
                              p(paste("Rating:", reviews_filtered$rating_user[i], "⭐"), 
                                style = "margin: 0; font-weight: bold; color: #ffcc00;")
                          )
                      ),
                      
                      hr(),
                      
                      # Ulasan Singkat (10 kata pertama)
                      p(paste(strsplit(reviews_filtered$ulasan[i], " ")[[1]][1:10], collapse = " "), "..."),
                      
                      # Tombol "Selengkapnya"
                      actionButton(inputId = paste0("btn_review_", review_id), label = "Selengkapnya", class = "btn-info btn-sm")
                  )
                })
            )
          )
        })
    )
  })
  
  # Handling event tombol "Selengkapnya"
  observe({
    req(data_ulasan)  # Pastikan data tersedia sebelum dieksekusi
    
    buku_unik <- unique(data_ulasan$judul)
    
    lapply(buku_unik, function(buku) {
      reviews_filtered <- data_ulasan[data_ulasan$judul == buku, , drop=FALSE]
      
      lapply(1:nrow(reviews_filtered), function(i) {
        review_id <- reviews_filtered$id_user[i]
        
        observeEvent(input[[paste0("btn_review_", review_id)]], {
          showModal(modalDialog(
            title = paste("Ulasan oleh", reviews_filtered$nama_user[i]), 
            size = "m",
            div(style = "padding: 20px; text-align: justify;",
                h4(reviews_filtered$nama_user[i]),
                p(paste("Judul Buku:", reviews_filtered$judul[i])),
                p(paste("Rating:", reviews_filtered$rating_user[i], "⭐")),
                hr(),
                p(reviews_filtered$ulasan[i])
            ),
            easyClose = TRUE,
            
            #Footer: Mengubah Tombol "Dismiss" Menjadi "Kembali"
            footer = tags$button(
              type = "button",
              class = "btn btn-secondary",
              `data-dismiss` = "modal", 
              "Kembali")
          ))
        })
      })
    })
  })
  
  #Tim Kami
  output$team_mds <- renderUI({
    team_data <- data.frame(
      nama = c("Adib Roisilmi Abdullah", "Muhammad Rizal", "Baiq Nina Febriati", "Naufalia Alfiryal", "Sely Wakhidah"),
      role = c("Back-End", "Copy Writer", "Front-End", "Designer",  "Database Manager"),
      nim = c("M0501241039", "M0501241085", "M0501241063", "M0501241042", "M0501241038"),
      foto = c("https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/IMG_2028.jpeg?raw=true", "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/Rizal.jpg?raw=true", "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/Nina.jpg?raw=true", "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/Nau.jpg?raw=true", "https://github.com/Adibun-jpg/MDS-Kelompok-3-Data-Novel/blob/Back-End/Images/Sely.jpg?raw=true")
    )
    
    fluidRow(
      
      div(style = "display: grid; 
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
                gap: 20px;
                justify-content: center;
                padding: 10px;",
          
          lapply(1:nrow(team_data), function(i) {
            box(
              width = 12, status = NULL, solidHeader = FALSE,
              style = "border-radius: 10px; 
                padding: 15px; 
                box-shadow: 5px 5px 15px rgba(0,0,0,0.2);
                border: 1px solid #ddd;",
              
              div(style = "display: flex; flex-direction: column; align-items: center; gap: 15px;",
                  
                  # Foto Tim (Ganti dengan foto asli)
                  img(src = team_data$foto[i], width = "120px", height = "180px", 
                      style = "border-radius: 10px; 
                        box-shadow: 3px 3px 10px rgba(0,0,0,0.2); 
                        flex-shrink: 0;
                        display:block; 
                        margin:auto;"),
                  
                  # Informasi Tim
                  div(style = "text-align: center; width: 100%;",
                      h3(team_data$nama[i], style = "font-size: 14px; font-weight: bold;"),
                      p(paste(team_data$role[i]), style = "font-size: 14px;"),
                      p(paste("NIM:", team_data$nim[i]), style = "font-size: 14px;")
                  )
              )
            )
          })
      )
    )
  })
}

# === 6. Menjalankan Aplikasi ===
shinyApp(ui, server)