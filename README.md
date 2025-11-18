# Tugas 7

## Deskripsi Singkat
Aplikasi ini dibuat menggunakan Flutter dengan tema **Football Shop**.  
Aplikasi menampilkan tiga tombol utama:
- **All Products** (warna biru)  
- **My Products** (warna hijau)  
- **Create Product** (warna merah)  

Setiap tombol akan menampilkan pesan `SnackBar` yang berbeda ketika ditekan.

---

## Jawaban Pertanyaan

### 1️⃣ Apa itu *widget tree* pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

**Widget tree** adalah struktur hierarki yang menggambarkan bagaimana widget tersusun dalam aplikasi Flutter.  
Setiap elemen di layar adalah **widget**, dan widget-widget ini saling terhubung membentuk **pohon (tree)** — di mana ada **widget induk (parent)** yang membungkus **widget anak (child)**.  

Contoh:
```dart
Scaffold(
  appBar: AppBar(title: Text("Football Shop")),
  body: Center(
    child: Text("Welcome!"),
  ),
)
```
- `Scaffold` adalah **parent** dari `AppBar` dan `Center`.
- `Center` adalah **parent** dari `Text`.

Hubungan parent-child ini menentukan bagaimana tampilan dibangun dari atas ke bawah.

---

### 2️⃣ Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

| Widget | Fungsi |
|---------|---------|
| `MaterialApp` | Widget utama aplikasi berbasis Material Design, berfungsi sebagai root. |
| `Scaffold` | Menyediakan struktur dasar halaman seperti AppBar, Body, dan Snackbar. |
| `AppBar` | Menampilkan bar di bagian atas aplikasi dengan judul. |
| `Center` | Memposisikan widget anak di tengah layar. |
| `Column` | Menyusun widget anak secara vertikal. |
| `ElevatedButton.icon` | Tombol dengan ikon dan teks yang dapat ditekan. |
| `SnackBar` | Menampilkan pesan sementara di bagian bawah layar. |
| `Icon` | Menampilkan ikon di dalam tombol. |
| `Text` | Menampilkan teks statis. |

---

### 3️⃣ Apa fungsi dari widget `MaterialApp`? Mengapa widget ini sering digunakan sebagai widget root?

`MaterialApp` berfungsi untuk:
- Menyediakan *theme*, *routing*, dan *navigation* bagi seluruh aplikasi.  
- Mengatur *title*, *home widget*, dan konfigurasi dasar aplikasi.  
- Mengaktifkan gaya visual **Material Design** agar tampilan aplikasi konsisten dengan aplikasi Android modern.  

Oleh karena itu, `MaterialApp` sering digunakan sebagai **widget root**, karena semua widget lain di dalamnya dapat memakai komponen Material Design.

---

### 4️⃣ Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?

| Jenis Widget | Ciri | Contoh Penggunaan |
|---------------|------|-------------------|
| **StatelessWidget** | Tidak memiliki *state* yang berubah; tampilannya tetap. | Teks statis, ikon, layout sederhana. |
| **StatefulWidget** | Memiliki *state* yang bisa berubah selama runtime, bisa diperbarui dengan `setState()`. | Tombol interaktif, form input, counter, dll. |

Gunakan:
- **`StatelessWidget`** jika tampilan tidak berubah.
- **`StatefulWidget`** jika tampilan berubah karena interaksi pengguna atau data baru.

---

### 5️⃣ Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?

`BuildContext` adalah objek yang menyimpan informasi tentang **posisi widget dalam widget tree**.  
Flutter menggunakannya untuk:
- Menemukan widget parent atau child tertentu.  
- Menampilkan `SnackBar` menggunakan `ScaffoldMessenger.of(context).showSnackBar()`.  
- Mengakses tema dengan `Theme.of(context)`.

Dalam metode `build`, `BuildContext` digunakan agar widget tahu di mana posisinya berada dan bagaimana tampilannya harus dibangun dalam hierarki widget.

---

### 6️⃣ Jelaskan konsep *hot reload* di Flutter dan bagaimana bedanya dengan *hot restart*.

