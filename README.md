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