| Konsep | Penjelasan | Dampak |
|--------|-------------|--------|
| **Hot Reload** | Memperbarui kode aplikasi tanpa menghapus *state* saat ini. Hanya mengganti bagian yang berubah di widget tree. | Cepat; cocok untuk melihat perubahan UI langsung tanpa kehilangan data atau posisi layar. |
| **Hot Restart** | Memulai ulang seluruh aplikasi dari awal, menghapus semua *state* yang tersimpan. | Lebih lambat; semua variabel dan state kembali ke kondisi awal. |

**Singkatnya:**
- Gunakan *hot reload* untuk perubahan kecil (UI, teks, layout).  
- Gunakan *hot restart* jika mengubah logika inisialisasi atau variabel global.

---

### Kesimpulan
Konsep dasar Flutter berpusat pada widget — mulai dari struktur (widget tree), perilaku (state), hingga interaksi (context).  
Pemahaman tentang perbedaan `StatelessWidget`, `StatefulWidget`, dan penggunaan `MaterialApp` akan sangat membantu dalam membangun aplikasi Flutter yang efisien dan mudah dikembangkan.

# Tugas 8
### 1. Perbedaan Navigator.push() dan Navigator.pushReplacement()
- `Navigator.push()`

  Menambahkan halaman baru di atas halaman sebelumnya pada stack navigasi.
  Halaman lama tetap tersimpan dan bisa diakses kembali dengan tombol Back.
  Contoh penggunaan:

  ```Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AddProductFormPage()),
  );
  ```

  Cocok digunakan ketika pengguna masih perlu kembali ke halaman sebelumnya, misalnya dari halaman utama ke halaman form tambah produk.

- `Navigator.pushReplacement()`
  Mengganti halaman saat ini dengan halaman baru (halaman lama dihapus dari stack).
  Tombol Back tidak akan mengembalikan ke halaman lama.

  Contoh penggunaan:

  ```Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
  ```

  Cocok digunakan untuk navigasi permanen seperti berpindah antar halaman lewat `Drawer`, agar halaman tidak menumpuk berulang.

### 2. Hierarchy Widget: Scaffold, AppBar, dan Drawer

Untuk menjaga struktur halaman yang konsisten di seluruh aplikasi, digunakan kombinasi:

```Scaffold(
  appBar: AppBar(title: const Text("The Kitman’s Gallery")),
  drawer: const LeftDrawer(),
  body: ...
)
```


Penjelasan:

- `Scaffold` → menjadi kerangka utama setiap halaman, menyediakan slot untuk `AppBar`, `Drawer`, dan `Body`.
- `AppBar` → menampilkan judul dan elemen navigasi di bagian atas aplikasi secara konsisten.
- `Drawer` → berisi menu navigasi untuk berpindah antar halaman seperti “Halaman Utama” dan “Tambah Produk”.

Dengan struktur ini, setiap halaman memiliki tampilan dan navigasi yang seragam, membuat aplikasi terlihat lebih profesional dan mudah digunakan.

### 3. Kelebihan Padding, SingleChildScrollView, dan ListView dalam Layout Form

Ketiga widget ini membantu menampilkan elemen-elemen form secara rapi dan tetap mudah diakses di layar kecil.

- `Padding`

  Menambahkan jarak antar elemen agar form tidak menempel ke tepi layar.
  Contoh:

  ```Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextFormField(...),
  );
  ```

- `SingleChildScrollView`

  Memungkinkan halaman digulir vertikal, sehingga seluruh form tetap terlihat walau layar kecil.
  Contoh:

  ```SingleChildScrollView(
    child: Column(children: [...]),
  );
  ```

- ListView

  Alternatif untuk menampilkan banyak elemen yang otomatis dapat digulir.
  Namun pada form ini digunakan `SingleChildScrollView` agar struktur Column lebih fleksibel.

  Kelebihan utama:
  Menjaga tata letak form tetap responsif, rapi, dan mudah diisi di berbagai ukuran layar.

### 4. Penyesuaian Warna Tema Aplikasi

Agar aplikasi memiliki identitas visual konsisten, warna tema diatur di file main.dart seperti berikut:

```theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.blueAccent[400]),
  useMaterial3: true,
),
```

Penjelasan:

`primarySwatch: Colors.blue` → menjadi warna utama (brand color) toko.
`secondary: Colors.blueAccent[400]` → digunakan untuk elemen aksen seperti tombol atau ikon aktif.
`useMaterial3: true` → memastikan tampilan modern sesuai standar Material Design terbaru.

Warna biru dipilih untuk memberi kesan profesional, bersih, dan tepercaya, sesuai citra toko olahraga.

### Kesimpulan

Dalam pembuatan aplikasi, saya mempelajari:
Perbedaan dan penggunaan tepat antara `Navigator.push()` dan `Navigator.pushReplacement()`.
Cara menjaga struktur halaman konsisten dengan `Scaffold`, `AppBar`, dan `Drawer`.
Penerapan layout widget seperti `Padding` dan `SingleChildScrollView` agar form nyaman digunakan.
Penyesuaian tema warna agar aplikasi memiliki identitas visual yang kuat dan seragam.

# Tugas 9

## 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

### Mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON?

Kita perlu membuat **Dart Model** (seperti kelas `Product` di `lib/models/product.dart`) karena model berfungsi sebagai **struktur data definitif** yang merepresentasikan data JSON yang masuk (dari Django) atau yang akan dikirim (ke Django).

1.  **Struktur Data Jelas**: Model menyediakan pemetaan yang eksplisit dan terstruktur antara kunci (`key`) di JSON dengan properti (`property`) di Dart, lengkap dengan tipe data yang diharapkan (misalnya, `name` adalah `String`, `price` adalah `int`).
2.  **Kemudahan Konversi**: Model memfasilitasi konversi dua arah yang mudah dan aman antara format JSON (yang berupa *raw text*) dan objek Dart (yang berupa tipe data asli) melalui *factory constructor* seperti `Product.fromJson()` dan metode `toJson()`.

### Konsekuensi jika langsung memetakan `Map<String, dynamic>` tanpa model:

Menggunakan `Map<String, dynamic>` secara langsung (tanpa model) memiliki beberapa konsekuensi negatif, terutama terkait dengan:

* **Validasi Tipe (Type Validation)**:
    * **Konsekuensi**: Tanpa model, kita harus secara manual melakukan *casting* tipe data untuk setiap nilai (`map['price'] as int`). Jika server mengirimkan data dengan tipe yang salah (misalnya, `price` sebagai `String`), aplikasi akan mengalami *runtime error* yang sulit dideteksi (seperti `CastError`).
    * **Dengan Model**: Model Dart memaksa tipe data pada saat konversi (`fromJson`), sehingga kesalahan tipe akan terdeteksi lebih awal, atau *null-safety* akan memastikan penanganan nilai yang hilang.

* **Null-Safety (Null-Safety)**:
    * **Konsekuensi**: Jika sebuah kunci tidak ada dalam `Map<String, dynamic>`, mengaksesnya akan mengembalikan `null`, yang jika tidak ditangani dapat menyebabkan *runtime error* (`Null safety error`).
    * **Dengan Model**: Model Dart yang menggunakan *null-safety* (`required` atau `?`) memastikan bahwa properti yang wajib harus ada, atau compiler akan mengingatkan kita untuk menangani properti yang bersifat opsional (`?`).

* **Maintainability (Maintainability)**:
    * **Konsekuensi**: Menggunakan `Map<String, dynamic>` di seluruh kode akan membuat aplikasi sulit dibaca dan dipelihara. Setiap kali struktur data JSON berubah (misalnya, nama kunci diubah dari `description` menjadi `detail`), kita harus mencari dan mengubahnya secara manual di setiap file yang menggunakan kunci tersebut.
    * **Dengan Model**: Perubahan struktur hanya perlu dilakukan satu kali di file model (`lib/models/product.dart`), dan *compiler* Dart akan menunjukkan di mana saja kode lain perlu diperbarui, meningkatkan *refactoring* dan *maintainability*.

***

## 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

### Apa fungsi package `http` dan `CookieRequest` dalam tugas ini?

* **Package `http`**: Adalah paket dasar resmi Dart untuk melakukan permintaan HTTP (seperti GET, POST, PUT, DELETE) ke server *web*. Fungsinya adalah menangani lapisan komunikasi jaringan dasar, mengirim data, dan menerima respons.
* **Package `CookieRequest` (`pbp_django_auth`)**: Adalah *wrapper* di atas `http` yang dirancang khusus untuk mengelola sesi dan autentikasi dengan server Django. Fungsi utamanya adalah secara otomatis menangani dan mengirimkan **CSRF Token** dan **Session Cookies** pada setiap permintaan.

### Perbedaan peran `http` vs `CookieRequest`:

| Fitur | `http` Package | `CookieRequest` (dari `pbp_django_auth`) |
| :--- | :--- | :--- |
| **Peran Dasar** | Melakukan permintaan jaringan mentah (GET/POST). | Melakukan permintaan jaringan yang *aware* terhadap sesi Django. |
| **Cookie/Session**| Tidak menyimpan atau mengirimkan *cookies* secara otomatis. | **Secara otomatis** menyimpan dan mengirimkan *session cookies* untuk menjaga status *login*. |
| **Autentikasi** | Membutuhkan implementasi manual untuk mengirim *header* atau *token* autentikasi. | Secara otomatis menangani **CSRF Token** dan mengelola status `loggedIn`. |
| **Penerapan** | Digunakan untuk permintaan tanpa sesi/otentikasi. | Digunakan untuk operasi yang memerlukan *login* (login, register, logout, tambah produk, akses daftar produk pengguna). |

***

## 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

### Mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter?

*Instance* `CookieRequest` perlu dibagikan ke seluruh aplikasi (melalui `Provider` di `lib/main.dart`) karena ia bertindak sebagai **manajer sesi (Session Manager) terpusat**.

1.  **Memelihara Status Login**: Setelah pengguna berhasil *login*, `CookieRequest` menyimpan *session cookie* yang diberikan oleh Django. *Cookie* ini harus disertakan dalam **setiap** permintaan berikutnya (GET/POST) ke *endpoint* yang memerlukan autentikasi (misalnya, `/create-flutter/` atau `/auth/logout/`).
2.  **Akses Terpusat**: Dengan membagikan satu *instance* melalui `Provider`, semua widget, dari `LoginPage` hingga `LeftDrawer` dan *form* produk, dapat mengakses status *login* (`request.loggedIn`) dan menggunakan metodenya (`request.postJson`, `request.logout`) tanpa harus meneruskannya secara manual melalui konstruktor, yang sangat menyederhanakan kode dan menjaga konsistensi sesi.

***

## 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

### Konfigurasi Konektivitas yang diperlukan:

1.  **`10.0.2.2` pada `ALLOWED_HOSTS`**:
    * **Mengapa**: Dalam lingkungan pengembangan, Android Emulator menganggap **`10.0.2.2`** sebagai alamat IP dari **Host Machine** (komputer Anda) yang menjalankan server Django. Server Django yang berjalan di `localhost:8000` (atau `127.0.0.1:8000`) tidak dapat diakses langsung oleh emulator menggunakan `localhost`.
    * **Konsekuensi Jika Salah**: Jika `10.0.2.2` tidak ditambahkan ke `ALLOWED_HOSTS` di Django, server akan mengembalikan respons *Forbidden* (HTTP 403) ketika permintaan datang dari emulator, karena Django menganggap *host* tersebut tidak aman (ketika `DEBUG=False`).

2.  **CORS (Cross-Origin Resource Sharing) dan Pengaturan SameSite/Cookie**:
    * **Mengapa**:
        * **CORS**: Diperlukan untuk mengizinkan permintaan lintas *origin* (misalnya, dari aplikasi Flutter yang berjalan di emulator/perangkat ke server Django) . Untuk autentikasi, seringkali diperlukan pengaturan seperti `CORS_ALLOW_CREDENTIALS = True`.
        * **SameSite/Cookie**: Pengaturan Django seperti `CSRF_COOKIE_SAMESITE = 'None'` dan `SESSION_COOKIE_SAMESITE = 'None'` (bersamaan dengan *secure* *cookie*) diperlukan saat menggunakan `pbp_django_auth` dari klien yang berbeda *origin* (seperti Flutter). Ini memastikan *browser* (atau klien HTTP *native* seperti di Flutter) akan mengirim *cookie* autentikasi lintas *origin* untuk mempertahankan sesi.
    * **Konsekuensi Jika Salah**: Aplikasi Flutter akan mengalami kesalahan CORS (permintaan diblokir oleh *browser*/server) atau sesi tidak akan dipertahankan karena *cookie* ditolak atau tidak dikirimkan.

3.  **Izin Akses Internet di Android**:
    * **Mengapa**: Aplikasi Android secara *default* tidak diizinkan untuk melakukan operasi jaringan. Izin `<uses-permission android:name="android.permission.INTERNET" />` harus ditambahkan ke `AndroidManifest.xml` agar aplikasi dapat berkomunikasi dengan internet/server.
    * **Konsekuensi Jika Salah**: Aplikasi akan gagal membuat koneksi HTTP ke server Django dengan galat `SocketException: Connection refused` atau galat jaringan lainnya, dan *hot reload* mungkin juga terpengaruh.

***

## 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman data, seperti saat menambahkan produk baru, melibatkan alur *client-server* sebagai berikut:

1.  **Input Data (Flutter)**: Pengguna memasukkan data produk (`name`, `price`, `description`, dll.) melalui *form* (`ProductFormPage`). Data disimpan sementara dalam variabel *state*.
2.  **Validasi Lokal (Flutter)**: Ketika tombol *Save* ditekan, *form* divalidasi secara lokal untuk memastikan data tidak kosong (misalnya, `_name` dan `_price` tidak boleh kosong).
3.  **Pengiriman Data (Flutter)**: Data diletakkan dalam format `Map<String, dynamic>`, kemudian diubah menjadi string JSON menggunakan `jsonEncode()`. Objek `CookieRequest` yang sudah mengelola sesi digunakan untuk mengirim permintaan **POST** ke *endpoint* Django (`/create-flutter/`).
4.  **Penerimaan dan Pemrosesan (Django)**: Server Django menerima *request* POST. Ia memvalidasi CSRF *token* dan *session cookie* (autentikasi). Data JSON di-*parse*, divalidasi, dan objek produk baru dibuat (atau disimpan) dalam *database*.
5.  **Respons (Django)**: Django merespons dengan JSON yang menunjukkan status operasi (misalnya, `{'status': 'success'}`).
6.  **Pembaruan UI (Flutter)**: Flutter menerima respons. Jika statusnya 'success', pesan notifikasi ditampilkan (`SnackBar`), dan pengguna dinavigasi ke halaman utama (`MyHomePage`), memungkinkan pembaruan data produk untuk dimuat di halaman selanjutnya.
7.  **Menampilkan Data (Flutter)**: Data produk dari Django (melalui *endpoint* JSON) diambil menggunakan `request.get()`, di-*decode* menjadi `List<Product>` (menggunakan `productFromJson` di `lib/models/product.dart`), dan ditampilkan di `ProductListPage` atau `MyProductListPage` menggunakan widget `ProductCard`.

***

## 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Mekanisme autentikasi menggunakan `pbp_django_auth` bekerja sebagai berikut:

### Login

1.  **Input (Flutter)**: Pengguna memasukkan `username` dan `password` di `LoginPage`.
2.  **Pengiriman (Flutter)**: Metode `request.login()` dipanggil, mengirim *request* POST ke *endpoint* `/auth/login/` Django dengan kredensial.
3.  **Pemrosesan (Django)**: Django memverifikasi kredensial. Jika berhasil, ia membuat sesi dan mengirimkan **Session Cookie** dan **CSRF Token** dalam respons.
4.  **Penyimpanan Sesi (Flutter)**: `CookieRequest` (otomatis) menyimpan *Session Cookie* dan CSRF *Token* serta mengatur properti `request.loggedIn` menjadi `true`.
5.  **Penyelesaian (Flutter)**: Aplikasi menavigasi pengguna ke `MyHomePage` dan menampilkan pesan sukses.

### Register

1.  **Input (Flutter)**: Pengguna memasukkan `username`, `password1`, dan `password2` di `RegisterPage`.
2.  **Pengiriman (Flutter)**: Data dikirimkan sebagai JSON melalui `request.postJson()` ke *endpoint* `/auth/register/` Django.
3.  **Pemrosesan (Django)**: Django memvalidasi data (misalnya, kecocokan *password*). Jika berhasil, akun baru dibuat dan status 'success' dikembalikan.
4.  **Penyelesaian (Flutter)**: Aplikasi menavigasi pengguna kembali ke `LoginPage`.

### Logout

1.  **Aksi (Flutter)**: Pengguna menekan tombol *Logout* di `LeftDrawer`.
2.  **Pengiriman (Flutter)**: Metode `request.logout()` dipanggil, mengirim *request* POST ke *endpoint* `/auth/logout/` Django. `CookieRequest` secara otomatis mengirim *Session Cookie* dan CSRF *Token* yang valid.
3.  **Pemrosesan (Django)**: Django membatalkan sesi tersebut.
4.  **Penyelesaian (Flutter)**: `CookieRequest` menghapus *cookie* yang tersimpan, mengatur `request.loggedIn` menjadi `false`, dan aplikasi menavigasi pengguna ke `LoginPage`.

***

## 7. Langkah-langkah Implementasi Tugas

Berikut adalah langkah-langkah implementasi fitur yang tercantum dalam tugas, termasuk perubahan terakhir yang diminta:

### A. Pengaturan dan Pemodelan Data

1.  **Model Dart Dibuat**: Membuat *class* `Product` di `lib/models/product.dart` yang memetakan semua *field* JSON dari Django (misalnya, `id`, `name`, `price`, `isFeatured`), termasuk *factory constructor* `Product.fromJson()` untuk deserialisasi JSON.
2.  **Konfigurasi `CookieRequest`**: Menggunakan `Provider` di `lib/main.dart` untuk membuat satu *instance* `CookieRequest` dan membagikannya ke seluruh *widget tree*.

### B. Implementasi Autentikasi

1.  **Halaman Login & Register**: Menerapkan `LoginPage` dan `RegisterPage` dengan *form* input yang terhubung ke `TextEditingController`.
2.  **Integrasi Login/Register**: Menggunakan `context.watch<CookieRequest>()` untuk mendapatkan *instance* `request` dan memanggil `request.login()` atau `request.postJson()` (untuk *register*) ke *endpoint* Django yang sesuai.
3.  **Logout**: Menambahkan tombol *Logout* di `LeftDrawer` yang memanggil `request.logout()` dan menavigasi ke `LoginPage`.

### C. Navigasi dan Tampilan Data

1.  **Halaman Daftar Produk (`ProductListPage`)**: Menerapkan `FutureBuilder` yang memanggil `fetchProduct(request)` untuk mengambil semua data produk dari *endpoint* JSON Django (`/json/`) dan menampilkan hasilnya menggunakan `ProductCard`.
2.  **Halaman Produk Saya (`MyProductListPage`)**: Menerapkan halaman serupa dengan filter tambahan di `fetchProduct` untuk hanya menampilkan produk di mana `d['username'] == request.jsonData['username']` (produk milik pengguna yang sedang *login*).
3.  **Halaman Detail Produk (`ProductDetailPage`)**: Menerima objek `Product` melalui konstruktor dan menampilkannya, termasuk fitur seperti format harga menggunakan `NumberFormat` dan penanganan *image* *thumbnail*.
4.  **Navigasi Lintas Halaman**:
    * **Dari Daftar ke Detail**: Menambahkan `onTap` pada `ProductCard` untuk memanggil `Navigator.push` ke `ProductDetailPage`. (Tombol kembali otomatis tersedia).
    * **Akses *My Product* dari *Drawer***: Menambahkan `ListTile` *My Product List* di `LeftDrawer` yang mengarahkan ke `MyProductListPage`.

### D. Pengaturan Halaman Awal

1.  **Penentu Layar Awal**: Membuat *widget* `InitialScreenDeterminer` di `lib/main.dart`.
2.  **Pengecekan *Cookie***: Di dalam `InitialScreenDeterminer`, menggunakan `context.watch<CookieRequest>()` dan logika kondisional: jika `request.loggedIn` adalah `true`, tampilkan `MyHomePage`; jika `false`, tampilkan `LoginPage`. Hal ini membuat aplikasi langsung ke halaman *login* jika tidak ada sesi yang tersimpan.